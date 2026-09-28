// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fund_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FundModel {

 String get id; String get name; String get category; String get riskLevel; double get returns3Y; double get minSip; double get nav; double get expenseRatio; double get fundSize; String get shortCode; String get planType; double get rating; List<HoldingModel> get holdings;
/// Create a copy of FundModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FundModelCopyWith<FundModel> get copyWith => _$FundModelCopyWithImpl<FundModel>(this as FundModel, _$identity);

  /// Serializes this FundModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FundModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.riskLevel, riskLevel) || other.riskLevel == riskLevel)&&(identical(other.returns3Y, returns3Y) || other.returns3Y == returns3Y)&&(identical(other.minSip, minSip) || other.minSip == minSip)&&(identical(other.nav, nav) || other.nav == nav)&&(identical(other.expenseRatio, expenseRatio) || other.expenseRatio == expenseRatio)&&(identical(other.fundSize, fundSize) || other.fundSize == fundSize)&&(identical(other.shortCode, shortCode) || other.shortCode == shortCode)&&(identical(other.planType, planType) || other.planType == planType)&&(identical(other.rating, rating) || other.rating == rating)&&const DeepCollectionEquality().equals(other.holdings, holdings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,category,riskLevel,returns3Y,minSip,nav,expenseRatio,fundSize,shortCode,planType,rating,const DeepCollectionEquality().hash(holdings));

@override
String toString() {
  return 'FundModel(id: $id, name: $name, category: $category, riskLevel: $riskLevel, returns3Y: $returns3Y, minSip: $minSip, nav: $nav, expenseRatio: $expenseRatio, fundSize: $fundSize, shortCode: $shortCode, planType: $planType, rating: $rating, holdings: $holdings)';
}


}

/// @nodoc
abstract mixin class $FundModelCopyWith<$Res>  {
  factory $FundModelCopyWith(FundModel value, $Res Function(FundModel) _then) = _$FundModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String category, String riskLevel, double returns3Y, double minSip, double nav, double expenseRatio, double fundSize, String shortCode, String planType, double rating, List<HoldingModel> holdings
});




}
/// @nodoc
class _$FundModelCopyWithImpl<$Res>
    implements $FundModelCopyWith<$Res> {
  _$FundModelCopyWithImpl(this._self, this._then);

  final FundModel _self;
  final $Res Function(FundModel) _then;

/// Create a copy of FundModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? category = null,Object? riskLevel = null,Object? returns3Y = null,Object? minSip = null,Object? nav = null,Object? expenseRatio = null,Object? fundSize = null,Object? shortCode = null,Object? planType = null,Object? rating = null,Object? holdings = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,riskLevel: null == riskLevel ? _self.riskLevel : riskLevel // ignore: cast_nullable_to_non_nullable
as String,returns3Y: null == returns3Y ? _self.returns3Y : returns3Y // ignore: cast_nullable_to_non_nullable
as double,minSip: null == minSip ? _self.minSip : minSip // ignore: cast_nullable_to_non_nullable
as double,nav: null == nav ? _self.nav : nav // ignore: cast_nullable_to_non_nullable
as double,expenseRatio: null == expenseRatio ? _self.expenseRatio : expenseRatio // ignore: cast_nullable_to_non_nullable
as double,fundSize: null == fundSize ? _self.fundSize : fundSize // ignore: cast_nullable_to_non_nullable
as double,shortCode: null == shortCode ? _self.shortCode : shortCode // ignore: cast_nullable_to_non_nullable
as String,planType: null == planType ? _self.planType : planType // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,holdings: null == holdings ? _self.holdings : holdings // ignore: cast_nullable_to_non_nullable
as List<HoldingModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [FundModel].
extension FundModelPatterns on FundModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FundModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FundModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FundModel value)  $default,){
final _that = this;
switch (_that) {
case _FundModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FundModel value)?  $default,){
final _that = this;
switch (_that) {
case _FundModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String category,  String riskLevel,  double returns3Y,  double minSip,  double nav,  double expenseRatio,  double fundSize,  String shortCode,  String planType,  double rating,  List<HoldingModel> holdings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FundModel() when $default != null:
return $default(_that.id,_that.name,_that.category,_that.riskLevel,_that.returns3Y,_that.minSip,_that.nav,_that.expenseRatio,_that.fundSize,_that.shortCode,_that.planType,_that.rating,_that.holdings);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String category,  String riskLevel,  double returns3Y,  double minSip,  double nav,  double expenseRatio,  double fundSize,  String shortCode,  String planType,  double rating,  List<HoldingModel> holdings)  $default,) {final _that = this;
switch (_that) {
case _FundModel():
return $default(_that.id,_that.name,_that.category,_that.riskLevel,_that.returns3Y,_that.minSip,_that.nav,_that.expenseRatio,_that.fundSize,_that.shortCode,_that.planType,_that.rating,_that.holdings);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String category,  String riskLevel,  double returns3Y,  double minSip,  double nav,  double expenseRatio,  double fundSize,  String shortCode,  String planType,  double rating,  List<HoldingModel> holdings)?  $default,) {final _that = this;
switch (_that) {
case _FundModel() when $default != null:
return $default(_that.id,_that.name,_that.category,_that.riskLevel,_that.returns3Y,_that.minSip,_that.nav,_that.expenseRatio,_that.fundSize,_that.shortCode,_that.planType,_that.rating,_that.holdings);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FundModel implements FundModel {
  const _FundModel({required this.id, required this.name, required this.category, required this.riskLevel, required this.returns3Y, required this.minSip, required this.nav, required this.expenseRatio, required this.fundSize, this.shortCode = '', this.planType = 'Direct · Growth', this.rating = 4.5, final  List<HoldingModel> holdings = const []}): _holdings = holdings;
  factory _FundModel.fromJson(Map<String, dynamic> json) => _$FundModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String category;
@override final  String riskLevel;
@override final  double returns3Y;
@override final  double minSip;
@override final  double nav;
@override final  double expenseRatio;
@override final  double fundSize;
@override@JsonKey() final  String shortCode;
@override@JsonKey() final  String planType;
@override@JsonKey() final  double rating;
 final  List<HoldingModel> _holdings;
@override@JsonKey() List<HoldingModel> get holdings {
  if (_holdings is EqualUnmodifiableListView) return _holdings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_holdings);
}


/// Create a copy of FundModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FundModelCopyWith<_FundModel> get copyWith => __$FundModelCopyWithImpl<_FundModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FundModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FundModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.riskLevel, riskLevel) || other.riskLevel == riskLevel)&&(identical(other.returns3Y, returns3Y) || other.returns3Y == returns3Y)&&(identical(other.minSip, minSip) || other.minSip == minSip)&&(identical(other.nav, nav) || other.nav == nav)&&(identical(other.expenseRatio, expenseRatio) || other.expenseRatio == expenseRatio)&&(identical(other.fundSize, fundSize) || other.fundSize == fundSize)&&(identical(other.shortCode, shortCode) || other.shortCode == shortCode)&&(identical(other.planType, planType) || other.planType == planType)&&(identical(other.rating, rating) || other.rating == rating)&&const DeepCollectionEquality().equals(other._holdings, _holdings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,category,riskLevel,returns3Y,minSip,nav,expenseRatio,fundSize,shortCode,planType,rating,const DeepCollectionEquality().hash(_holdings));

@override
String toString() {
  return 'FundModel(id: $id, name: $name, category: $category, riskLevel: $riskLevel, returns3Y: $returns3Y, minSip: $minSip, nav: $nav, expenseRatio: $expenseRatio, fundSize: $fundSize, shortCode: $shortCode, planType: $planType, rating: $rating, holdings: $holdings)';
}


}

/// @nodoc
abstract mixin class _$FundModelCopyWith<$Res> implements $FundModelCopyWith<$Res> {
  factory _$FundModelCopyWith(_FundModel value, $Res Function(_FundModel) _then) = __$FundModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String category, String riskLevel, double returns3Y, double minSip, double nav, double expenseRatio, double fundSize, String shortCode, String planType, double rating, List<HoldingModel> holdings
});




}
/// @nodoc
class __$FundModelCopyWithImpl<$Res>
    implements _$FundModelCopyWith<$Res> {
  __$FundModelCopyWithImpl(this._self, this._then);

  final _FundModel _self;
  final $Res Function(_FundModel) _then;

/// Create a copy of FundModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? category = null,Object? riskLevel = null,Object? returns3Y = null,Object? minSip = null,Object? nav = null,Object? expenseRatio = null,Object? fundSize = null,Object? shortCode = null,Object? planType = null,Object? rating = null,Object? holdings = null,}) {
  return _then(_FundModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,riskLevel: null == riskLevel ? _self.riskLevel : riskLevel // ignore: cast_nullable_to_non_nullable
as String,returns3Y: null == returns3Y ? _self.returns3Y : returns3Y // ignore: cast_nullable_to_non_nullable
as double,minSip: null == minSip ? _self.minSip : minSip // ignore: cast_nullable_to_non_nullable
as double,nav: null == nav ? _self.nav : nav // ignore: cast_nullable_to_non_nullable
as double,expenseRatio: null == expenseRatio ? _self.expenseRatio : expenseRatio // ignore: cast_nullable_to_non_nullable
as double,fundSize: null == fundSize ? _self.fundSize : fundSize // ignore: cast_nullable_to_non_nullable
as double,shortCode: null == shortCode ? _self.shortCode : shortCode // ignore: cast_nullable_to_non_nullable
as String,planType: null == planType ? _self.planType : planType // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,holdings: null == holdings ? _self._holdings : holdings // ignore: cast_nullable_to_non_nullable
as List<HoldingModel>,
  ));
}


}


/// @nodoc
mixin _$HoldingModel {

 String get name; double get percentage;
/// Create a copy of HoldingModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HoldingModelCopyWith<HoldingModel> get copyWith => _$HoldingModelCopyWithImpl<HoldingModel>(this as HoldingModel, _$identity);

  /// Serializes this HoldingModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HoldingModel&&(identical(other.name, name) || other.name == name)&&(identical(other.percentage, percentage) || other.percentage == percentage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,percentage);

@override
String toString() {
  return 'HoldingModel(name: $name, percentage: $percentage)';
}


}

/// @nodoc
abstract mixin class $HoldingModelCopyWith<$Res>  {
  factory $HoldingModelCopyWith(HoldingModel value, $Res Function(HoldingModel) _then) = _$HoldingModelCopyWithImpl;
@useResult
$Res call({
 String name, double percentage
});




}
/// @nodoc
class _$HoldingModelCopyWithImpl<$Res>
    implements $HoldingModelCopyWith<$Res> {
  _$HoldingModelCopyWithImpl(this._self, this._then);

  final HoldingModel _self;
  final $Res Function(HoldingModel) _then;

/// Create a copy of HoldingModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? percentage = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,percentage: null == percentage ? _self.percentage : percentage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [HoldingModel].
extension HoldingModelPatterns on HoldingModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HoldingModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HoldingModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HoldingModel value)  $default,){
final _that = this;
switch (_that) {
case _HoldingModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HoldingModel value)?  $default,){
final _that = this;
switch (_that) {
case _HoldingModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  double percentage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HoldingModel() when $default != null:
return $default(_that.name,_that.percentage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  double percentage)  $default,) {final _that = this;
switch (_that) {
case _HoldingModel():
return $default(_that.name,_that.percentage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  double percentage)?  $default,) {final _that = this;
switch (_that) {
case _HoldingModel() when $default != null:
return $default(_that.name,_that.percentage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HoldingModel implements HoldingModel {
  const _HoldingModel({required this.name, required this.percentage});
  factory _HoldingModel.fromJson(Map<String, dynamic> json) => _$HoldingModelFromJson(json);

@override final  String name;
@override final  double percentage;

/// Create a copy of HoldingModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HoldingModelCopyWith<_HoldingModel> get copyWith => __$HoldingModelCopyWithImpl<_HoldingModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HoldingModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HoldingModel&&(identical(other.name, name) || other.name == name)&&(identical(other.percentage, percentage) || other.percentage == percentage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,percentage);

@override
String toString() {
  return 'HoldingModel(name: $name, percentage: $percentage)';
}


}

/// @nodoc
abstract mixin class _$HoldingModelCopyWith<$Res> implements $HoldingModelCopyWith<$Res> {
  factory _$HoldingModelCopyWith(_HoldingModel value, $Res Function(_HoldingModel) _then) = __$HoldingModelCopyWithImpl;
@override @useResult
$Res call({
 String name, double percentage
});




}
/// @nodoc
class __$HoldingModelCopyWithImpl<$Res>
    implements _$HoldingModelCopyWith<$Res> {
  __$HoldingModelCopyWithImpl(this._self, this._then);

  final _HoldingModel _self;
  final $Res Function(_HoldingModel) _then;

/// Create a copy of HoldingModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? percentage = null,}) {
  return _then(_HoldingModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,percentage: null == percentage ? _self.percentage : percentage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
