// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'claim_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ClaimDetailState {

 bool get isLoading; int get imageCurrentIndex; ClaimDetailModel? get model; List<String> get images; ReasonType? get selectedReason; String get etcText; ApproveType? get selectApprove; DeliveryMethod? get deliveryMethod; List<DeliveryMethod>? get deliveryMethodList; List<DeliveryExecuteTab> get availableDeliveryTabs; DeliveryExecuteTab get selectedDeliveryTab; CarrierModel? get courierCompany; List<CarrierModel> get courierCompanyList; String? get invoice; bool get isTrackingValidated; String get trackingValidationMessage; HanjinServiceCategory? get hanjinServiceCategory; HanjinBoxType? get hanjinBoxType; HanjinPayType? get hanjinPayType;
/// Create a copy of ClaimDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClaimDetailStateCopyWith<ClaimDetailState> get copyWith => _$ClaimDetailStateCopyWithImpl<ClaimDetailState>(this as ClaimDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClaimDetailState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.imageCurrentIndex, imageCurrentIndex) || other.imageCurrentIndex == imageCurrentIndex)&&(identical(other.model, model) || other.model == model)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.selectedReason, selectedReason) || other.selectedReason == selectedReason)&&(identical(other.etcText, etcText) || other.etcText == etcText)&&(identical(other.selectApprove, selectApprove) || other.selectApprove == selectApprove)&&(identical(other.deliveryMethod, deliveryMethod) || other.deliveryMethod == deliveryMethod)&&const DeepCollectionEquality().equals(other.deliveryMethodList, deliveryMethodList)&&const DeepCollectionEquality().equals(other.availableDeliveryTabs, availableDeliveryTabs)&&(identical(other.selectedDeliveryTab, selectedDeliveryTab) || other.selectedDeliveryTab == selectedDeliveryTab)&&(identical(other.courierCompany, courierCompany) || other.courierCompany == courierCompany)&&const DeepCollectionEquality().equals(other.courierCompanyList, courierCompanyList)&&(identical(other.invoice, invoice) || other.invoice == invoice)&&(identical(other.isTrackingValidated, isTrackingValidated) || other.isTrackingValidated == isTrackingValidated)&&(identical(other.trackingValidationMessage, trackingValidationMessage) || other.trackingValidationMessage == trackingValidationMessage)&&(identical(other.hanjinServiceCategory, hanjinServiceCategory) || other.hanjinServiceCategory == hanjinServiceCategory)&&(identical(other.hanjinBoxType, hanjinBoxType) || other.hanjinBoxType == hanjinBoxType)&&(identical(other.hanjinPayType, hanjinPayType) || other.hanjinPayType == hanjinPayType));
}


@override
int get hashCode => Object.hashAll([runtimeType,isLoading,imageCurrentIndex,model,const DeepCollectionEquality().hash(images),selectedReason,etcText,selectApprove,deliveryMethod,const DeepCollectionEquality().hash(deliveryMethodList),const DeepCollectionEquality().hash(availableDeliveryTabs),selectedDeliveryTab,courierCompany,const DeepCollectionEquality().hash(courierCompanyList),invoice,isTrackingValidated,trackingValidationMessage,hanjinServiceCategory,hanjinBoxType,hanjinPayType]);

@override
String toString() {
  return 'ClaimDetailState(isLoading: $isLoading, imageCurrentIndex: $imageCurrentIndex, model: $model, images: $images, selectedReason: $selectedReason, etcText: $etcText, selectApprove: $selectApprove, deliveryMethod: $deliveryMethod, deliveryMethodList: $deliveryMethodList, availableDeliveryTabs: $availableDeliveryTabs, selectedDeliveryTab: $selectedDeliveryTab, courierCompany: $courierCompany, courierCompanyList: $courierCompanyList, invoice: $invoice, isTrackingValidated: $isTrackingValidated, trackingValidationMessage: $trackingValidationMessage, hanjinServiceCategory: $hanjinServiceCategory, hanjinBoxType: $hanjinBoxType, hanjinPayType: $hanjinPayType)';
}


}

/// @nodoc
abstract mixin class $ClaimDetailStateCopyWith<$Res>  {
  factory $ClaimDetailStateCopyWith(ClaimDetailState value, $Res Function(ClaimDetailState) _then) = _$ClaimDetailStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, int imageCurrentIndex, ClaimDetailModel? model, List<String> images, ReasonType? selectedReason, String etcText, ApproveType? selectApprove, DeliveryMethod? deliveryMethod, List<DeliveryMethod>? deliveryMethodList, List<DeliveryExecuteTab> availableDeliveryTabs, DeliveryExecuteTab selectedDeliveryTab, CarrierModel? courierCompany, List<CarrierModel> courierCompanyList, String? invoice, bool isTrackingValidated, String trackingValidationMessage, HanjinServiceCategory? hanjinServiceCategory, HanjinBoxType? hanjinBoxType, HanjinPayType? hanjinPayType
});


$ClaimDetailModelCopyWith<$Res>? get model;$CarrierModelCopyWith<$Res>? get courierCompany;

}
/// @nodoc
class _$ClaimDetailStateCopyWithImpl<$Res>
    implements $ClaimDetailStateCopyWith<$Res> {
  _$ClaimDetailStateCopyWithImpl(this._self, this._then);

  final ClaimDetailState _self;
  final $Res Function(ClaimDetailState) _then;

/// Create a copy of ClaimDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? imageCurrentIndex = null,Object? model = freezed,Object? images = null,Object? selectedReason = freezed,Object? etcText = null,Object? selectApprove = freezed,Object? deliveryMethod = freezed,Object? deliveryMethodList = freezed,Object? availableDeliveryTabs = null,Object? selectedDeliveryTab = null,Object? courierCompany = freezed,Object? courierCompanyList = null,Object? invoice = freezed,Object? isTrackingValidated = null,Object? trackingValidationMessage = null,Object? hanjinServiceCategory = freezed,Object? hanjinBoxType = freezed,Object? hanjinPayType = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,imageCurrentIndex: null == imageCurrentIndex ? _self.imageCurrentIndex : imageCurrentIndex // ignore: cast_nullable_to_non_nullable
as int,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as ClaimDetailModel?,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>,selectedReason: freezed == selectedReason ? _self.selectedReason : selectedReason // ignore: cast_nullable_to_non_nullable
as ReasonType?,etcText: null == etcText ? _self.etcText : etcText // ignore: cast_nullable_to_non_nullable
as String,selectApprove: freezed == selectApprove ? _self.selectApprove : selectApprove // ignore: cast_nullable_to_non_nullable
as ApproveType?,deliveryMethod: freezed == deliveryMethod ? _self.deliveryMethod : deliveryMethod // ignore: cast_nullable_to_non_nullable
as DeliveryMethod?,deliveryMethodList: freezed == deliveryMethodList ? _self.deliveryMethodList : deliveryMethodList // ignore: cast_nullable_to_non_nullable
as List<DeliveryMethod>?,availableDeliveryTabs: null == availableDeliveryTabs ? _self.availableDeliveryTabs : availableDeliveryTabs // ignore: cast_nullable_to_non_nullable
as List<DeliveryExecuteTab>,selectedDeliveryTab: null == selectedDeliveryTab ? _self.selectedDeliveryTab : selectedDeliveryTab // ignore: cast_nullable_to_non_nullable
as DeliveryExecuteTab,courierCompany: freezed == courierCompany ? _self.courierCompany : courierCompany // ignore: cast_nullable_to_non_nullable
as CarrierModel?,courierCompanyList: null == courierCompanyList ? _self.courierCompanyList : courierCompanyList // ignore: cast_nullable_to_non_nullable
as List<CarrierModel>,invoice: freezed == invoice ? _self.invoice : invoice // ignore: cast_nullable_to_non_nullable
as String?,isTrackingValidated: null == isTrackingValidated ? _self.isTrackingValidated : isTrackingValidated // ignore: cast_nullable_to_non_nullable
as bool,trackingValidationMessage: null == trackingValidationMessage ? _self.trackingValidationMessage : trackingValidationMessage // ignore: cast_nullable_to_non_nullable
as String,hanjinServiceCategory: freezed == hanjinServiceCategory ? _self.hanjinServiceCategory : hanjinServiceCategory // ignore: cast_nullable_to_non_nullable
as HanjinServiceCategory?,hanjinBoxType: freezed == hanjinBoxType ? _self.hanjinBoxType : hanjinBoxType // ignore: cast_nullable_to_non_nullable
as HanjinBoxType?,hanjinPayType: freezed == hanjinPayType ? _self.hanjinPayType : hanjinPayType // ignore: cast_nullable_to_non_nullable
as HanjinPayType?,
  ));
}
/// Create a copy of ClaimDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClaimDetailModelCopyWith<$Res>? get model {
    if (_self.model == null) {
    return null;
  }

  return $ClaimDetailModelCopyWith<$Res>(_self.model!, (value) {
    return _then(_self.copyWith(model: value));
  });
}/// Create a copy of ClaimDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CarrierModelCopyWith<$Res>? get courierCompany {
    if (_self.courierCompany == null) {
    return null;
  }

  return $CarrierModelCopyWith<$Res>(_self.courierCompany!, (value) {
    return _then(_self.copyWith(courierCompany: value));
  });
}
}


/// Adds pattern-matching-related methods to [ClaimDetailState].
extension ClaimDetailStatePatterns on ClaimDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClaimDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClaimDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClaimDetailState value)  $default,){
final _that = this;
switch (_that) {
case _ClaimDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClaimDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _ClaimDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  int imageCurrentIndex,  ClaimDetailModel? model,  List<String> images,  ReasonType? selectedReason,  String etcText,  ApproveType? selectApprove,  DeliveryMethod? deliveryMethod,  List<DeliveryMethod>? deliveryMethodList,  List<DeliveryExecuteTab> availableDeliveryTabs,  DeliveryExecuteTab selectedDeliveryTab,  CarrierModel? courierCompany,  List<CarrierModel> courierCompanyList,  String? invoice,  bool isTrackingValidated,  String trackingValidationMessage,  HanjinServiceCategory? hanjinServiceCategory,  HanjinBoxType? hanjinBoxType,  HanjinPayType? hanjinPayType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClaimDetailState() when $default != null:
return $default(_that.isLoading,_that.imageCurrentIndex,_that.model,_that.images,_that.selectedReason,_that.etcText,_that.selectApprove,_that.deliveryMethod,_that.deliveryMethodList,_that.availableDeliveryTabs,_that.selectedDeliveryTab,_that.courierCompany,_that.courierCompanyList,_that.invoice,_that.isTrackingValidated,_that.trackingValidationMessage,_that.hanjinServiceCategory,_that.hanjinBoxType,_that.hanjinPayType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  int imageCurrentIndex,  ClaimDetailModel? model,  List<String> images,  ReasonType? selectedReason,  String etcText,  ApproveType? selectApprove,  DeliveryMethod? deliveryMethod,  List<DeliveryMethod>? deliveryMethodList,  List<DeliveryExecuteTab> availableDeliveryTabs,  DeliveryExecuteTab selectedDeliveryTab,  CarrierModel? courierCompany,  List<CarrierModel> courierCompanyList,  String? invoice,  bool isTrackingValidated,  String trackingValidationMessage,  HanjinServiceCategory? hanjinServiceCategory,  HanjinBoxType? hanjinBoxType,  HanjinPayType? hanjinPayType)  $default,) {final _that = this;
switch (_that) {
case _ClaimDetailState():
return $default(_that.isLoading,_that.imageCurrentIndex,_that.model,_that.images,_that.selectedReason,_that.etcText,_that.selectApprove,_that.deliveryMethod,_that.deliveryMethodList,_that.availableDeliveryTabs,_that.selectedDeliveryTab,_that.courierCompany,_that.courierCompanyList,_that.invoice,_that.isTrackingValidated,_that.trackingValidationMessage,_that.hanjinServiceCategory,_that.hanjinBoxType,_that.hanjinPayType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  int imageCurrentIndex,  ClaimDetailModel? model,  List<String> images,  ReasonType? selectedReason,  String etcText,  ApproveType? selectApprove,  DeliveryMethod? deliveryMethod,  List<DeliveryMethod>? deliveryMethodList,  List<DeliveryExecuteTab> availableDeliveryTabs,  DeliveryExecuteTab selectedDeliveryTab,  CarrierModel? courierCompany,  List<CarrierModel> courierCompanyList,  String? invoice,  bool isTrackingValidated,  String trackingValidationMessage,  HanjinServiceCategory? hanjinServiceCategory,  HanjinBoxType? hanjinBoxType,  HanjinPayType? hanjinPayType)?  $default,) {final _that = this;
switch (_that) {
case _ClaimDetailState() when $default != null:
return $default(_that.isLoading,_that.imageCurrentIndex,_that.model,_that.images,_that.selectedReason,_that.etcText,_that.selectApprove,_that.deliveryMethod,_that.deliveryMethodList,_that.availableDeliveryTabs,_that.selectedDeliveryTab,_that.courierCompany,_that.courierCompanyList,_that.invoice,_that.isTrackingValidated,_that.trackingValidationMessage,_that.hanjinServiceCategory,_that.hanjinBoxType,_that.hanjinPayType);case _:
  return null;

}
}

}

/// @nodoc


class _ClaimDetailState extends ClaimDetailState {
  const _ClaimDetailState({required this.isLoading, required this.imageCurrentIndex, required this.model, required final  List<String> images, required this.selectedReason, required this.etcText, required this.selectApprove, required this.deliveryMethod, required final  List<DeliveryMethod>? deliveryMethodList, required final  List<DeliveryExecuteTab> availableDeliveryTabs, required this.selectedDeliveryTab, required this.courierCompany, required final  List<CarrierModel> courierCompanyList, required this.invoice, required this.isTrackingValidated, required this.trackingValidationMessage, required this.hanjinServiceCategory, required this.hanjinBoxType, required this.hanjinPayType}): _images = images,_deliveryMethodList = deliveryMethodList,_availableDeliveryTabs = availableDeliveryTabs,_courierCompanyList = courierCompanyList,super._();
  

@override final  bool isLoading;
@override final  int imageCurrentIndex;
@override final  ClaimDetailModel? model;
 final  List<String> _images;
@override List<String> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

@override final  ReasonType? selectedReason;
@override final  String etcText;
@override final  ApproveType? selectApprove;
@override final  DeliveryMethod? deliveryMethod;
 final  List<DeliveryMethod>? _deliveryMethodList;
@override List<DeliveryMethod>? get deliveryMethodList {
  final value = _deliveryMethodList;
  if (value == null) return null;
  if (_deliveryMethodList is EqualUnmodifiableListView) return _deliveryMethodList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<DeliveryExecuteTab> _availableDeliveryTabs;
@override List<DeliveryExecuteTab> get availableDeliveryTabs {
  if (_availableDeliveryTabs is EqualUnmodifiableListView) return _availableDeliveryTabs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_availableDeliveryTabs);
}

@override final  DeliveryExecuteTab selectedDeliveryTab;
@override final  CarrierModel? courierCompany;
 final  List<CarrierModel> _courierCompanyList;
@override List<CarrierModel> get courierCompanyList {
  if (_courierCompanyList is EqualUnmodifiableListView) return _courierCompanyList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_courierCompanyList);
}

@override final  String? invoice;
@override final  bool isTrackingValidated;
@override final  String trackingValidationMessage;
@override final  HanjinServiceCategory? hanjinServiceCategory;
@override final  HanjinBoxType? hanjinBoxType;
@override final  HanjinPayType? hanjinPayType;

/// Create a copy of ClaimDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClaimDetailStateCopyWith<_ClaimDetailState> get copyWith => __$ClaimDetailStateCopyWithImpl<_ClaimDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClaimDetailState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.imageCurrentIndex, imageCurrentIndex) || other.imageCurrentIndex == imageCurrentIndex)&&(identical(other.model, model) || other.model == model)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.selectedReason, selectedReason) || other.selectedReason == selectedReason)&&(identical(other.etcText, etcText) || other.etcText == etcText)&&(identical(other.selectApprove, selectApprove) || other.selectApprove == selectApprove)&&(identical(other.deliveryMethod, deliveryMethod) || other.deliveryMethod == deliveryMethod)&&const DeepCollectionEquality().equals(other._deliveryMethodList, _deliveryMethodList)&&const DeepCollectionEquality().equals(other._availableDeliveryTabs, _availableDeliveryTabs)&&(identical(other.selectedDeliveryTab, selectedDeliveryTab) || other.selectedDeliveryTab == selectedDeliveryTab)&&(identical(other.courierCompany, courierCompany) || other.courierCompany == courierCompany)&&const DeepCollectionEquality().equals(other._courierCompanyList, _courierCompanyList)&&(identical(other.invoice, invoice) || other.invoice == invoice)&&(identical(other.isTrackingValidated, isTrackingValidated) || other.isTrackingValidated == isTrackingValidated)&&(identical(other.trackingValidationMessage, trackingValidationMessage) || other.trackingValidationMessage == trackingValidationMessage)&&(identical(other.hanjinServiceCategory, hanjinServiceCategory) || other.hanjinServiceCategory == hanjinServiceCategory)&&(identical(other.hanjinBoxType, hanjinBoxType) || other.hanjinBoxType == hanjinBoxType)&&(identical(other.hanjinPayType, hanjinPayType) || other.hanjinPayType == hanjinPayType));
}


@override
int get hashCode => Object.hashAll([runtimeType,isLoading,imageCurrentIndex,model,const DeepCollectionEquality().hash(_images),selectedReason,etcText,selectApprove,deliveryMethod,const DeepCollectionEquality().hash(_deliveryMethodList),const DeepCollectionEquality().hash(_availableDeliveryTabs),selectedDeliveryTab,courierCompany,const DeepCollectionEquality().hash(_courierCompanyList),invoice,isTrackingValidated,trackingValidationMessage,hanjinServiceCategory,hanjinBoxType,hanjinPayType]);

@override
String toString() {
  return 'ClaimDetailState(isLoading: $isLoading, imageCurrentIndex: $imageCurrentIndex, model: $model, images: $images, selectedReason: $selectedReason, etcText: $etcText, selectApprove: $selectApprove, deliveryMethod: $deliveryMethod, deliveryMethodList: $deliveryMethodList, availableDeliveryTabs: $availableDeliveryTabs, selectedDeliveryTab: $selectedDeliveryTab, courierCompany: $courierCompany, courierCompanyList: $courierCompanyList, invoice: $invoice, isTrackingValidated: $isTrackingValidated, trackingValidationMessage: $trackingValidationMessage, hanjinServiceCategory: $hanjinServiceCategory, hanjinBoxType: $hanjinBoxType, hanjinPayType: $hanjinPayType)';
}


}

/// @nodoc
abstract mixin class _$ClaimDetailStateCopyWith<$Res> implements $ClaimDetailStateCopyWith<$Res> {
  factory _$ClaimDetailStateCopyWith(_ClaimDetailState value, $Res Function(_ClaimDetailState) _then) = __$ClaimDetailStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, int imageCurrentIndex, ClaimDetailModel? model, List<String> images, ReasonType? selectedReason, String etcText, ApproveType? selectApprove, DeliveryMethod? deliveryMethod, List<DeliveryMethod>? deliveryMethodList, List<DeliveryExecuteTab> availableDeliveryTabs, DeliveryExecuteTab selectedDeliveryTab, CarrierModel? courierCompany, List<CarrierModel> courierCompanyList, String? invoice, bool isTrackingValidated, String trackingValidationMessage, HanjinServiceCategory? hanjinServiceCategory, HanjinBoxType? hanjinBoxType, HanjinPayType? hanjinPayType
});


@override $ClaimDetailModelCopyWith<$Res>? get model;@override $CarrierModelCopyWith<$Res>? get courierCompany;

}
/// @nodoc
class __$ClaimDetailStateCopyWithImpl<$Res>
    implements _$ClaimDetailStateCopyWith<$Res> {
  __$ClaimDetailStateCopyWithImpl(this._self, this._then);

  final _ClaimDetailState _self;
  final $Res Function(_ClaimDetailState) _then;

/// Create a copy of ClaimDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? imageCurrentIndex = null,Object? model = freezed,Object? images = null,Object? selectedReason = freezed,Object? etcText = null,Object? selectApprove = freezed,Object? deliveryMethod = freezed,Object? deliveryMethodList = freezed,Object? availableDeliveryTabs = null,Object? selectedDeliveryTab = null,Object? courierCompany = freezed,Object? courierCompanyList = null,Object? invoice = freezed,Object? isTrackingValidated = null,Object? trackingValidationMessage = null,Object? hanjinServiceCategory = freezed,Object? hanjinBoxType = freezed,Object? hanjinPayType = freezed,}) {
  return _then(_ClaimDetailState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,imageCurrentIndex: null == imageCurrentIndex ? _self.imageCurrentIndex : imageCurrentIndex // ignore: cast_nullable_to_non_nullable
as int,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as ClaimDetailModel?,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>,selectedReason: freezed == selectedReason ? _self.selectedReason : selectedReason // ignore: cast_nullable_to_non_nullable
as ReasonType?,etcText: null == etcText ? _self.etcText : etcText // ignore: cast_nullable_to_non_nullable
as String,selectApprove: freezed == selectApprove ? _self.selectApprove : selectApprove // ignore: cast_nullable_to_non_nullable
as ApproveType?,deliveryMethod: freezed == deliveryMethod ? _self.deliveryMethod : deliveryMethod // ignore: cast_nullable_to_non_nullable
as DeliveryMethod?,deliveryMethodList: freezed == deliveryMethodList ? _self._deliveryMethodList : deliveryMethodList // ignore: cast_nullable_to_non_nullable
as List<DeliveryMethod>?,availableDeliveryTabs: null == availableDeliveryTabs ? _self._availableDeliveryTabs : availableDeliveryTabs // ignore: cast_nullable_to_non_nullable
as List<DeliveryExecuteTab>,selectedDeliveryTab: null == selectedDeliveryTab ? _self.selectedDeliveryTab : selectedDeliveryTab // ignore: cast_nullable_to_non_nullable
as DeliveryExecuteTab,courierCompany: freezed == courierCompany ? _self.courierCompany : courierCompany // ignore: cast_nullable_to_non_nullable
as CarrierModel?,courierCompanyList: null == courierCompanyList ? _self._courierCompanyList : courierCompanyList // ignore: cast_nullable_to_non_nullable
as List<CarrierModel>,invoice: freezed == invoice ? _self.invoice : invoice // ignore: cast_nullable_to_non_nullable
as String?,isTrackingValidated: null == isTrackingValidated ? _self.isTrackingValidated : isTrackingValidated // ignore: cast_nullable_to_non_nullable
as bool,trackingValidationMessage: null == trackingValidationMessage ? _self.trackingValidationMessage : trackingValidationMessage // ignore: cast_nullable_to_non_nullable
as String,hanjinServiceCategory: freezed == hanjinServiceCategory ? _self.hanjinServiceCategory : hanjinServiceCategory // ignore: cast_nullable_to_non_nullable
as HanjinServiceCategory?,hanjinBoxType: freezed == hanjinBoxType ? _self.hanjinBoxType : hanjinBoxType // ignore: cast_nullable_to_non_nullable
as HanjinBoxType?,hanjinPayType: freezed == hanjinPayType ? _self.hanjinPayType : hanjinPayType // ignore: cast_nullable_to_non_nullable
as HanjinPayType?,
  ));
}

/// Create a copy of ClaimDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClaimDetailModelCopyWith<$Res>? get model {
    if (_self.model == null) {
    return null;
  }

  return $ClaimDetailModelCopyWith<$Res>(_self.model!, (value) {
    return _then(_self.copyWith(model: value));
  });
}/// Create a copy of ClaimDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CarrierModelCopyWith<$Res>? get courierCompany {
    if (_self.courierCompany == null) {
    return null;
  }

  return $CarrierModelCopyWith<$Res>(_self.courierCompany!, (value) {
    return _then(_self.copyWith(courierCompany: value));
  });
}
}

// dart format on
