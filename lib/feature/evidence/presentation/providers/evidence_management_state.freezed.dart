// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'evidence_management_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EvidenceManagementState {

 bool get isMainLoading; bool get isLoading; bool get isLoadingMore; bool get hasMore; EvidenceFilterType get selectedFilterType; DateTime get startDate; DateTime get endDate; int get page; int get size; int get totalCount; int get sellerToBuyerCount; int get modingToSellerCount; List<EvidenceCardModel> get cards;
/// Create a copy of EvidenceManagementState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EvidenceManagementStateCopyWith<EvidenceManagementState> get copyWith => _$EvidenceManagementStateCopyWithImpl<EvidenceManagementState>(this as EvidenceManagementState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EvidenceManagementState&&(identical(other.isMainLoading, isMainLoading) || other.isMainLoading == isMainLoading)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.selectedFilterType, selectedFilterType) || other.selectedFilterType == selectedFilterType)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.sellerToBuyerCount, sellerToBuyerCount) || other.sellerToBuyerCount == sellerToBuyerCount)&&(identical(other.modingToSellerCount, modingToSellerCount) || other.modingToSellerCount == modingToSellerCount)&&const DeepCollectionEquality().equals(other.cards, cards));
}


@override
int get hashCode => Object.hash(runtimeType,isMainLoading,isLoading,isLoadingMore,hasMore,selectedFilterType,startDate,endDate,page,size,totalCount,sellerToBuyerCount,modingToSellerCount,const DeepCollectionEquality().hash(cards));

@override
String toString() {
  return 'EvidenceManagementState(isMainLoading: $isMainLoading, isLoading: $isLoading, isLoadingMore: $isLoadingMore, hasMore: $hasMore, selectedFilterType: $selectedFilterType, startDate: $startDate, endDate: $endDate, page: $page, size: $size, totalCount: $totalCount, sellerToBuyerCount: $sellerToBuyerCount, modingToSellerCount: $modingToSellerCount, cards: $cards)';
}


}

/// @nodoc
abstract mixin class $EvidenceManagementStateCopyWith<$Res>  {
  factory $EvidenceManagementStateCopyWith(EvidenceManagementState value, $Res Function(EvidenceManagementState) _then) = _$EvidenceManagementStateCopyWithImpl;
@useResult
$Res call({
 bool isMainLoading, bool isLoading, bool isLoadingMore, bool hasMore, EvidenceFilterType selectedFilterType, DateTime startDate, DateTime endDate, int page, int size, int totalCount, int sellerToBuyerCount, int modingToSellerCount, List<EvidenceCardModel> cards
});




}
/// @nodoc
class _$EvidenceManagementStateCopyWithImpl<$Res>
    implements $EvidenceManagementStateCopyWith<$Res> {
  _$EvidenceManagementStateCopyWithImpl(this._self, this._then);

  final EvidenceManagementState _self;
  final $Res Function(EvidenceManagementState) _then;

/// Create a copy of EvidenceManagementState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isMainLoading = null,Object? isLoading = null,Object? isLoadingMore = null,Object? hasMore = null,Object? selectedFilterType = null,Object? startDate = null,Object? endDate = null,Object? page = null,Object? size = null,Object? totalCount = null,Object? sellerToBuyerCount = null,Object? modingToSellerCount = null,Object? cards = null,}) {
  return _then(_self.copyWith(
isMainLoading: null == isMainLoading ? _self.isMainLoading : isMainLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,selectedFilterType: null == selectedFilterType ? _self.selectedFilterType : selectedFilterType // ignore: cast_nullable_to_non_nullable
as EvidenceFilterType,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,sellerToBuyerCount: null == sellerToBuyerCount ? _self.sellerToBuyerCount : sellerToBuyerCount // ignore: cast_nullable_to_non_nullable
as int,modingToSellerCount: null == modingToSellerCount ? _self.modingToSellerCount : modingToSellerCount // ignore: cast_nullable_to_non_nullable
as int,cards: null == cards ? _self.cards : cards // ignore: cast_nullable_to_non_nullable
as List<EvidenceCardModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [EvidenceManagementState].
extension EvidenceManagementStatePatterns on EvidenceManagementState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EvidenceManagementState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EvidenceManagementState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EvidenceManagementState value)  $default,){
final _that = this;
switch (_that) {
case _EvidenceManagementState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EvidenceManagementState value)?  $default,){
final _that = this;
switch (_that) {
case _EvidenceManagementState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isMainLoading,  bool isLoading,  bool isLoadingMore,  bool hasMore,  EvidenceFilterType selectedFilterType,  DateTime startDate,  DateTime endDate,  int page,  int size,  int totalCount,  int sellerToBuyerCount,  int modingToSellerCount,  List<EvidenceCardModel> cards)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EvidenceManagementState() when $default != null:
return $default(_that.isMainLoading,_that.isLoading,_that.isLoadingMore,_that.hasMore,_that.selectedFilterType,_that.startDate,_that.endDate,_that.page,_that.size,_that.totalCount,_that.sellerToBuyerCount,_that.modingToSellerCount,_that.cards);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isMainLoading,  bool isLoading,  bool isLoadingMore,  bool hasMore,  EvidenceFilterType selectedFilterType,  DateTime startDate,  DateTime endDate,  int page,  int size,  int totalCount,  int sellerToBuyerCount,  int modingToSellerCount,  List<EvidenceCardModel> cards)  $default,) {final _that = this;
switch (_that) {
case _EvidenceManagementState():
return $default(_that.isMainLoading,_that.isLoading,_that.isLoadingMore,_that.hasMore,_that.selectedFilterType,_that.startDate,_that.endDate,_that.page,_that.size,_that.totalCount,_that.sellerToBuyerCount,_that.modingToSellerCount,_that.cards);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isMainLoading,  bool isLoading,  bool isLoadingMore,  bool hasMore,  EvidenceFilterType selectedFilterType,  DateTime startDate,  DateTime endDate,  int page,  int size,  int totalCount,  int sellerToBuyerCount,  int modingToSellerCount,  List<EvidenceCardModel> cards)?  $default,) {final _that = this;
switch (_that) {
case _EvidenceManagementState() when $default != null:
return $default(_that.isMainLoading,_that.isLoading,_that.isLoadingMore,_that.hasMore,_that.selectedFilterType,_that.startDate,_that.endDate,_that.page,_that.size,_that.totalCount,_that.sellerToBuyerCount,_that.modingToSellerCount,_that.cards);case _:
  return null;

}
}

}

/// @nodoc


class _EvidenceManagementState extends EvidenceManagementState {
  const _EvidenceManagementState({required this.isMainLoading, required this.isLoading, required this.isLoadingMore, required this.hasMore, required this.selectedFilterType, required this.startDate, required this.endDate, required this.page, required this.size, required this.totalCount, required this.sellerToBuyerCount, required this.modingToSellerCount, required final  List<EvidenceCardModel> cards}): _cards = cards,super._();
  

@override final  bool isMainLoading;
@override final  bool isLoading;
@override final  bool isLoadingMore;
@override final  bool hasMore;
@override final  EvidenceFilterType selectedFilterType;
@override final  DateTime startDate;
@override final  DateTime endDate;
@override final  int page;
@override final  int size;
@override final  int totalCount;
@override final  int sellerToBuyerCount;
@override final  int modingToSellerCount;
 final  List<EvidenceCardModel> _cards;
@override List<EvidenceCardModel> get cards {
  if (_cards is EqualUnmodifiableListView) return _cards;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cards);
}


/// Create a copy of EvidenceManagementState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EvidenceManagementStateCopyWith<_EvidenceManagementState> get copyWith => __$EvidenceManagementStateCopyWithImpl<_EvidenceManagementState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EvidenceManagementState&&(identical(other.isMainLoading, isMainLoading) || other.isMainLoading == isMainLoading)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.selectedFilterType, selectedFilterType) || other.selectedFilterType == selectedFilterType)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.sellerToBuyerCount, sellerToBuyerCount) || other.sellerToBuyerCount == sellerToBuyerCount)&&(identical(other.modingToSellerCount, modingToSellerCount) || other.modingToSellerCount == modingToSellerCount)&&const DeepCollectionEquality().equals(other._cards, _cards));
}


@override
int get hashCode => Object.hash(runtimeType,isMainLoading,isLoading,isLoadingMore,hasMore,selectedFilterType,startDate,endDate,page,size,totalCount,sellerToBuyerCount,modingToSellerCount,const DeepCollectionEquality().hash(_cards));

@override
String toString() {
  return 'EvidenceManagementState(isMainLoading: $isMainLoading, isLoading: $isLoading, isLoadingMore: $isLoadingMore, hasMore: $hasMore, selectedFilterType: $selectedFilterType, startDate: $startDate, endDate: $endDate, page: $page, size: $size, totalCount: $totalCount, sellerToBuyerCount: $sellerToBuyerCount, modingToSellerCount: $modingToSellerCount, cards: $cards)';
}


}

/// @nodoc
abstract mixin class _$EvidenceManagementStateCopyWith<$Res> implements $EvidenceManagementStateCopyWith<$Res> {
  factory _$EvidenceManagementStateCopyWith(_EvidenceManagementState value, $Res Function(_EvidenceManagementState) _then) = __$EvidenceManagementStateCopyWithImpl;
@override @useResult
$Res call({
 bool isMainLoading, bool isLoading, bool isLoadingMore, bool hasMore, EvidenceFilterType selectedFilterType, DateTime startDate, DateTime endDate, int page, int size, int totalCount, int sellerToBuyerCount, int modingToSellerCount, List<EvidenceCardModel> cards
});




}
/// @nodoc
class __$EvidenceManagementStateCopyWithImpl<$Res>
    implements _$EvidenceManagementStateCopyWith<$Res> {
  __$EvidenceManagementStateCopyWithImpl(this._self, this._then);

  final _EvidenceManagementState _self;
  final $Res Function(_EvidenceManagementState) _then;

/// Create a copy of EvidenceManagementState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isMainLoading = null,Object? isLoading = null,Object? isLoadingMore = null,Object? hasMore = null,Object? selectedFilterType = null,Object? startDate = null,Object? endDate = null,Object? page = null,Object? size = null,Object? totalCount = null,Object? sellerToBuyerCount = null,Object? modingToSellerCount = null,Object? cards = null,}) {
  return _then(_EvidenceManagementState(
isMainLoading: null == isMainLoading ? _self.isMainLoading : isMainLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,selectedFilterType: null == selectedFilterType ? _self.selectedFilterType : selectedFilterType // ignore: cast_nullable_to_non_nullable
as EvidenceFilterType,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,sellerToBuyerCount: null == sellerToBuyerCount ? _self.sellerToBuyerCount : sellerToBuyerCount // ignore: cast_nullable_to_non_nullable
as int,modingToSellerCount: null == modingToSellerCount ? _self.modingToSellerCount : modingToSellerCount // ignore: cast_nullable_to_non_nullable
as int,cards: null == cards ? _self._cards : cards // ignore: cast_nullable_to_non_nullable
as List<EvidenceCardModel>,
  ));
}


}

// dart format on
