import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moding_president_web/core/constants/app_colors.dart';
import 'package:moding_president_web/core/constants/app_responsive_layout.dart';
import 'package:moding_president_web/core/presentation/dialogs/app_dialogs.dart';
import 'package:moding_president_web/core/presentation/widgets/loading_indicator.dart';
import 'package:moding_president_web/core/theme/app_text_styles.dart';
import 'package:moding_president_web/feature/business_profile/presentation/providers/business_profile_viewmodel.dart';
import 'package:moding_president_web/feature/business_profile/presentation/widgets/business_profile_account_info_card.dart';
import 'package:moding_president_web/feature/business_profile/presentation/widgets/business_profile_account_management_card.dart';
import 'package:moding_president_web/feature/business_profile/presentation/widgets/business_profile_hanjin_contract_card.dart';
import 'package:moding_president_web/feature/business_profile/presentation/widgets/business_profile_info_card.dart';
import 'package:moding_president_web/feature/business_profile/presentation/widgets/business_profile_seller_info_card.dart';
import 'package:moding_president_web/feature/business_profile/presentation/widgets/business_profile_support_section.dart';
import 'package:moding_president_web/feature/business_profile/presentation/widgets/hanjin_contract_input_dialog.dart';
import 'package:moding_president_web/feature/notification/presentation/widgets/notification_bell_button.dart';
import 'package:moding_president_web/feature/reauth/presentation/widgets/reauth_required_card.dart';
import 'package:moding_president_web/feature/support/domain/enums/support_center_type.dart';

class BusinessProfileManagementPage extends ConsumerStatefulWidget {
  const BusinessProfileManagementPage({super.key});

  @override
  ConsumerState<BusinessProfileManagementPage> createState() =>
      _BusinessProfileManagementPageState();
}

class _BusinessProfileManagementPageState
    extends ConsumerState<BusinessProfileManagementPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(businessProfileViewModelProvider.notifier).initialize();
    });
  }

  void _openSupport(SupportCenterType type) {
    final location = type == SupportCenterType.notice
        ? '/support/notices'
        : '/support/faqs';
    context.push(location);
  }

  Future<void> _loadProfileAfterReauth() async {
    final message = await ref
        .read(businessProfileViewModelProvider.notifier)
        .loadProfileAfterReauth();

    if (!mounted || message == null || message.isEmpty) {
      return;
    }

    await AppDialog.showError(context, message);
  }

  Future<void> _openHanjinContractDialog() async {
    final currentValue = ref
        .read(businessProfileViewModelProvider)
        .sellerProfile
        ?.hanjinContractNo;
    final result = await showDialog<String>(
      context: context,
      builder: (_) => HanjinContractInputDialog(initialValue: currentValue),
    );

    if (!mounted || result == null) {
      return;
    }

    final message = await ref
        .read(businessProfileViewModelProvider.notifier)
        .updateHanjinContract(result);

    if (!mounted) {
      return;
    }

    if (message == null) {
      await AppDialog.showSuccess(context, '한진 택배코드를 저장했습니다.');
      return;
    }

    await AppDialog.showError(context, message);
  }

  Future<void> _openSellerProfileEditPage() async {
    final result = await context.push<bool>(
      '/seller-profile/edit',
      extra: ref.read(businessProfileViewModelProvider).sellerProfile,
    );

    if (!mounted || result != true) {
      return;
    }

    final message = await ref
        .read(businessProfileViewModelProvider.notifier)
        .loadProfileAfterReauth();

    if (!mounted || message == null || message.isEmpty) {
      return;
    }

    await AppDialog.showError(context, message);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(businessProfileViewModelProvider);
    final isDesktop = AppResponsiveLayout.isDesktop(context);
    final size = MediaQuery.of(context).size;
    final Widget content;

    if (!state.isInitialized || state.isLoading) {
      content = Padding(
        padding: EdgeInsets.all(isDesktop ? 120 : 48),
        child: const LoadingIndicator(),
      );
    } else if (state.needsReauth) {
      content = ReauthRequiredCard(
        title: '비밀번호 재확인',
        description: '판매자 프로필 관리는 재인증 키가 필요합니다. 비밀번호를 다시 입력한 뒤 계속 진행해주세요.',
        buttonLabel: '사업자 정보 확인',
        onSuccess: _loadProfileAfterReauth,
      );
    } else if (state.accountInfo == null || state.profile == null) {
      content = Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: const Color(0xFFFFFBF4),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFF1D7A8)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '프로필 정보를 불러오지 못했습니다.',
              style: context.bodyLarge.copyWith(fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 8),
            Text(
              '잠시 후 다시 시도해주세요. 문제가 계속되면 응답 구조가 변경되었는지 함께 확인해보는 게 좋습니다.',
              style: context.body.copyWith(
                color: AppColors.darkGrey,
                height: 1.45,
              ),
            ),
          ],
        ),
      );
    } else {
      content = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BusinessProfileAccountInfoCard(accountInfo: state.accountInfo),
          const SizedBox(height: 16),
          BusinessProfileInfoCard(profile: state.profile!),
          const SizedBox(height: 16),
          BusinessProfileSellerInfoCard(
            sellerProfile: state.sellerProfile,
            onEditPressed: _openSellerProfileEditPage,
          ),
          const SizedBox(height: 16),
          BusinessProfileAccountManagementCard(
            refundAccount: state.refundAccount,
          ),
          const SizedBox(height: 16),
          BusinessProfileHanjinContractCard(
            contractNo: state.sellerProfile?.hanjinContractNo,
            isSubmitting: state.isUpdatingHanjinContract,
            onPressed: _openHanjinContractDialog,
          ),
          const SizedBox(height: 16),
          BusinessProfileSupportSection(onOpenSupport: _openSupport),
        ],
      );
    }

    return SafeArea(
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: size.height),
          child: Padding(
            padding: isDesktop
                ? const EdgeInsets.all(24)
                : const EdgeInsets.fromLTRB(16, 16, 16, 24),
            child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '판매자 프로필 관리',
                                style: context.title.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '사업자 정보를 확인하려면 비밀번호 재인증이 필요합니다.',
                                style: context.body.copyWith(
                                  color: AppColors.darkGrey,
                                  height: 1.45,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (isDesktop)
                          const Column(
                            children: [
                              NotificationBellButton(),
                              SizedBox(height: 14),
                            ],
                          ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    content,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
