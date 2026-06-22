// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settlement_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(settlementDataSource)
final settlementDataSourceProvider = SettlementDataSourceProvider._();

final class SettlementDataSourceProvider
    extends
        $FunctionalProvider<
          SettlementDataSource,
          SettlementDataSource,
          SettlementDataSource
        >
    with $Provider<SettlementDataSource> {
  SettlementDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settlementDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settlementDataSourceHash();

  @$internal
  @override
  $ProviderElement<SettlementDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SettlementDataSource create(Ref ref) {
    return settlementDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SettlementDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SettlementDataSource>(value),
    );
  }
}

String _$settlementDataSourceHash() =>
    r'04ecab22518074997aa7087fe6eebc7642a339e9';
