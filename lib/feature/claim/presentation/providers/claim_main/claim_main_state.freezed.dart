// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'claim_main_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ClaimMainState {

 bool get isMainLoading; bool get isLoading; bool get isLoadingMore; bool get hasMore; int get page; ClaimSummaryModel? get summary; ClaimSearchStatus get selectedStatus; int get imageCurrentIndex; List<ClaimModel> get claimList; DateTime? get startDate; DateTime? get endDate;
/// Create a copy of ClaimMainState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClaimMainStateCopyWith<ClaimMainState> get copyWith => _$ClaimMainStateCopyWithImpl<ClaimMainState>(this as ClaimMainState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClaimMainState&&(identical(other.isMainLoading, isMainLoading) || other.isMainLoading == isMainLoading)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.page, page) || other.page == page)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.selectedStatus, selectedStatus) || other.selectedStatus == selectedStatus)&&(identical(other.imageCurrentIndex, imageCurrentIndex) || other.imageCurrentIndex == imageCurrentIndex)&&const DeepCollectionEquality().equals(other.claimList, claimList)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}


@override
int get hashCode => Object.hash(runtimeType,isMainLoading,isLoading,isLoadingMore,hasMore,page,summary,selectedStatus,imageCurrentIndex,const DeepCollectionEquality().hash(claimList),startDate,endDate);

@override
String toString() {
  return 'ClaimMainState(isMainLoading: $isMainLoading, isLoading: $isLoading, isLoadingMore: $isLoadingMore, hasMore: $hasMore, page: $page, summary: $summary, selectedStatus: $selectedStatus, imageCurrentIndex: $imageCurrentIndex, claimList: $claimList, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class $ClaimMainStateCopyWith<$Res>  {
  factory $ClaimMainStateCopyWith(ClaimMainState value, $Res Function(ClaimMainState) _then) = _$ClaimMainStateCopyWithImpl;
@useResult
$Res call({
 bool isMainLoading, bool isLoading, bool isLoadingMore, bool hasMore, int page, ClaimSummaryModel? summary, ClaimSearchStatus selectedStatus, int imageCurrentIndex, List<ClaimModel> claimList, DateTime? startDate, DateTime? endDate
});


$ClaimSummaryModelCopyWith<$Res>? get summary;

}
/// @nodoc
class _$ClaimMainStateCopyWithImpl<$Res>
    implements $ClaimMainStateCopyWith<$Res> {
  _$ClaimMainStateCopyWithImpl(this._self, this._then);

  final ClaimMainState _self;
  final $Res Function(ClaimMainState) _then;

/// Create a copy of ClaimMainState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isMainLoading = null,Object? isLoading = null,Object? isLoadingMore = null,Object? hasMore = null,Object? page = null,Object? summary = freezed,Object? selectedStatus = null,Object? imageCurrentIndex = null,Object? claimList = null,Object? startDate = freezed,Object? endDate = freezed,}) {
  return _then(_self.copyWith(
isMainLoading: null == isMainLoading ? _self.isMainLoading : isMainLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as ClaimSummaryModel?,selectedStatus: null == selectedStatus ? _self.selectedStatus : selectedStatus // ignore: cast_nullable_to_non_nullable
as ClaimSearchStatus,imageCurrentIndex: null == imageCurrentIndex ? _self.imageCurrentIndex : imageCurrentIndex // ignore: cast_nullable_to_non_nullable
as int,claimList: null == claimList ? _self.claimList : claimList // ignore: cast_nullable_to_non_nullable
as List<ClaimModel>,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of ClaimMainState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClaimSummaryModelCopyWith<$Res>? get summary {
    if (_self.summary == null) {
    return null;
  }

  return $ClaimSummaryModelCopyWith<$Res>(_self.summary!, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// Adds pattern-matching-related methods to [ClaimMainState].
extension ClaimMainStatePatterns on ClaimMainState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClaimMainState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClaimMainState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClaimMainState value)  $default,){
final _that = this;
switch (_that) {
case _ClaimMainState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClaimMainState value)?  $default,){
final _that = this;
switch (_that) {
case _ClaimMainState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isMainLoading,  bool isLoading,  bool isLoadingMore,  bool hasMore,  int page,  ClaimSummaryModel? summary,  ClaimSearchStatus selectedStatus,  int imageCurrentIndex,  List<ClaimModel> claimList,  DateTime? startDate,  DateTime? endDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClaimMainState() when $default != null:
return $default(_that.isMainLoading,_that.isLoading,_that.isLoadingMore,_that.hasMore,_that.page,_that.summary,_that.selectedStatus,_that.imageCurrentIndex,_that.claimList,_that.startDate,_that.endDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isMainLoading,  bool isLoading,  bool isLoadingMore,  bool hasMore,  int page,  ClaimSummaryModel? summary,  ClaimSearchStatus selectedStatus,  int imageCurrentIndex,  List<ClaimModel> claimList,  DateTime? startDate,  DateTime? endDate)  $default,) {final _that = this;
switch (_that) {
case _ClaimMainState():
return $default(_that.isMainLoading,_that.isLoading,_that.isLoadingMore,_that.hasMore,_that.page,_that.summary,_that.selectedStatus,_that.imageCurrentIndex,_that.claimList,_that.startDate,_that.endDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isMainLoading,  bool isLoading,  bool isLoadingMore,  bool hasMore,  int page,  ClaimSummaryModel? summary,  ClaimSearchStatus selectedStatus,  int imageCurrentIndex,  List<ClaimModel> claimList,  DateTime? startDate,  DateTime? endDate)?  $default,) {final _that = this;
switch (_that) {
case _ClaimMainState() when $default != null:
return $default(_that.isMainLoading,_that.isLoading,_that.isLoadingMore,_that.hasMore,_that.page,_that.summary,_that.selectedStatus,_that.imageCurrentIndex,_that.claimList,_that.startDate,_that.endDate);case _:
  return null;

}
}

}

/// @nodoc


class _ClaimMainState extends ClaimMainState {
  const _ClaimMainState({required this.isMainLoading, required this.isLoading, required this.isLoadingMore, required this.hasMore, required this.page, required this.summary, required this.selectedStatus, required this.imageCurrentIndex, required final  List<ClaimModel> claimList, required this.startDate, required this.endDate}): _claimList = claimList,super._();
  

@override final  bool isMainLoading;
@override final  bool isLoading;
@override final  bool isLoadingMore;
@override final  bool hasMore;
@override final  int page;
@override final  ClaimSummaryModel? summary;
@override final  ClaimSearchStatus selectedStatus;
@override final  int imageCurrentIndex;
 final  List<ClaimModel> _claimList;
@override List<ClaimModel> get claimList {
  if (_claimList is EqualUnmodifiableListView) return _claimList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_claimList);
}

@override final  DateTime? startDate;
@override final  DateTime? endDate;

/// Create a copy of ClaimMainState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClaimMainStateCopyWith<_ClaimMainState> get copyWith => __$ClaimMainStateCopyWithImpl<_ClaimMainState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClaimMainState&&(identical(other.isMainLoading, isMainLoading) || other.isMainLoading == isMainLoading)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.page, page) || other.page == page)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.selectedStatus, selectedStatus) || other.selectedStatus == selectedStatus)&&(identical(other.imageCurrentIndex, imageCurrentIndex) || other.imageCurrentIndex == imageCurrentIndex)&&const DeepCollectionEquality().equals(other._claimList, _claimList)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}


@override
int get hashCode => Object.hash(runtimeType,isMainLoading,isLoading,isLoadingMore,hasMore,page,summary,selectedStatus,imageCurrentIndex,const DeepCollectionEquality().hash(_claimList),startDate,endDate);

@override
String toString() {
  return 'ClaimMainState(isMainLoading: $isMainLoading, isLoading: $isLoading, isLoadingMore: $isLoadingMore, hasMore: $hasMore, page: $page, summary: $summary, selectedStatus: $selectedStatus, imageCurrentIndex: $imageCurrentIndex, claimList: $claimList, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class _$ClaimMainStateCopyWith<$Res> implements $ClaimMainStateCopyWith<$Res> {
  factory _$ClaimMainStateCopyWith(_ClaimMainState value, $Res Function(_ClaimMainState) _then) = __$ClaimMainStateCopyWithImpl;
@override @useResult
$Res call({
 bool isMainLoading, bool isLoading, bool isLoadingMore, bool hasMore, int page, ClaimSummaryModel? summary, ClaimSearchStatus selectedStatus, int imageCurrentIndex, List<ClaimModel> claimList, DateTime? startDate, DateTime? endDate
});


@override $ClaimSummaryModelCopyWith<$Res>? get summary;

}
/// @nodoc
class __$ClaimMainStateCopyWithImpl<$Res>
    implements _$ClaimMainStateCopyWith<$Res> {
  __$ClaimMainStateCopyWithImpl(this._self, this._then);

  final _ClaimMainState _self;
  final $Res Function(_ClaimMainState) _then;

/// Create a copy of ClaimMainState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isMainLoading = null,Object? isLoading = null,Object? isLoadingMore = null,Object? hasMore = null,Object? page = null,Object? summary = freezed,Object? selectedStatus = null,Object? imageCurrentIndex = null,Object? claimList = null,Object? startDate = freezed,Object? endDate = freezed,}) {
  return _then(_ClaimMainState(
isMainLoading: null == isMainLoading ? _self.isMainLoading : isMainLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as ClaimSummaryModel?,selectedStatus: null == selectedStatus ? _self.selectedStatus : selectedStatus // ignore: cast_nullable_to_non_nullable
as ClaimSearchStatus,imageCurrentIndex: null == imageCurrentIndex ? _self.imageCurrentIndex : imageCurrentIndex // ignore: cast_nullable_to_non_nullable
as int,claimList: null == claimList ? _self._claimList : claimList // ignore: cast_nullable_to_non_nullable
as List<ClaimModel>,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of ClaimMainState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClaimSummaryModelCopyWith<$Res>? get summary {
    if (_self.summary == null) {
    return null;
  }

  return $ClaimSummaryModelCopyWith<$Res>(_self.summary!, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}

// dart format on
