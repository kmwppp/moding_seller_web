// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dash_board_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DashBoardState {

 bool get isLoading; DashBoardModel? get dashboardInfo; List<OrderModel> get orderList; List<OrderModel> get deliveryList;
/// Create a copy of DashBoardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashBoardStateCopyWith<DashBoardState> get copyWith => _$DashBoardStateCopyWithImpl<DashBoardState>(this as DashBoardState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashBoardState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.dashboardInfo, dashboardInfo) || other.dashboardInfo == dashboardInfo)&&const DeepCollectionEquality().equals(other.orderList, orderList)&&const DeepCollectionEquality().equals(other.deliveryList, deliveryList));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,dashboardInfo,const DeepCollectionEquality().hash(orderList),const DeepCollectionEquality().hash(deliveryList));

@override
String toString() {
  return 'DashBoardState(isLoading: $isLoading, dashboardInfo: $dashboardInfo, orderList: $orderList, deliveryList: $deliveryList)';
}


}

/// @nodoc
abstract mixin class $DashBoardStateCopyWith<$Res>  {
  factory $DashBoardStateCopyWith(DashBoardState value, $Res Function(DashBoardState) _then) = _$DashBoardStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, DashBoardModel? dashboardInfo, List<OrderModel> orderList, List<OrderModel> deliveryList
});


$DashBoardModelCopyWith<$Res>? get dashboardInfo;

}
/// @nodoc
class _$DashBoardStateCopyWithImpl<$Res>
    implements $DashBoardStateCopyWith<$Res> {
  _$DashBoardStateCopyWithImpl(this._self, this._then);

  final DashBoardState _self;
  final $Res Function(DashBoardState) _then;

/// Create a copy of DashBoardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? dashboardInfo = freezed,Object? orderList = null,Object? deliveryList = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,dashboardInfo: freezed == dashboardInfo ? _self.dashboardInfo : dashboardInfo // ignore: cast_nullable_to_non_nullable
as DashBoardModel?,orderList: null == orderList ? _self.orderList : orderList // ignore: cast_nullable_to_non_nullable
as List<OrderModel>,deliveryList: null == deliveryList ? _self.deliveryList : deliveryList // ignore: cast_nullable_to_non_nullable
as List<OrderModel>,
  ));
}
/// Create a copy of DashBoardState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DashBoardModelCopyWith<$Res>? get dashboardInfo {
    if (_self.dashboardInfo == null) {
    return null;
  }

  return $DashBoardModelCopyWith<$Res>(_self.dashboardInfo!, (value) {
    return _then(_self.copyWith(dashboardInfo: value));
  });
}
}


/// Adds pattern-matching-related methods to [DashBoardState].
extension DashBoardStatePatterns on DashBoardState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashBoardState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashBoardState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashBoardState value)  $default,){
final _that = this;
switch (_that) {
case _DashBoardState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashBoardState value)?  $default,){
final _that = this;
switch (_that) {
case _DashBoardState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  DashBoardModel? dashboardInfo,  List<OrderModel> orderList,  List<OrderModel> deliveryList)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashBoardState() when $default != null:
return $default(_that.isLoading,_that.dashboardInfo,_that.orderList,_that.deliveryList);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  DashBoardModel? dashboardInfo,  List<OrderModel> orderList,  List<OrderModel> deliveryList)  $default,) {final _that = this;
switch (_that) {
case _DashBoardState():
return $default(_that.isLoading,_that.dashboardInfo,_that.orderList,_that.deliveryList);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  DashBoardModel? dashboardInfo,  List<OrderModel> orderList,  List<OrderModel> deliveryList)?  $default,) {final _that = this;
switch (_that) {
case _DashBoardState() when $default != null:
return $default(_that.isLoading,_that.dashboardInfo,_that.orderList,_that.deliveryList);case _:
  return null;

}
}

}

/// @nodoc


class _DashBoardState extends DashBoardState {
  const _DashBoardState({required this.isLoading, this.dashboardInfo, required final  List<OrderModel> orderList, required final  List<OrderModel> deliveryList}): _orderList = orderList,_deliveryList = deliveryList,super._();
  

@override final  bool isLoading;
@override final  DashBoardModel? dashboardInfo;
 final  List<OrderModel> _orderList;
@override List<OrderModel> get orderList {
  if (_orderList is EqualUnmodifiableListView) return _orderList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_orderList);
}

 final  List<OrderModel> _deliveryList;
@override List<OrderModel> get deliveryList {
  if (_deliveryList is EqualUnmodifiableListView) return _deliveryList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_deliveryList);
}


/// Create a copy of DashBoardState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashBoardStateCopyWith<_DashBoardState> get copyWith => __$DashBoardStateCopyWithImpl<_DashBoardState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashBoardState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.dashboardInfo, dashboardInfo) || other.dashboardInfo == dashboardInfo)&&const DeepCollectionEquality().equals(other._orderList, _orderList)&&const DeepCollectionEquality().equals(other._deliveryList, _deliveryList));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,dashboardInfo,const DeepCollectionEquality().hash(_orderList),const DeepCollectionEquality().hash(_deliveryList));

@override
String toString() {
  return 'DashBoardState(isLoading: $isLoading, dashboardInfo: $dashboardInfo, orderList: $orderList, deliveryList: $deliveryList)';
}


}

/// @nodoc
abstract mixin class _$DashBoardStateCopyWith<$Res> implements $DashBoardStateCopyWith<$Res> {
  factory _$DashBoardStateCopyWith(_DashBoardState value, $Res Function(_DashBoardState) _then) = __$DashBoardStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, DashBoardModel? dashboardInfo, List<OrderModel> orderList, List<OrderModel> deliveryList
});


@override $DashBoardModelCopyWith<$Res>? get dashboardInfo;

}
/// @nodoc
class __$DashBoardStateCopyWithImpl<$Res>
    implements _$DashBoardStateCopyWith<$Res> {
  __$DashBoardStateCopyWithImpl(this._self, this._then);

  final _DashBoardState _self;
  final $Res Function(_DashBoardState) _then;

/// Create a copy of DashBoardState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? dashboardInfo = freezed,Object? orderList = null,Object? deliveryList = null,}) {
  return _then(_DashBoardState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,dashboardInfo: freezed == dashboardInfo ? _self.dashboardInfo : dashboardInfo // ignore: cast_nullable_to_non_nullable
as DashBoardModel?,orderList: null == orderList ? _self._orderList : orderList // ignore: cast_nullable_to_non_nullable
as List<OrderModel>,deliveryList: null == deliveryList ? _self._deliveryList : deliveryList // ignore: cast_nullable_to_non_nullable
as List<OrderModel>,
  ));
}

/// Create a copy of DashBoardState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DashBoardModelCopyWith<$Res>? get dashboardInfo {
    if (_self.dashboardInfo == null) {
    return null;
  }

  return $DashBoardModelCopyWith<$Res>(_self.dashboardInfo!, (value) {
    return _then(_self.copyWith(dashboardInfo: value));
  });
}
}

// dart format on
