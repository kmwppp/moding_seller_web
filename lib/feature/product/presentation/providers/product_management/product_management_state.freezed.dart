// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_management_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductManagementState {

 MyProductSummaryModel? get summary; String get selectedStatus; String get searchWord; bool get isMainLoading; bool get isLoading; bool get isLoadingMore; bool get hasMore; int get page; List<MyProductModel> get productList; List<MyProductModel> get filteredProductList;
/// Create a copy of ProductManagementState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductManagementStateCopyWith<ProductManagementState> get copyWith => _$ProductManagementStateCopyWithImpl<ProductManagementState>(this as ProductManagementState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductManagementState&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.selectedStatus, selectedStatus) || other.selectedStatus == selectedStatus)&&(identical(other.searchWord, searchWord) || other.searchWord == searchWord)&&(identical(other.isMainLoading, isMainLoading) || other.isMainLoading == isMainLoading)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.page, page) || other.page == page)&&const DeepCollectionEquality().equals(other.productList, productList)&&const DeepCollectionEquality().equals(other.filteredProductList, filteredProductList));
}


@override
int get hashCode => Object.hash(runtimeType,summary,selectedStatus,searchWord,isMainLoading,isLoading,isLoadingMore,hasMore,page,const DeepCollectionEquality().hash(productList),const DeepCollectionEquality().hash(filteredProductList));

@override
String toString() {
  return 'ProductManagementState(summary: $summary, selectedStatus: $selectedStatus, searchWord: $searchWord, isMainLoading: $isMainLoading, isLoading: $isLoading, isLoadingMore: $isLoadingMore, hasMore: $hasMore, page: $page, productList: $productList, filteredProductList: $filteredProductList)';
}


}

/// @nodoc
abstract mixin class $ProductManagementStateCopyWith<$Res>  {
  factory $ProductManagementStateCopyWith(ProductManagementState value, $Res Function(ProductManagementState) _then) = _$ProductManagementStateCopyWithImpl;
@useResult
$Res call({
 MyProductSummaryModel? summary, String selectedStatus, String searchWord, bool isMainLoading, bool isLoading, bool isLoadingMore, bool hasMore, int page, List<MyProductModel> productList, List<MyProductModel> filteredProductList
});


$MyProductSummaryModelCopyWith<$Res>? get summary;

}
/// @nodoc
class _$ProductManagementStateCopyWithImpl<$Res>
    implements $ProductManagementStateCopyWith<$Res> {
  _$ProductManagementStateCopyWithImpl(this._self, this._then);

  final ProductManagementState _self;
  final $Res Function(ProductManagementState) _then;

/// Create a copy of ProductManagementState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? summary = freezed,Object? selectedStatus = null,Object? searchWord = null,Object? isMainLoading = null,Object? isLoading = null,Object? isLoadingMore = null,Object? hasMore = null,Object? page = null,Object? productList = null,Object? filteredProductList = null,}) {
  return _then(_self.copyWith(
summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as MyProductSummaryModel?,selectedStatus: null == selectedStatus ? _self.selectedStatus : selectedStatus // ignore: cast_nullable_to_non_nullable
as String,searchWord: null == searchWord ? _self.searchWord : searchWord // ignore: cast_nullable_to_non_nullable
as String,isMainLoading: null == isMainLoading ? _self.isMainLoading : isMainLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,productList: null == productList ? _self.productList : productList // ignore: cast_nullable_to_non_nullable
as List<MyProductModel>,filteredProductList: null == filteredProductList ? _self.filteredProductList : filteredProductList // ignore: cast_nullable_to_non_nullable
as List<MyProductModel>,
  ));
}
/// Create a copy of ProductManagementState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyProductSummaryModelCopyWith<$Res>? get summary {
    if (_self.summary == null) {
    return null;
  }

  return $MyProductSummaryModelCopyWith<$Res>(_self.summary!, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProductManagementState].
extension ProductManagementStatePatterns on ProductManagementState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductManagementState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductManagementState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductManagementState value)  $default,){
final _that = this;
switch (_that) {
case _ProductManagementState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductManagementState value)?  $default,){
final _that = this;
switch (_that) {
case _ProductManagementState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MyProductSummaryModel? summary,  String selectedStatus,  String searchWord,  bool isMainLoading,  bool isLoading,  bool isLoadingMore,  bool hasMore,  int page,  List<MyProductModel> productList,  List<MyProductModel> filteredProductList)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductManagementState() when $default != null:
return $default(_that.summary,_that.selectedStatus,_that.searchWord,_that.isMainLoading,_that.isLoading,_that.isLoadingMore,_that.hasMore,_that.page,_that.productList,_that.filteredProductList);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MyProductSummaryModel? summary,  String selectedStatus,  String searchWord,  bool isMainLoading,  bool isLoading,  bool isLoadingMore,  bool hasMore,  int page,  List<MyProductModel> productList,  List<MyProductModel> filteredProductList)  $default,) {final _that = this;
switch (_that) {
case _ProductManagementState():
return $default(_that.summary,_that.selectedStatus,_that.searchWord,_that.isMainLoading,_that.isLoading,_that.isLoadingMore,_that.hasMore,_that.page,_that.productList,_that.filteredProductList);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MyProductSummaryModel? summary,  String selectedStatus,  String searchWord,  bool isMainLoading,  bool isLoading,  bool isLoadingMore,  bool hasMore,  int page,  List<MyProductModel> productList,  List<MyProductModel> filteredProductList)?  $default,) {final _that = this;
switch (_that) {
case _ProductManagementState() when $default != null:
return $default(_that.summary,_that.selectedStatus,_that.searchWord,_that.isMainLoading,_that.isLoading,_that.isLoadingMore,_that.hasMore,_that.page,_that.productList,_that.filteredProductList);case _:
  return null;

}
}

}

/// @nodoc


class _ProductManagementState extends ProductManagementState {
  const _ProductManagementState({required this.summary, required this.selectedStatus, required this.searchWord, required this.isMainLoading, required this.isLoading, required this.isLoadingMore, required this.hasMore, required this.page, required final  List<MyProductModel> productList, required final  List<MyProductModel> filteredProductList}): _productList = productList,_filteredProductList = filteredProductList,super._();
  

@override final  MyProductSummaryModel? summary;
@override final  String selectedStatus;
@override final  String searchWord;
@override final  bool isMainLoading;
@override final  bool isLoading;
@override final  bool isLoadingMore;
@override final  bool hasMore;
@override final  int page;
 final  List<MyProductModel> _productList;
@override List<MyProductModel> get productList {
  if (_productList is EqualUnmodifiableListView) return _productList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_productList);
}

 final  List<MyProductModel> _filteredProductList;
@override List<MyProductModel> get filteredProductList {
  if (_filteredProductList is EqualUnmodifiableListView) return _filteredProductList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_filteredProductList);
}


/// Create a copy of ProductManagementState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductManagementStateCopyWith<_ProductManagementState> get copyWith => __$ProductManagementStateCopyWithImpl<_ProductManagementState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductManagementState&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.selectedStatus, selectedStatus) || other.selectedStatus == selectedStatus)&&(identical(other.searchWord, searchWord) || other.searchWord == searchWord)&&(identical(other.isMainLoading, isMainLoading) || other.isMainLoading == isMainLoading)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.page, page) || other.page == page)&&const DeepCollectionEquality().equals(other._productList, _productList)&&const DeepCollectionEquality().equals(other._filteredProductList, _filteredProductList));
}


@override
int get hashCode => Object.hash(runtimeType,summary,selectedStatus,searchWord,isMainLoading,isLoading,isLoadingMore,hasMore,page,const DeepCollectionEquality().hash(_productList),const DeepCollectionEquality().hash(_filteredProductList));

@override
String toString() {
  return 'ProductManagementState(summary: $summary, selectedStatus: $selectedStatus, searchWord: $searchWord, isMainLoading: $isMainLoading, isLoading: $isLoading, isLoadingMore: $isLoadingMore, hasMore: $hasMore, page: $page, productList: $productList, filteredProductList: $filteredProductList)';
}


}

/// @nodoc
abstract mixin class _$ProductManagementStateCopyWith<$Res> implements $ProductManagementStateCopyWith<$Res> {
  factory _$ProductManagementStateCopyWith(_ProductManagementState value, $Res Function(_ProductManagementState) _then) = __$ProductManagementStateCopyWithImpl;
@override @useResult
$Res call({
 MyProductSummaryModel? summary, String selectedStatus, String searchWord, bool isMainLoading, bool isLoading, bool isLoadingMore, bool hasMore, int page, List<MyProductModel> productList, List<MyProductModel> filteredProductList
});


@override $MyProductSummaryModelCopyWith<$Res>? get summary;

}
/// @nodoc
class __$ProductManagementStateCopyWithImpl<$Res>
    implements _$ProductManagementStateCopyWith<$Res> {
  __$ProductManagementStateCopyWithImpl(this._self, this._then);

  final _ProductManagementState _self;
  final $Res Function(_ProductManagementState) _then;

/// Create a copy of ProductManagementState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? summary = freezed,Object? selectedStatus = null,Object? searchWord = null,Object? isMainLoading = null,Object? isLoading = null,Object? isLoadingMore = null,Object? hasMore = null,Object? page = null,Object? productList = null,Object? filteredProductList = null,}) {
  return _then(_ProductManagementState(
summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as MyProductSummaryModel?,selectedStatus: null == selectedStatus ? _self.selectedStatus : selectedStatus // ignore: cast_nullable_to_non_nullable
as String,searchWord: null == searchWord ? _self.searchWord : searchWord // ignore: cast_nullable_to_non_nullable
as String,isMainLoading: null == isMainLoading ? _self.isMainLoading : isMainLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,productList: null == productList ? _self._productList : productList // ignore: cast_nullable_to_non_nullable
as List<MyProductModel>,filteredProductList: null == filteredProductList ? _self._filteredProductList : filteredProductList // ignore: cast_nullable_to_non_nullable
as List<MyProductModel>,
  ));
}

/// Create a copy of ProductManagementState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyProductSummaryModelCopyWith<$Res>? get summary {
    if (_self.summary == null) {
    return null;
  }

  return $MyProductSummaryModelCopyWith<$Res>(_self.summary!, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}

// dart format on
