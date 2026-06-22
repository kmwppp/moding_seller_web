// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settlement_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SettlementDetailModel {

@JsonKey(includeToJson: false) bool get isDetailLoading; int get id; String get settlementCode; int get orderId; int? get claimId; int? get productAmount; int? get discountAmount; int? get deliveryFee; int? get totalPaidAmount; int? get claimDeductAmount; int? get totalAdjustmentAmount; int? get actualBaseAmount; double? get commissionRatePercent; int? get commissionAmount; int? get finalAmount; SettlementStatusType get status;@JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate) DateTime? get settledAt; PayoutStatusType? get payoutStatus;@JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate) DateTime? get paidOutAt;
/// Create a copy of SettlementDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettlementDetailModelCopyWith<SettlementDetailModel> get copyWith => _$SettlementDetailModelCopyWithImpl<SettlementDetailModel>(this as SettlementDetailModel, _$identity);

  /// Serializes this SettlementDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettlementDetailModel&&(identical(other.isDetailLoading, isDetailLoading) || other.isDetailLoading == isDetailLoading)&&(identical(other.id, id) || other.id == id)&&(identical(other.settlementCode, settlementCode) || other.settlementCode == settlementCode)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.claimId, claimId) || other.claimId == claimId)&&(identical(other.productAmount, productAmount) || other.productAmount == productAmount)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.deliveryFee, deliveryFee) || other.deliveryFee == deliveryFee)&&(identical(other.totalPaidAmount, totalPaidAmount) || other.totalPaidAmount == totalPaidAmount)&&(identical(other.claimDeductAmount, claimDeductAmount) || other.claimDeductAmount == claimDeductAmount)&&(identical(other.totalAdjustmentAmount, totalAdjustmentAmount) || other.totalAdjustmentAmount == totalAdjustmentAmount)&&(identical(other.actualBaseAmount, actualBaseAmount) || other.actualBaseAmount == actualBaseAmount)&&(identical(other.commissionRatePercent, commissionRatePercent) || other.commissionRatePercent == commissionRatePercent)&&(identical(other.commissionAmount, commissionAmount) || other.commissionAmount == commissionAmount)&&(identical(other.finalAmount, finalAmount) || other.finalAmount == finalAmount)&&(identical(other.status, status) || other.status == status)&&(identical(other.settledAt, settledAt) || other.settledAt == settledAt)&&(identical(other.payoutStatus, payoutStatus) || other.payoutStatus == payoutStatus)&&(identical(other.paidOutAt, paidOutAt) || other.paidOutAt == paidOutAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,isDetailLoading,id,settlementCode,orderId,claimId,productAmount,discountAmount,deliveryFee,totalPaidAmount,claimDeductAmount,totalAdjustmentAmount,actualBaseAmount,commissionRatePercent,commissionAmount,finalAmount,status,settledAt,payoutStatus,paidOutAt]);

@override
String toString() {
  return 'SettlementDetailModel(isDetailLoading: $isDetailLoading, id: $id, settlementCode: $settlementCode, orderId: $orderId, claimId: $claimId, productAmount: $productAmount, discountAmount: $discountAmount, deliveryFee: $deliveryFee, totalPaidAmount: $totalPaidAmount, claimDeductAmount: $claimDeductAmount, totalAdjustmentAmount: $totalAdjustmentAmount, actualBaseAmount: $actualBaseAmount, commissionRatePercent: $commissionRatePercent, commissionAmount: $commissionAmount, finalAmount: $finalAmount, status: $status, settledAt: $settledAt, payoutStatus: $payoutStatus, paidOutAt: $paidOutAt)';
}


}

/// @nodoc
abstract mixin class $SettlementDetailModelCopyWith<$Res>  {
  factory $SettlementDetailModelCopyWith(SettlementDetailModel value, $Res Function(SettlementDetailModel) _then) = _$SettlementDetailModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeToJson: false) bool isDetailLoading, int id, String settlementCode, int orderId, int? claimId, int? productAmount, int? discountAmount, int? deliveryFee, int? totalPaidAmount, int? claimDeductAmount, int? totalAdjustmentAmount, int? actualBaseAmount, double? commissionRatePercent, int? commissionAmount, int? finalAmount, SettlementStatusType status,@JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate) DateTime? settledAt, PayoutStatusType? payoutStatus,@JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate) DateTime? paidOutAt
});




}
/// @nodoc
class _$SettlementDetailModelCopyWithImpl<$Res>
    implements $SettlementDetailModelCopyWith<$Res> {
  _$SettlementDetailModelCopyWithImpl(this._self, this._then);

  final SettlementDetailModel _self;
  final $Res Function(SettlementDetailModel) _then;

/// Create a copy of SettlementDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isDetailLoading = null,Object? id = null,Object? settlementCode = null,Object? orderId = null,Object? claimId = freezed,Object? productAmount = freezed,Object? discountAmount = freezed,Object? deliveryFee = freezed,Object? totalPaidAmount = freezed,Object? claimDeductAmount = freezed,Object? totalAdjustmentAmount = freezed,Object? actualBaseAmount = freezed,Object? commissionRatePercent = freezed,Object? commissionAmount = freezed,Object? finalAmount = freezed,Object? status = null,Object? settledAt = freezed,Object? payoutStatus = freezed,Object? paidOutAt = freezed,}) {
  return _then(_self.copyWith(
isDetailLoading: null == isDetailLoading ? _self.isDetailLoading : isDetailLoading // ignore: cast_nullable_to_non_nullable
as bool,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,settlementCode: null == settlementCode ? _self.settlementCode : settlementCode // ignore: cast_nullable_to_non_nullable
as String,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int,claimId: freezed == claimId ? _self.claimId : claimId // ignore: cast_nullable_to_non_nullable
as int?,productAmount: freezed == productAmount ? _self.productAmount : productAmount // ignore: cast_nullable_to_non_nullable
as int?,discountAmount: freezed == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as int?,deliveryFee: freezed == deliveryFee ? _self.deliveryFee : deliveryFee // ignore: cast_nullable_to_non_nullable
as int?,totalPaidAmount: freezed == totalPaidAmount ? _self.totalPaidAmount : totalPaidAmount // ignore: cast_nullable_to_non_nullable
as int?,claimDeductAmount: freezed == claimDeductAmount ? _self.claimDeductAmount : claimDeductAmount // ignore: cast_nullable_to_non_nullable
as int?,totalAdjustmentAmount: freezed == totalAdjustmentAmount ? _self.totalAdjustmentAmount : totalAdjustmentAmount // ignore: cast_nullable_to_non_nullable
as int?,actualBaseAmount: freezed == actualBaseAmount ? _self.actualBaseAmount : actualBaseAmount // ignore: cast_nullable_to_non_nullable
as int?,commissionRatePercent: freezed == commissionRatePercent ? _self.commissionRatePercent : commissionRatePercent // ignore: cast_nullable_to_non_nullable
as double?,commissionAmount: freezed == commissionAmount ? _self.commissionAmount : commissionAmount // ignore: cast_nullable_to_non_nullable
as int?,finalAmount: freezed == finalAmount ? _self.finalAmount : finalAmount // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SettlementStatusType,settledAt: freezed == settledAt ? _self.settledAt : settledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,payoutStatus: freezed == payoutStatus ? _self.payoutStatus : payoutStatus // ignore: cast_nullable_to_non_nullable
as PayoutStatusType?,paidOutAt: freezed == paidOutAt ? _self.paidOutAt : paidOutAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [SettlementDetailModel].
extension SettlementDetailModelPatterns on SettlementDetailModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SettlementDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SettlementDetailModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SettlementDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _SettlementDetailModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SettlementDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _SettlementDetailModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeToJson: false)  bool isDetailLoading,  int id,  String settlementCode,  int orderId,  int? claimId,  int? productAmount,  int? discountAmount,  int? deliveryFee,  int? totalPaidAmount,  int? claimDeductAmount,  int? totalAdjustmentAmount,  int? actualBaseAmount,  double? commissionRatePercent,  int? commissionAmount,  int? finalAmount,  SettlementStatusType status, @JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate)  DateTime? settledAt,  PayoutStatusType? payoutStatus, @JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate)  DateTime? paidOutAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SettlementDetailModel() when $default != null:
return $default(_that.isDetailLoading,_that.id,_that.settlementCode,_that.orderId,_that.claimId,_that.productAmount,_that.discountAmount,_that.deliveryFee,_that.totalPaidAmount,_that.claimDeductAmount,_that.totalAdjustmentAmount,_that.actualBaseAmount,_that.commissionRatePercent,_that.commissionAmount,_that.finalAmount,_that.status,_that.settledAt,_that.payoutStatus,_that.paidOutAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeToJson: false)  bool isDetailLoading,  int id,  String settlementCode,  int orderId,  int? claimId,  int? productAmount,  int? discountAmount,  int? deliveryFee,  int? totalPaidAmount,  int? claimDeductAmount,  int? totalAdjustmentAmount,  int? actualBaseAmount,  double? commissionRatePercent,  int? commissionAmount,  int? finalAmount,  SettlementStatusType status, @JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate)  DateTime? settledAt,  PayoutStatusType? payoutStatus, @JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate)  DateTime? paidOutAt)  $default,) {final _that = this;
switch (_that) {
case _SettlementDetailModel():
return $default(_that.isDetailLoading,_that.id,_that.settlementCode,_that.orderId,_that.claimId,_that.productAmount,_that.discountAmount,_that.deliveryFee,_that.totalPaidAmount,_that.claimDeductAmount,_that.totalAdjustmentAmount,_that.actualBaseAmount,_that.commissionRatePercent,_that.commissionAmount,_that.finalAmount,_that.status,_that.settledAt,_that.payoutStatus,_that.paidOutAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeToJson: false)  bool isDetailLoading,  int id,  String settlementCode,  int orderId,  int? claimId,  int? productAmount,  int? discountAmount,  int? deliveryFee,  int? totalPaidAmount,  int? claimDeductAmount,  int? totalAdjustmentAmount,  int? actualBaseAmount,  double? commissionRatePercent,  int? commissionAmount,  int? finalAmount,  SettlementStatusType status, @JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate)  DateTime? settledAt,  PayoutStatusType? payoutStatus, @JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate)  DateTime? paidOutAt)?  $default,) {final _that = this;
switch (_that) {
case _SettlementDetailModel() when $default != null:
return $default(_that.isDetailLoading,_that.id,_that.settlementCode,_that.orderId,_that.claimId,_that.productAmount,_that.discountAmount,_that.deliveryFee,_that.totalPaidAmount,_that.claimDeductAmount,_that.totalAdjustmentAmount,_that.actualBaseAmount,_that.commissionRatePercent,_that.commissionAmount,_that.finalAmount,_that.status,_that.settledAt,_that.payoutStatus,_that.paidOutAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SettlementDetailModel implements SettlementDetailModel {
  const _SettlementDetailModel({@JsonKey(includeToJson: false) this.isDetailLoading = true, required this.id, required this.settlementCode, required this.orderId, this.claimId, this.productAmount, this.discountAmount, this.deliveryFee, this.totalPaidAmount, this.claimDeductAmount, this.totalAdjustmentAmount, this.actualBaseAmount, this.commissionRatePercent, this.commissionAmount, this.finalAmount, required this.status, @JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate) this.settledAt, this.payoutStatus, @JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate) this.paidOutAt});
  factory _SettlementDetailModel.fromJson(Map<String, dynamic> json) => _$SettlementDetailModelFromJson(json);

@override@JsonKey(includeToJson: false) final  bool isDetailLoading;
@override final  int id;
@override final  String settlementCode;
@override final  int orderId;
@override final  int? claimId;
@override final  int? productAmount;
@override final  int? discountAmount;
@override final  int? deliveryFee;
@override final  int? totalPaidAmount;
@override final  int? claimDeductAmount;
@override final  int? totalAdjustmentAmount;
@override final  int? actualBaseAmount;
@override final  double? commissionRatePercent;
@override final  int? commissionAmount;
@override final  int? finalAmount;
@override final  SettlementStatusType status;
@override@JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate) final  DateTime? settledAt;
@override final  PayoutStatusType? payoutStatus;
@override@JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate) final  DateTime? paidOutAt;

/// Create a copy of SettlementDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettlementDetailModelCopyWith<_SettlementDetailModel> get copyWith => __$SettlementDetailModelCopyWithImpl<_SettlementDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SettlementDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SettlementDetailModel&&(identical(other.isDetailLoading, isDetailLoading) || other.isDetailLoading == isDetailLoading)&&(identical(other.id, id) || other.id == id)&&(identical(other.settlementCode, settlementCode) || other.settlementCode == settlementCode)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.claimId, claimId) || other.claimId == claimId)&&(identical(other.productAmount, productAmount) || other.productAmount == productAmount)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.deliveryFee, deliveryFee) || other.deliveryFee == deliveryFee)&&(identical(other.totalPaidAmount, totalPaidAmount) || other.totalPaidAmount == totalPaidAmount)&&(identical(other.claimDeductAmount, claimDeductAmount) || other.claimDeductAmount == claimDeductAmount)&&(identical(other.totalAdjustmentAmount, totalAdjustmentAmount) || other.totalAdjustmentAmount == totalAdjustmentAmount)&&(identical(other.actualBaseAmount, actualBaseAmount) || other.actualBaseAmount == actualBaseAmount)&&(identical(other.commissionRatePercent, commissionRatePercent) || other.commissionRatePercent == commissionRatePercent)&&(identical(other.commissionAmount, commissionAmount) || other.commissionAmount == commissionAmount)&&(identical(other.finalAmount, finalAmount) || other.finalAmount == finalAmount)&&(identical(other.status, status) || other.status == status)&&(identical(other.settledAt, settledAt) || other.settledAt == settledAt)&&(identical(other.payoutStatus, payoutStatus) || other.payoutStatus == payoutStatus)&&(identical(other.paidOutAt, paidOutAt) || other.paidOutAt == paidOutAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,isDetailLoading,id,settlementCode,orderId,claimId,productAmount,discountAmount,deliveryFee,totalPaidAmount,claimDeductAmount,totalAdjustmentAmount,actualBaseAmount,commissionRatePercent,commissionAmount,finalAmount,status,settledAt,payoutStatus,paidOutAt]);

@override
String toString() {
  return 'SettlementDetailModel(isDetailLoading: $isDetailLoading, id: $id, settlementCode: $settlementCode, orderId: $orderId, claimId: $claimId, productAmount: $productAmount, discountAmount: $discountAmount, deliveryFee: $deliveryFee, totalPaidAmount: $totalPaidAmount, claimDeductAmount: $claimDeductAmount, totalAdjustmentAmount: $totalAdjustmentAmount, actualBaseAmount: $actualBaseAmount, commissionRatePercent: $commissionRatePercent, commissionAmount: $commissionAmount, finalAmount: $finalAmount, status: $status, settledAt: $settledAt, payoutStatus: $payoutStatus, paidOutAt: $paidOutAt)';
}


}

/// @nodoc
abstract mixin class _$SettlementDetailModelCopyWith<$Res> implements $SettlementDetailModelCopyWith<$Res> {
  factory _$SettlementDetailModelCopyWith(_SettlementDetailModel value, $Res Function(_SettlementDetailModel) _then) = __$SettlementDetailModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeToJson: false) bool isDetailLoading, int id, String settlementCode, int orderId, int? claimId, int? productAmount, int? discountAmount, int? deliveryFee, int? totalPaidAmount, int? claimDeductAmount, int? totalAdjustmentAmount, int? actualBaseAmount, double? commissionRatePercent, int? commissionAmount, int? finalAmount, SettlementStatusType status,@JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate) DateTime? settledAt, PayoutStatusType? payoutStatus,@JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate) DateTime? paidOutAt
});




}
/// @nodoc
class __$SettlementDetailModelCopyWithImpl<$Res>
    implements _$SettlementDetailModelCopyWith<$Res> {
  __$SettlementDetailModelCopyWithImpl(this._self, this._then);

  final _SettlementDetailModel _self;
  final $Res Function(_SettlementDetailModel) _then;

/// Create a copy of SettlementDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isDetailLoading = null,Object? id = null,Object? settlementCode = null,Object? orderId = null,Object? claimId = freezed,Object? productAmount = freezed,Object? discountAmount = freezed,Object? deliveryFee = freezed,Object? totalPaidAmount = freezed,Object? claimDeductAmount = freezed,Object? totalAdjustmentAmount = freezed,Object? actualBaseAmount = freezed,Object? commissionRatePercent = freezed,Object? commissionAmount = freezed,Object? finalAmount = freezed,Object? status = null,Object? settledAt = freezed,Object? payoutStatus = freezed,Object? paidOutAt = freezed,}) {
  return _then(_SettlementDetailModel(
isDetailLoading: null == isDetailLoading ? _self.isDetailLoading : isDetailLoading // ignore: cast_nullable_to_non_nullable
as bool,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,settlementCode: null == settlementCode ? _self.settlementCode : settlementCode // ignore: cast_nullable_to_non_nullable
as String,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int,claimId: freezed == claimId ? _self.claimId : claimId // ignore: cast_nullable_to_non_nullable
as int?,productAmount: freezed == productAmount ? _self.productAmount : productAmount // ignore: cast_nullable_to_non_nullable
as int?,discountAmount: freezed == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as int?,deliveryFee: freezed == deliveryFee ? _self.deliveryFee : deliveryFee // ignore: cast_nullable_to_non_nullable
as int?,totalPaidAmount: freezed == totalPaidAmount ? _self.totalPaidAmount : totalPaidAmount // ignore: cast_nullable_to_non_nullable
as int?,claimDeductAmount: freezed == claimDeductAmount ? _self.claimDeductAmount : claimDeductAmount // ignore: cast_nullable_to_non_nullable
as int?,totalAdjustmentAmount: freezed == totalAdjustmentAmount ? _self.totalAdjustmentAmount : totalAdjustmentAmount // ignore: cast_nullable_to_non_nullable
as int?,actualBaseAmount: freezed == actualBaseAmount ? _self.actualBaseAmount : actualBaseAmount // ignore: cast_nullable_to_non_nullable
as int?,commissionRatePercent: freezed == commissionRatePercent ? _self.commissionRatePercent : commissionRatePercent // ignore: cast_nullable_to_non_nullable
as double?,commissionAmount: freezed == commissionAmount ? _self.commissionAmount : commissionAmount // ignore: cast_nullable_to_non_nullable
as int?,finalAmount: freezed == finalAmount ? _self.finalAmount : finalAmount // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SettlementStatusType,settledAt: freezed == settledAt ? _self.settledAt : settledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,payoutStatus: freezed == payoutStatus ? _self.payoutStatus : payoutStatus // ignore: cast_nullable_to_non_nullable
as PayoutStatusType?,paidOutAt: freezed == paidOutAt ? _self.paidOutAt : paidOutAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
