// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settlement_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SettlementState {

 bool get isMainLoading; bool get isLoading; bool get isLoadingMore; bool get hasMore; int get page; SettlementSummaryModel? get summary; SettlementTab get currentTab; SettlementStatusType get selectedTopStatus; String get periodStart; String get periodEnd; String? get expandedSettlementId; List<SettlementModel> get settlementList;
/// Create a copy of SettlementState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettlementStateCopyWith<SettlementState> get copyWith => _$SettlementStateCopyWithImpl<SettlementState>(this as SettlementState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettlementState&&(identical(other.isMainLoading, isMainLoading) || other.isMainLoading == isMainLoading)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.page, page) || other.page == page)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.currentTab, currentTab) || other.currentTab == currentTab)&&(identical(other.selectedTopStatus, selectedTopStatus) || other.selectedTopStatus == selectedTopStatus)&&(identical(other.periodStart, periodStart) || other.periodStart == periodStart)&&(identical(other.periodEnd, periodEnd) || other.periodEnd == periodEnd)&&(identical(other.expandedSettlementId, expandedSettlementId) || other.expandedSettlementId == expandedSettlementId)&&const DeepCollectionEquality().equals(other.settlementList, settlementList));
}


@override
int get hashCode => Object.hash(runtimeType,isMainLoading,isLoading,isLoadingMore,hasMore,page,summary,currentTab,selectedTopStatus,periodStart,periodEnd,expandedSettlementId,const DeepCollectionEquality().hash(settlementList));

@override
String toString() {
  return 'SettlementState(isMainLoading: $isMainLoading, isLoading: $isLoading, isLoadingMore: $isLoadingMore, hasMore: $hasMore, page: $page, summary: $summary, currentTab: $currentTab, selectedTopStatus: $selectedTopStatus, periodStart: $periodStart, periodEnd: $periodEnd, expandedSettlementId: $expandedSettlementId, settlementList: $settlementList)';
}


}

/// @nodoc
abstract mixin class $SettlementStateCopyWith<$Res>  {
  factory $SettlementStateCopyWith(SettlementState value, $Res Function(SettlementState) _then) = _$SettlementStateCopyWithImpl;
@useResult
$Res call({
 bool isMainLoading, bool isLoading, bool isLoadingMore, bool hasMore, int page, SettlementSummaryModel? summary, SettlementTab currentTab, SettlementStatusType selectedTopStatus, String periodStart, String periodEnd, String? expandedSettlementId, List<SettlementModel> settlementList
});


$SettlementSummaryModelCopyWith<$Res>? get summary;

}
/// @nodoc
class _$SettlementStateCopyWithImpl<$Res>
    implements $SettlementStateCopyWith<$Res> {
  _$SettlementStateCopyWithImpl(this._self, this._then);

  final SettlementState _self;
  final $Res Function(SettlementState) _then;

/// Create a copy of SettlementState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isMainLoading = null,Object? isLoading = null,Object? isLoadingMore = null,Object? hasMore = null,Object? page = null,Object? summary = freezed,Object? currentTab = null,Object? selectedTopStatus = null,Object? periodStart = null,Object? periodEnd = null,Object? expandedSettlementId = freezed,Object? settlementList = null,}) {
  return _then(_self.copyWith(
isMainLoading: null == isMainLoading ? _self.isMainLoading : isMainLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as SettlementSummaryModel?,currentTab: null == currentTab ? _self.currentTab : currentTab // ignore: cast_nullable_to_non_nullable
as SettlementTab,selectedTopStatus: null == selectedTopStatus ? _self.selectedTopStatus : selectedTopStatus // ignore: cast_nullable_to_non_nullable
as SettlementStatusType,periodStart: null == periodStart ? _self.periodStart : periodStart // ignore: cast_nullable_to_non_nullable
as String,periodEnd: null == periodEnd ? _self.periodEnd : periodEnd // ignore: cast_nullable_to_non_nullable
as String,expandedSettlementId: freezed == expandedSettlementId ? _self.expandedSettlementId : expandedSettlementId // ignore: cast_nullable_to_non_nullable
as String?,settlementList: null == settlementList ? _self.settlementList : settlementList // ignore: cast_nullable_to_non_nullable
as List<SettlementModel>,
  ));
}
/// Create a copy of SettlementState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SettlementSummaryModelCopyWith<$Res>? get summary {
    if (_self.summary == null) {
    return null;
  }

  return $SettlementSummaryModelCopyWith<$Res>(_self.summary!, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// Adds pattern-matching-related methods to [SettlementState].
extension SettlementStatePatterns on SettlementState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SettlementState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SettlementState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SettlementState value)  $default,){
final _that = this;
switch (_that) {
case _SettlementState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SettlementState value)?  $default,){
final _that = this;
switch (_that) {
case _SettlementState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isMainLoading,  bool isLoading,  bool isLoadingMore,  bool hasMore,  int page,  SettlementSummaryModel? summary,  SettlementTab currentTab,  SettlementStatusType selectedTopStatus,  String periodStart,  String periodEnd,  String? expandedSettlementId,  List<SettlementModel> settlementList)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SettlementState() when $default != null:
return $default(_that.isMainLoading,_that.isLoading,_that.isLoadingMore,_that.hasMore,_that.page,_that.summary,_that.currentTab,_that.selectedTopStatus,_that.periodStart,_that.periodEnd,_that.expandedSettlementId,_that.settlementList);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isMainLoading,  bool isLoading,  bool isLoadingMore,  bool hasMore,  int page,  SettlementSummaryModel? summary,  SettlementTab currentTab,  SettlementStatusType selectedTopStatus,  String periodStart,  String periodEnd,  String? expandedSettlementId,  List<SettlementModel> settlementList)  $default,) {final _that = this;
switch (_that) {
case _SettlementState():
return $default(_that.isMainLoading,_that.isLoading,_that.isLoadingMore,_that.hasMore,_that.page,_that.summary,_that.currentTab,_that.selectedTopStatus,_that.periodStart,_that.periodEnd,_that.expandedSettlementId,_that.settlementList);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isMainLoading,  bool isLoading,  bool isLoadingMore,  bool hasMore,  int page,  SettlementSummaryModel? summary,  SettlementTab currentTab,  SettlementStatusType selectedTopStatus,  String periodStart,  String periodEnd,  String? expandedSettlementId,  List<SettlementModel> settlementList)?  $default,) {final _that = this;
switch (_that) {
case _SettlementState() when $default != null:
return $default(_that.isMainLoading,_that.isLoading,_that.isLoadingMore,_that.hasMore,_that.page,_that.summary,_that.currentTab,_that.selectedTopStatus,_that.periodStart,_that.periodEnd,_that.expandedSettlementId,_that.settlementList);case _:
  return null;

}
}

}

/// @nodoc


class _SettlementState extends SettlementState {
  const _SettlementState({required this.isMainLoading, required this.isLoading, required this.isLoadingMore, required this.hasMore, required this.page, required this.summary, required this.currentTab, required this.selectedTopStatus, required this.periodStart, required this.periodEnd, this.expandedSettlementId, required final  List<SettlementModel> settlementList}): _settlementList = settlementList,super._();
  

@override final  bool isMainLoading;
@override final  bool isLoading;
@override final  bool isLoadingMore;
@override final  bool hasMore;
@override final  int page;
@override final  SettlementSummaryModel? summary;
@override final  SettlementTab currentTab;
@override final  SettlementStatusType selectedTopStatus;
@override final  String periodStart;
@override final  String periodEnd;
@override final  String? expandedSettlementId;
 final  List<SettlementModel> _settlementList;
@override List<SettlementModel> get settlementList {
  if (_settlementList is EqualUnmodifiableListView) return _settlementList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_settlementList);
}


/// Create a copy of SettlementState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettlementStateCopyWith<_SettlementState> get copyWith => __$SettlementStateCopyWithImpl<_SettlementState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SettlementState&&(identical(other.isMainLoading, isMainLoading) || other.isMainLoading == isMainLoading)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.page, page) || other.page == page)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.currentTab, currentTab) || other.currentTab == currentTab)&&(identical(other.selectedTopStatus, selectedTopStatus) || other.selectedTopStatus == selectedTopStatus)&&(identical(other.periodStart, periodStart) || other.periodStart == periodStart)&&(identical(other.periodEnd, periodEnd) || other.periodEnd == periodEnd)&&(identical(other.expandedSettlementId, expandedSettlementId) || other.expandedSettlementId == expandedSettlementId)&&const DeepCollectionEquality().equals(other._settlementList, _settlementList));
}


@override
int get hashCode => Object.hash(runtimeType,isMainLoading,isLoading,isLoadingMore,hasMore,page,summary,currentTab,selectedTopStatus,periodStart,periodEnd,expandedSettlementId,const DeepCollectionEquality().hash(_settlementList));

@override
String toString() {
  return 'SettlementState(isMainLoading: $isMainLoading, isLoading: $isLoading, isLoadingMore: $isLoadingMore, hasMore: $hasMore, page: $page, summary: $summary, currentTab: $currentTab, selectedTopStatus: $selectedTopStatus, periodStart: $periodStart, periodEnd: $periodEnd, expandedSettlementId: $expandedSettlementId, settlementList: $settlementList)';
}


}

/// @nodoc
abstract mixin class _$SettlementStateCopyWith<$Res> implements $SettlementStateCopyWith<$Res> {
  factory _$SettlementStateCopyWith(_SettlementState value, $Res Function(_SettlementState) _then) = __$SettlementStateCopyWithImpl;
@override @useResult
$Res call({
 bool isMainLoading, bool isLoading, bool isLoadingMore, bool hasMore, int page, SettlementSummaryModel? summary, SettlementTab currentTab, SettlementStatusType selectedTopStatus, String periodStart, String periodEnd, String? expandedSettlementId, List<SettlementModel> settlementList
});


@override $SettlementSummaryModelCopyWith<$Res>? get summary;

}
/// @nodoc
class __$SettlementStateCopyWithImpl<$Res>
    implements _$SettlementStateCopyWith<$Res> {
  __$SettlementStateCopyWithImpl(this._self, this._then);

  final _SettlementState _self;
  final $Res Function(_SettlementState) _then;

/// Create a copy of SettlementState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isMainLoading = null,Object? isLoading = null,Object? isLoadingMore = null,Object? hasMore = null,Object? page = null,Object? summary = freezed,Object? currentTab = null,Object? selectedTopStatus = null,Object? periodStart = null,Object? periodEnd = null,Object? expandedSettlementId = freezed,Object? settlementList = null,}) {
  return _then(_SettlementState(
isMainLoading: null == isMainLoading ? _self.isMainLoading : isMainLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as SettlementSummaryModel?,currentTab: null == currentTab ? _self.currentTab : currentTab // ignore: cast_nullable_to_non_nullable
as SettlementTab,selectedTopStatus: null == selectedTopStatus ? _self.selectedTopStatus : selectedTopStatus // ignore: cast_nullable_to_non_nullable
as SettlementStatusType,periodStart: null == periodStart ? _self.periodStart : periodStart // ignore: cast_nullable_to_non_nullable
as String,periodEnd: null == periodEnd ? _self.periodEnd : periodEnd // ignore: cast_nullable_to_non_nullable
as String,expandedSettlementId: freezed == expandedSettlementId ? _self.expandedSettlementId : expandedSettlementId // ignore: cast_nullable_to_non_nullable
as String?,settlementList: null == settlementList ? _self._settlementList : settlementList // ignore: cast_nullable_to_non_nullable
as List<SettlementModel>,
  ));
}

/// Create a copy of SettlementState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SettlementSummaryModelCopyWith<$Res>? get summary {
    if (_self.summary == null) {
    return null;
  }

  return $SettlementSummaryModelCopyWith<$Res>(_self.summary!, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}

// dart format on
