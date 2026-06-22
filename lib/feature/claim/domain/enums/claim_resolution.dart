import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

enum ClaimResolution {
  @JsonValue('REFUND')
  refund,
  @JsonValue('RESHIP')
  reship,
}

extension ClaimResolutionX on ClaimResolution {
  String get label {
    switch (this) {
      case ClaimResolution.refund:
        return '환불';
      case ClaimResolution.reship:
        return '재배송';
    }
  }

  IconData get icon {
    switch (this) {
      case ClaimResolution.refund:
        return Icons.payments_outlined;
      case ClaimResolution.reship:
        return Icons.local_shipping_outlined;
    }
  }
}
