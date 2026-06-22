import 'package:flutter/material.dart';
import 'package:moding_president_web/core/presentation/dialogs/app_dialogs.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:moding_president_web/core/presentation/widgets/loading_indicator.dart';
import 'package:moding_president_web/feature/evidence/presentation/models/evidence_models.dart';

import '../widgets/evidence_fee_settlement_invoice_card.dart';
import '../widgets/evidence_tax_invoice_card.dart';

class EvidenceListSection extends StatelessWidget {
  const EvidenceListSection({
    super.key,
    required this.cards,
    required this.isLoading,
    required this.isLoadingMore,
    required this.onPressedTaxInvoiceView,
  });

  final List<EvidenceCardModel> cards;
  final bool isLoading;
  final bool isLoadingMore;
  final Future<String?> Function(int? orderId) onPressedTaxInvoiceView;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const SizedBox(
        height: 200,
        child: Center(child: LoadingIndicator()),
      );
    }

    if (cards.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Center(
          child: Text(
            '조회된 문서가 없습니다.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      );
    }

    return Column(
      children: [
        ...cards.map((card) {
          switch (card.kind) {
            case EvidenceCardKind.taxInvoice:
              return EvidenceTaxInvoiceCard(
                card: card,
                onPressedView: () async {
                  try {
                    final url = await onPressedTaxInvoiceView(card.orderId);
                    if ((url ?? '').trim().isEmpty) {
                      return;
                    }

                    final uri = Uri.tryParse(url!.trim());
                    if (uri == null) {
                      return;
                    }

                    await launchUrl(uri, mode: LaunchMode.platformDefault);
                  } catch (e) {
                    if (!context.mounted) {
                      return;
                    }
                    await AppDialog.showError(context, e.toString());
                  }
                },
              );
            case EvidenceCardKind.feeSettlementInvoice:
              return EvidenceFeeSettlementInvoiceCard(
                card: card,
                onPressedView: () async {
                  try {
                    final url = await onPressedTaxInvoiceView(card.orderId);
                    if ((url ?? '').trim().isEmpty) {
                      return;
                    }

                    final uri = Uri.tryParse(url!.trim());
                    if (uri == null) {
                      return;
                    }

                    await launchUrl(uri, mode: LaunchMode.platformDefault);
                  } catch (e) {
                    if (!context.mounted) {
                      return;
                    }
                    await AppDialog.showError(context, e.toString());
                  }
                },
              );
          }
        }),
        if (isLoadingMore)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Center(child: CircularProgressIndicator()),
          ),
      ],
    );
  }
}
