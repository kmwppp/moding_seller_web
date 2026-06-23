import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_seller_web/core/constants/app_colors.dart';
import 'package:moding_seller_web/core/constants/app_responsive_layout.dart';
import 'package:moding_seller_web/core/presentation/dialogs/app_dialogs.dart';
import 'package:moding_seller_web/core/presentation/widgets/loading_indicator.dart';
import 'package:moding_seller_web/core/presentation/widgets/modal/web_bottom_sheet.dart';
import 'package:moding_seller_web/core/services/token_storage.dart';
import 'package:moding_seller_web/core/theme/app_input_decoration.dart';
import 'package:moding_seller_web/core/theme/app_text_styles.dart';
import 'package:moding_seller_web/feature/business_profile/data/repositories/business_profile_repository.dart';
import 'package:moding_seller_web/feature/business_profile/domain/entities/bank_code_option.dart';
import 'package:moding_seller_web/feature/business_profile/domain/entities/seller_profile_document.dart';
import 'package:moding_seller_web/feature/business_profile/domain/entities/seller_profile_edit_file.dart';
import 'package:moding_seller_web/feature/business_profile/domain/entities/seller_profile_info.dart';
import 'package:moding_seller_web/feature/business_profile/domain/entities/seller_profile_update_request.dart';
import 'package:moding_seller_web/feature/business_profile/presentation/utils/business_profile_formatters.dart';
import 'package:moding_seller_web/feature/business_profile/presentation/utils/seller_profile_edit_constants.dart';
import 'package:moding_seller_web/feature/business_profile/presentation/widgets/business_profile_file_field.dart';
import 'package:moding_seller_web/feature/business_profile/presentation/widgets/business_profile_option_selector_sheet.dart';

class SellerProfileEditPage extends ConsumerStatefulWidget {
  const SellerProfileEditPage({super.key, this.initialSellerProfile});

  final SellerProfileInfo? initialSellerProfile;

  @override
  ConsumerState<SellerProfileEditPage> createState() =>
      _SellerProfileEditPageState();
}

class _SellerProfileEditPageState extends ConsumerState<SellerProfileEditPage> {
  final _bankAccountNumberController = TextEditingController();
  final _bankAccountHolderController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isLoading = true;
  bool _isSubmitting = false;
  String? _selectedTaxType;
  String? _selectedBankCode;
  List<BankCodeOption> _bankOptions = const [];
  SellerProfileEditFile? _bankbookFile;
  List<SellerProfileEditFile> _businessPermitFiles = const [];
  List<SellerProfileEditFile> _mailOrderSalesReportFiles = const [];
  List<SellerProfileEditFile> _haccpCertificateFiles = const [];
  List<SellerProfileEditFile> _otherFiles = const [];

  @override
  void initState() {
    super.initState();
    _selectedTaxType = widget.initialSellerProfile?.taxType;
    _selectedBankCode = widget.initialSellerProfile?.bankCode;
    _bankAccountNumberController.text =
        widget.initialSellerProfile?.bankAccountNumber ?? '';
    _bankAccountHolderController.text =
        widget.initialSellerProfile?.bankAccountHolder ?? '';
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initialize();
    });
  }

  @override
  void dispose() {
    _bankAccountNumberController.dispose();
    _bankAccountHolderController.dispose();
    super.dispose();
  }

  Future<void> _initialize() async {
    try {
      final repository = ref.read(businessProfileRepositoryProvider);
      final bankOptions = await repository.getBankCodeOptions();
      final initialDocuments =
          widget.initialSellerProfile?.documents ?? const [];
      final bankbookFile = await _loadSingleDocumentFile(
        repository,
        _documentsByType(initialDocuments, 'BANKBOOK'),
      );
      final businessPermitFiles = await _loadDocumentFiles(
        repository,
        _documentsByType(initialDocuments, 'BUSINESS_PERMIT'),
      );
      final mailOrderSalesReportFiles = await _loadDocumentFiles(
        repository,
        _documentsByType(initialDocuments, 'MAIL_ORDER_SALES_REPORT'),
      );
      final haccpCertificateFiles = await _loadDocumentFiles(
        repository,
        _documentsByType(initialDocuments, 'HACCP_CERTIFICATE'),
      );
      final otherFiles = await _loadDocumentFiles(
        repository,
        _documentsByType(initialDocuments, 'OTHER'),
      );
      if (!mounted) {
        return;
      }

      setState(() {
        _bankOptions = bankOptions;
        _bankbookFile = bankbookFile;
        _businessPermitFiles = businessPermitFiles;
        _mailOrderSalesReportFiles = mailOrderSalesReportFiles;
        _haccpCertificateFiles = haccpCertificateFiles;
        _otherFiles = otherFiles;
        _isLoading = false;
      });
    } catch (_) {
      if (!mounted) {
        return;
      }

      setState(() {
        _isLoading = false;
      });
      await AppDialog.showError(context, '은행 목록을 불러오지 못했습니다.');
    }
  }

  List<SellerProfileDocument> _documentsByType(
    List<SellerProfileDocument> documents,
    String type,
  ) {
    return documents.where((doc) => doc.documentType == type).toList();
  }

  Future<List<SellerProfileEditFile>> _loadDocumentFiles(
    BusinessProfileRepository repository,
    List<SellerProfileDocument> documents,
  ) async {
    if (documents.isEmpty) {
      return const [];
    }

    final files = await Future.wait(
      documents.asMap().entries.map((entry) async {
        try {
          return await repository.downloadDocumentFile(
            entry.value,
            index: entry.key,
          );
        } catch (_) {
          return null;
        }
      }),
    );

    return files.whereType<SellerProfileEditFile>().toList();
  }

  Future<SellerProfileEditFile?> _loadSingleDocumentFile(
    BusinessProfileRepository repository,
    List<SellerProfileDocument> documents,
  ) async {
    final files = await _loadDocumentFiles(repository, documents);
    if (files.isEmpty) {
      return null;
    }
    return files.first;
  }

  Future<void> _pickSingleFile(
    void Function(SellerProfileEditFile?) setter,
  ) async {
    final result = await FilePicker.platform.pickFiles(withData: true);
    if (result == null || result.files.isEmpty) {
      return;
    }

    final file = result.files.first;
    if (file.bytes == null) {
      return;
    }

    setState(() {
      setter(SellerProfileEditFile(fileName: file.name, bytes: file.bytes!));
    });
  }

  Future<void> _pickMultipleFiles(
    List<SellerProfileEditFile> currentFiles,
    void Function(List<SellerProfileEditFile> files) setter,
  ) async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      withData: true,
    );
    if (result == null || result.files.isEmpty) {
      return;
    }

    final files = result.files
        .where((file) => file.bytes != null)
        .map(
          (file) =>
              SellerProfileEditFile(fileName: file.name, bytes: file.bytes!),
        )
        .toList();

    if (files.isEmpty) {
      return;
    }

    setState(() {
      setter([...currentFiles, ...files]);
    });
  }

  Future<void> _openTaxTypeSheet() async {
    final selected = await WebBottomSheet.show<BusinessProfileOptionItem>(
      context: context,
      title: '과세유형 선택',
      child: BusinessProfileOptionSelectorSheet(
        items: sellerTaxTypeOptions
            .map(
              (item) => BusinessProfileOptionItem(
                value: item['value']!,
                label: item['label']!,
              ),
            )
            .toList(),
        selectedValue: _selectedTaxType,
      ),
    );

    if (selected == null) {
      return;
    }

    setState(() {
      _selectedTaxType = selected.value;
    });
  }

  Future<void> _openBankSheet() async {
    final selected = await WebBottomSheet.show<BusinessProfileOptionItem>(
      context: context,
      title: '은행 선택',
      child: BusinessProfileOptionSelectorSheet(
        items: _bankOptions
            .map(
              (item) => BusinessProfileOptionItem(
                value: item.value,
                label: item.label,
              ),
            )
            .toList(),
        selectedValue: _selectedBankCode,
      ),
    );

    if (selected == null) {
      return;
    }

    setState(() {
      _selectedBankCode = selected.value;
    });
  }

  Future<void> _submit() async {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      return;
    }

    if ((_selectedTaxType ?? '').trim().isEmpty) {
      await AppDialog.showError(context, '과세유형을 선택해주세요.');
      return;
    }

    if ((_selectedBankCode ?? '').trim().isEmpty) {
      await AppDialog.showError(context, '은행명을 선택해주세요.');
      return;
    }

    if (_bankbookFile == null) {
      await AppDialog.showError(context, '통장사본을 첨부해주세요.');
      return;
    }

    if (_businessPermitFiles.isEmpty) {
      await AppDialog.showError(context, '영업허가증을 첨부해주세요.');
      return;
    }

    final reauthKey = await ref.read(tokenStorageProvider).getReauthKey();
    if (!mounted) {
      return;
    }

    if (reauthKey == null || reauthKey.trim().isEmpty) {
      await AppDialog.showError(context, '재인증 키를 찾을 수 없습니다. 다시 인증해주세요.');
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    try {
      final repository = ref.read(businessProfileRepositoryProvider);
      final request = SellerProfileUpdateRequest(
        taxType: _selectedTaxType!.trim(),
        bankCode: _selectedBankCode!.trim(),
        bankAccountNumber: _bankAccountNumberController.text.trim(),
        bankAccountHolder: _bankAccountHolderController.text.trim(),
        bankbook: _bankbookFile,
        businessPermits: _businessPermitFiles,
        mailOrderSalesReports: _mailOrderSalesReportFiles,
        haccpCertificates: _haccpCertificateFiles,
        otherFiles: _otherFiles,
      );

      await repository.updateMySellerProfile(
        reauthKey: reauthKey.trim(),
        request: request,
      );

      if (!mounted) {
        return;
      }

      await AppDialog.showSuccess(context, '판매자 정보 변경 신청이 완료되었습니다.');
      if (!mounted) {
        return;
      }
      Navigator.of(context).pop(true);
    } catch (_) {
      if (!mounted) {
        return;
      }
      await AppDialog.showError(context, '판매자 정보 변경 신청에 실패했습니다.');
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  String _resolveTaxLabel() {
    return sellerTaxTypeOptions.firstWhere(
          (item) => item['value'] == (_selectedTaxType ?? ''),
          orElse: () => const {'label': ''},
        )['label'] ??
        mapTaxTypeLabel(_selectedTaxType);
  }

  String _resolveBankLabel() {
    for (final option in _bankOptions) {
      if (option.value == _selectedBankCode) {
        return option.label;
      }
    }
    return valueOrDash(widget.initialSellerProfile?.bankName);
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = AppResponsiveLayout.isDesktop(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: isDesktop
              ? const EdgeInsets.all(24)
              : const EdgeInsets.fromLTRB(16, 16, 16, 24),
          child: Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.of(context).maybePop(),
                        icon: const Icon(Icons.arrow_back_ios_new_rounded),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        visualDensity: VisualDensity.compact,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '판매자 정보 수정',
                              style: context.title.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              '실제 사업자 정보 및 인허가 사항의 서류가 일치해야 하며, 허위·위조·변조 서류 제출 시 판매 제한 또는 정산 보류가 발생할 수 있습니다.',
                              style: context.body.copyWith(
                                color: AppColors.pointColor,
                                height: 1.45,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  if (_isLoading)
                    const SizedBox(
                      height: 320,
                      child: Center(child: LoadingIndicator()),
                    )
                  else
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _SelectField(
                            label: '과세유형',
                            value: _resolveTaxLabel(),
                            isPlaceholder: (_selectedTaxType ?? '').isEmpty,
                            onTap: _openTaxTypeSheet,
                          ),
                          const SizedBox(height: 16),
                          _SelectField(
                            label: '은행명',
                            value: _resolveBankLabel(),
                            isPlaceholder: (_selectedBankCode ?? '').isEmpty,
                            onTap: _openBankSheet,
                          ),
                          const SizedBox(height: 16),
                          _TextFieldGroup(
                            label: '계좌 번호',
                            controller: _bankAccountNumberController,
                            hintText: '계좌 번호를 입력해주세요.',
                          ),
                          const SizedBox(height: 16),
                          _TextFieldGroup(
                            label: '예금주 명',
                            controller: _bankAccountHolderController,
                            hintText: '예금주 명을 입력해주세요.',
                          ),
                          const SizedBox(height: 16),
                          BusinessProfileFileField(
                            label: '통장사본 (필수)',
                            file: _bankbookFile,
                            onTap: () => _pickSingleFile((file) {
                              _bankbookFile = file;
                            }),
                            onRemove: () {
                              setState(() {
                                _bankbookFile = null;
                              });
                            },
                          ),
                          const SizedBox(height: 16),
                          BusinessProfileFileField(
                            label: '영업허가증 (필수)',
                            files: _businessPermitFiles,
                            allowMultiple: true,
                            onTap: () => _pickMultipleFiles(
                              _businessPermitFiles,
                              (files) {
                                _businessPermitFiles = files;
                              },
                            ),
                            onRemoveAt: (index) {
                              setState(() {
                                final updated =
                                    List<SellerProfileEditFile>.from(
                                      _businessPermitFiles,
                                    )..removeAt(index);
                                _businessPermitFiles = updated;
                              });
                            },
                          ),
                          const SizedBox(height: 16),
                          BusinessProfileFileField(
                            label: '통신판매업신고증 (선택)',
                            files: _mailOrderSalesReportFiles,
                            allowMultiple: true,
                            onTap: () => _pickMultipleFiles(
                              _mailOrderSalesReportFiles,
                              (files) {
                                _mailOrderSalesReportFiles = files;
                              },
                            ),
                            onRemoveAt: (index) {
                              setState(() {
                                final updated =
                                    List<SellerProfileEditFile>.from(
                                      _mailOrderSalesReportFiles,
                                    )..removeAt(index);
                                _mailOrderSalesReportFiles = updated;
                              });
                            },
                          ),
                          const SizedBox(height: 16),
                          BusinessProfileFileField(
                            label: 'HACCP 인증서 (선택)',
                            subLabel:
                                'HACCP 허위 인증서 제출 시 판매 제한·정산 보류 및 관련 법적 책임이 발생할 수 있습니다.',
                            files: _haccpCertificateFiles,
                            allowMultiple: true,
                            onTap: () => _pickMultipleFiles(
                              _haccpCertificateFiles,
                              (files) {
                                _haccpCertificateFiles = files;
                              },
                            ),
                            onRemoveAt: (index) {
                              setState(() {
                                final updated =
                                    List<SellerProfileEditFile>.from(
                                      _haccpCertificateFiles,
                                    )..removeAt(index);
                                _haccpCertificateFiles = updated;
                              });
                            },
                          ),
                          const SizedBox(height: 16),
                          BusinessProfileFileField(
                            label: '기타증빙서류',
                            subLabel:
                                '수입업, 주류면허, 중매인, 도소매허가 등 판매 자격 증빙에 필요한 서류를 첨부해 주세요.',
                            files: _otherFiles,
                            allowMultiple: true,
                            onTap: () =>
                                _pickMultipleFiles(_otherFiles, (files) {
                                  _otherFiles = files;
                                }),
                            onRemoveAt: (index) {
                              setState(() {
                                final updated =
                                    List<SellerProfileEditFile>.from(
                                      _otherFiles,
                                    )..removeAt(index);
                                _otherFiles = updated;
                              });
                            },
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: _isSubmitting ? null : _submit,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                              ),
                              child: _isSubmitting
                                  ? const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : Text(
                                      '판매자 정보 변경',
                                      style: context.body.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SelectField extends StatelessWidget {
  const _SelectField({
    required this.label,
    required this.value,
    required this.isPlaceholder,
    required this.onTap,
  });

  final String label;
  final String value;
  final bool isPlaceholder;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: context.body.copyWith(fontWeight: FontWeight.w700)),
        const SizedBox(height: 8),
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: InputDecorator(
            decoration: AppInputDecoration.focusDecoration('$label 선택'),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    value,
                    style: context.body.copyWith(
                      color: isPlaceholder
                          ? AppColors.darkGrey
                          : AppColors.textColor,
                    ),
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppColors.darkGrey,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _TextFieldGroup extends StatelessWidget {
  const _TextFieldGroup({
    required this.label,
    required this.controller,
    required this.hintText,
  });

  final String label;
  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: context.body.copyWith(fontWeight: FontWeight.w700)),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          style: context.body,
          validator: (value) {
            if ((value ?? '').trim().isEmpty) {
              return '$label을 입력해주세요.';
            }
            return null;
          },
          decoration: AppInputDecoration.focusDecoration(hintText),
        ),
      ],
    );
  }
}
