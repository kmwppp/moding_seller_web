// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_management_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrderManagementState {

 bool get isMainLoading; bool get isLoading; bool get isLoadingMore; bool get hasMore; int get pageNum; OrderSummaryModel? get summary; OrderStatus? get selectedStatus; List<OrderModel> get orderList;/// 검색 시작일 / 종료일
 String get saleStartDate; String get saleEndDate;
/// Create a copy of OrderManagementState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderManagementStateCopyWith<OrderManagementState> get copyWith => _$OrderManagementStateCopyWithImpl<OrderManagementState>(this as OrderManagementState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderManagementState&&(identical(other.isMainLoading, isMainLoading) || other.isMainLoading == isMainLoading)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.pageNum, pageNum) || other.pageNum == pageNum)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.selectedStatus, selectedStatus) || other.selectedStatus == selectedStatus)&&const DeepCollectionEquality().equals(other.orderList, orderList)&&(identical(other.saleStartDate, saleStartDate) || other.saleStartDate == saleStartDate)&&(identical(other.saleEndDate, saleEndDate) || other.saleEndDate == saleEndDate));
}


@override
int get hashCode => Object.hash(runtimeType,isMainLoading,isLoading,isLoadingMore,hasMore,pageNum,summary,selectedStatus,const DeepCollectionEquality().hash(orderList),saleStartDate,saleEndDate);

@override
String toString() {
  return 'OrderManagementState(isMainLoading: $isMainLoading, isLoading: $isLoading, isLoadingMore: $isLoadingMore, hasMore: $hasMore, pageNum: $pageNum, summary: $summary, selectedStatus: $selectedStatus, orderList: $orderList, saleStartDate: $saleStartDate, saleEndDate: $saleEndDate)';
}


}

/// @nodoc
abstract mixin class $OrderManagementStateCopyWith<$Res>  {
  factory $OrderManagementStateCopyWith(OrderManagementState value, $Res Function(OrderManagementState) _then) = _$OrderManagementStateCopyWithImpl;
@useResult
$Res call({
 bool isMainLoading, bool isLoading, bool isLoadingMore, bool hasMore, int pageNum, OrderSummaryModel? summary, OrderStatus? selectedStatus, List<OrderModel> orderList, String saleStartDate, String saleEndDate
});


$OrderSummaryModelCopyWith<$Res>? get summary;

}
/// @nodoc
class _$OrderManagementStateCopyWithImpl<$Res>
    implements $OrderManagementStateCopyWith<$Res> {
  _$OrderManagementStateCopyWithImpl(this._self, this._then);

  final OrderManagementState _self;
  final $Res Function(OrderManagementState) _then;

/// Create a copy of OrderManagementState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isMainLoading = null,Object? isLoading = null,Object? isLoadingMore = null,Object? hasMore = null,Object? pageNum = null,Object? summary = freezed,Object? selectedStatus = freezed,Object? orderList = null,Object? saleStartDate = null,Object? saleEndDate = null,}) {
  return _then(_self.copyWith(
isMainLoading: null == isMainLoading ? _self.isMainLoading : isMainLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,pageNum: null == pageNum ? _self.pageNum : pageNum // ignore: cast_nullable_to_non_nullable
as int,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as OrderSummaryModel?,selectedStatus: freezed == selectedStatus ? _self.selectedStatus : selectedStatus // ignore: cast_nullable_to_non_nullable
as OrderStatus?,orderList: null == orderList ? _self.orderList : orderList // ignore: cast_nullable_to_non_nullable
as List<OrderModel>,saleStartDate: null == saleStartDate ? _self.saleStartDate : saleStartDate // ignore: cast_nullable_to_non_nullable
as String,saleEndDate: null == saleEndDate ? _self.saleEndDate : saleEndDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of OrderManagementState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderSummaryModelCopyWith<$Res>? get summary {
    if (_self.summary == null) {
    return null;
  }

  return $OrderSummaryModelCopyWith<$Res>(_self.summary!, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// Adds pattern-matching-related methods to [OrderManagementState].
extension OrderManagementStatePatterns on OrderManagementState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderManagementState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderManagementState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderManagementState value)  $default,){
final _that = this;
switch (_that) {
case _OrderManagementState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderManagementState value)?  $default,){
final _that = this;
switch (_that) {
case _OrderManagementState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isMainLoading,  bool isLoading,  bool isLoadingMore,  bool hasMore,  int pageNum,  OrderSummaryModel? summary,  OrderStatus? selectedStatus,  List<OrderModel> orderList,  String saleStartDate,  String saleEndDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderManagementState() when $default != null:
return $default(_that.isMainLoading,_that.isLoading,_that.isLoadingMore,_that.hasMore,_that.pageNum,_that.summary,_that.selectedStatus,_that.orderList,_that.saleStartDate,_that.saleEndDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isMainLoading,  bool isLoading,  bool isLoadingMore,  bool hasMore,  int pageNum,  OrderSummaryModel? summary,  OrderStatus? selectedStatus,  List<OrderModel> orderList,  String saleStartDate,  String saleEndDate)  $default,) {final _that = this;
switch (_that) {
case _OrderManagementState():
return $default(_that.isMainLoading,_that.isLoading,_that.isLoadingMore,_that.hasMore,_that.pageNum,_that.summary,_that.selectedStatus,_that.orderList,_that.saleStartDate,_that.saleEndDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isMainLoading,  bool isLoading,  bool isLoadingMore,  bool hasMore,  int pageNum,  OrderSummaryModel? summary,  OrderStatus? selectedStatus,  List<OrderModel> orderList,  String saleStartDate,  String saleEndDate)?  $default,) {final _that = this;
switch (_that) {
case _OrderManagementState() when $default != null:
return $default(_that.isMainLoading,_that.isLoading,_that.isLoadingMore,_that.hasMore,_that.pageNum,_that.summary,_that.selectedStatus,_that.orderList,_that.saleStartDate,_that.saleEndDate);case _:
  return null;

}
}

}

/// @nodoc


class _OrderManagementState extends OrderManagementState {
  const _OrderManagementState({required this.isMainLoading, required this.isLoading, required this.isLoadingMore, required this.hasMore, required this.pageNum, required this.summary, required this.selectedStatus, required final  List<OrderModel> orderList, required this.saleStartDate, required this.saleEndDate}): _orderList = orderList,super._();
  

@override final  bool isMainLoading;
@override final  bool isLoading;
@override final  bool isLoadingMore;
@override final  bool hasMore;
@override final  int pageNum;
@override final  OrderSummaryModel? summary;
@override final  OrderStatus? selectedStatus;
 final  List<OrderModel> _orderList;
@override List<OrderModel> get orderList {
  if (_orderList is EqualUnmodifiableListView) return _orderList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_orderList);
}

/// 검색 시작일 / 종료일
@override final  String saleStartDate;
@override final  String saleEndDate;

/// Create a copy of OrderManagementState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderManagementStateCopyWith<_OrderManagementState> get copyWith => __$OrderManagementStateCopyWithImpl<_OrderManagementState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderManagementState&&(identical(other.isMainLoading, isMainLoading) || other.isMainLoading == isMainLoading)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.pageNum, pageNum) || other.pageNum == pageNum)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.selectedStatus, selectedStatus) || other.selectedStatus == selectedStatus)&&const DeepCollectionEquality().equals(other._orderList, _orderList)&&(identical(other.saleStartDate, saleStartDate) || other.saleStartDate == saleStartDate)&&(identical(other.saleEndDate, saleEndDate) || other.saleEndDate == saleEndDate));
}


@override
int get hashCode => Object.hash(runtimeType,isMainLoading,isLoading,isLoadingMore,hasMore,pageNum,summary,selectedStatus,const DeepCollectionEquality().hash(_orderList),saleStartDate,saleEndDate);

@override
String toString() {
  return 'OrderManagementState(isMainLoading: $isMainLoading, isLoading: $isLoading, isLoadingMore: $isLoadingMore, hasMore: $hasMore, pageNum: $pageNum, summary: $summary, selectedStatus: $selectedStatus, orderList: $orderList, saleStartDate: $saleStartDate, saleEndDate: $saleEndDate)';
}


}

/// @nodoc
abstract mixin class _$OrderManagementStateCopyWith<$Res> implements $OrderManagementStateCopyWith<$Res> {
  factory _$OrderManagementStateCopyWith(_OrderManagementState value, $Res Function(_OrderManagementState) _then) = __$OrderManagementStateCopyWithImpl;
@override @useResult
$Res call({
 bool isMainLoading, bool isLoading, bool isLoadingMore, bool hasMore, int pageNum, OrderSummaryModel? summary, OrderStatus? selectedStatus, List<OrderModel> orderList, String saleStartDate, String saleEndDate
});


@override $OrderSummaryModelCopyWith<$Res>? get summary;

}
/// @nodoc
class __$OrderManagementStateCopyWithImpl<$Res>
    implements _$OrderManagementStateCopyWith<$Res> {
  __$OrderManagementStateCopyWithImpl(this._self, this._then);

  final _OrderManagementState _self;
  final $Res Function(_OrderManagementState) _then;

/// Create a copy of OrderManagementState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isMainLoading = null,Object? isLoading = null,Object? isLoadingMore = null,Object? hasMore = null,Object? pageNum = null,Object? summary = freezed,Object? selectedStatus = freezed,Object? orderList = null,Object? saleStartDate = null,Object? saleEndDate = null,}) {
  return _then(_OrderManagementState(
isMainLoading: null == isMainLoading ? _self.isMainLoading : isMainLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,pageNum: null == pageNum ? _self.pageNum : pageNum // ignore: cast_nullable_to_non_nullable
as int,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as OrderSummaryModel?,selectedStatus: freezed == selectedStatus ? _self.selectedStatus : selectedStatus // ignore: cast_nullable_to_non_nullable
as OrderStatus?,orderList: null == orderList ? _self._orderList : orderList // ignore: cast_nullable_to_non_nullable
as List<OrderModel>,saleStartDate: null == saleStartDate ? _self.saleStartDate : saleStartDate // ignore: cast_nullable_to_non_nullable
as String,saleEndDate: null == saleEndDate ? _self.saleEndDate : saleEndDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of OrderManagementState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderSummaryModelCopyWith<$Res>? get summary {
    if (_self.summary == null) {
    return null;
  }

  return $OrderSummaryModelCopyWith<$Res>(_self.summary!, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}

// dart format on
