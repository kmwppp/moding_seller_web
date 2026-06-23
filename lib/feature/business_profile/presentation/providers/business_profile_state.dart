import 'package:moding_seller_web/feature/business_profile/domain/entities/business_profile.dart';
import 'package:moding_seller_web/feature/business_profile/domain/entities/my_account_info.dart';
import 'package:moding_seller_web/feature/business_profile/domain/entities/refund_account_info.dart';
import 'package:moding_seller_web/feature/business_profile/domain/entities/seller_profile_info.dart';

class BusinessProfileState {
  const BusinessProfileState({
    required this.isInitialized,
    required this.isLoading,
    required this.isReauthSubmitting,
    required this.needsReauth,
    required this.isUpdatingHanjinContract,
    required this.accountInfo,
    required this.profile,
    required this.sellerProfile,
    required this.refundAccount,
  });

  factory BusinessProfileState.initial() {
    return const BusinessProfileState(
      isInitialized: false,
      isLoading: false,
      isReauthSubmitting: false,
      needsReauth: true,
      isUpdatingHanjinContract: false,
      accountInfo: null,
      profile: null,
      sellerProfile: null,
      refundAccount: null,
    );
  }

  final bool isInitialized;
  final bool isLoading;
  final bool isReauthSubmitting;
  final bool needsReauth;
  final bool isUpdatingHanjinContract;
  final MyAccountInfo? accountInfo;
  final BusinessProfile? profile;
  final SellerProfileInfo? sellerProfile;
  final RefundAccountInfo? refundAccount;

  BusinessProfileState copyWith({
    bool? isInitialized,
    bool? isLoading,
    bool? isReauthSubmitting,
    bool? needsReauth,
    bool? isUpdatingHanjinContract,
    MyAccountInfo? accountInfo,
    BusinessProfile? profile,
    SellerProfileInfo? sellerProfile,
    RefundAccountInfo? refundAccount,
    bool clearAccountInfo = false,
    bool clearProfile = false,
    bool clearSellerProfile = false,
    bool clearRefundAccount = false,
  }) {
    return BusinessProfileState(
      isInitialized: isInitialized ?? this.isInitialized,
      isLoading: isLoading ?? this.isLoading,
      isReauthSubmitting: isReauthSubmitting ?? this.isReauthSubmitting,
      needsReauth: needsReauth ?? this.needsReauth,
      isUpdatingHanjinContract:
          isUpdatingHanjinContract ?? this.isUpdatingHanjinContract,
      accountInfo: clearAccountInfo ? null : (accountInfo ?? this.accountInfo),
      profile: clearProfile ? null : (profile ?? this.profile),
      sellerProfile: clearSellerProfile
          ? null
          : (sellerProfile ?? this.sellerProfile),
      refundAccount: clearRefundAccount
          ? null
          : (refundAccount ?? this.refundAccount),
    );
  }
}
