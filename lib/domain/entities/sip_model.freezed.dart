// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sip_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SipModel {

 String get fundId; String get fundName; double get amount; int get debitDay; String get paymentMethod; double get projectedValue;
/// Create a copy of SipModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SipModelCopyWith<SipModel> get copyWith => _$SipModelCopyWithImpl<SipModel>(this as SipModel, _$identity);

  /// Serializes this SipModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SipModel&&(identical(other.fundId, fundId) || other.fundId == fundId)&&(identical(other.fundName, fundName) || other.fundName == fundName)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.debitDay, debitDay) || other.debitDay == debitDay)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.projectedValue, projectedValue) || other.projectedValue == projectedValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fundId,fundName,amount,debitDay,paymentMethod,projectedValue);

@override
String toString() {
  return 'SipModel(fundId: $fundId, fundName: $fundName, amount: $amount, debitDay: $debitDay, paymentMethod: $paymentMethod, projectedValue: $projectedValue)';
}


}

/// @nodoc
abstract mixin class $SipModelCopyWith<$Res>  {
  factory $SipModelCopyWith(SipModel value, $Res Function(SipModel) _then) = _$SipModelCopyWithImpl;
@useResult
$Res call({
 String fundId, String fundName, double amount, int debitDay, String paymentMethod, double projectedValue
});




}
/// @nodoc
class _$SipModelCopyWithImpl<$Res>
    implements $SipModelCopyWith<$Res> {
  _$SipModelCopyWithImpl(this._self, this._then);

  final SipModel _self;
  final $Res Function(SipModel) _then;

/// Create a copy of SipModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fundId = null,Object? fundName = null,Object? amount = null,Object? debitDay = null,Object? paymentMethod = null,Object? projectedValue = null,}) {
  return _then(_self.copyWith(
fundId: null == fundId ? _self.fundId : fundId // ignore: cast_nullable_to_non_nullable
as String,fundName: null == fundName ? _self.fundName : fundName // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,debitDay: null == debitDay ? _self.debitDay : debitDay // ignore: cast_nullable_to_non_nullable
as int,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,projectedValue: null == projectedValue ? _self.projectedValue : projectedValue // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [SipModel].
extension SipModelPatterns on SipModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SipModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SipModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SipModel value)  $default,){
final _that = this;
switch (_that) {
case _SipModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SipModel value)?  $default,){
final _that = this;
switch (_that) {
case _SipModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fundId,  String fundName,  double amount,  int debitDay,  String paymentMethod,  double projectedValue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SipModel() when $default != null:
return $default(_that.fundId,_that.fundName,_that.amount,_that.debitDay,_that.paymentMethod,_that.projectedValue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fundId,  String fundName,  double amount,  int debitDay,  String paymentMethod,  double projectedValue)  $default,) {final _that = this;
switch (_that) {
case _SipModel():
return $default(_that.fundId,_that.fundName,_that.amount,_that.debitDay,_that.paymentMethod,_that.projectedValue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fundId,  String fundName,  double amount,  int debitDay,  String paymentMethod,  double projectedValue)?  $default,) {final _that = this;
switch (_that) {
case _SipModel() when $default != null:
return $default(_that.fundId,_that.fundName,_that.amount,_that.debitDay,_that.paymentMethod,_that.projectedValue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SipModel implements SipModel {
  const _SipModel({required this.fundId, required this.fundName, required this.amount, required this.debitDay, required this.paymentMethod, required this.projectedValue});
  factory _SipModel.fromJson(Map<String, dynamic> json) => _$SipModelFromJson(json);

@override final  String fundId;
@override final  String fundName;
@override final  double amount;
@override final  int debitDay;
@override final  String paymentMethod;
@override final  double projectedValue;

/// Create a copy of SipModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SipModelCopyWith<_SipModel> get copyWith => __$SipModelCopyWithImpl<_SipModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SipModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SipModel&&(identical(other.fundId, fundId) || other.fundId == fundId)&&(identical(other.fundName, fundName) || other.fundName == fundName)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.debitDay, debitDay) || other.debitDay == debitDay)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.projectedValue, projectedValue) || other.projectedValue == projectedValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fundId,fundName,amount,debitDay,paymentMethod,projectedValue);

@override
String toString() {
  return 'SipModel(fundId: $fundId, fundName: $fundName, amount: $amount, debitDay: $debitDay, paymentMethod: $paymentMethod, projectedValue: $projectedValue)';
}


}

/// @nodoc
abstract mixin class _$SipModelCopyWith<$Res> implements $SipModelCopyWith<$Res> {
  factory _$SipModelCopyWith(_SipModel value, $Res Function(_SipModel) _then) = __$SipModelCopyWithImpl;
@override @useResult
$Res call({
 String fundId, String fundName, double amount, int debitDay, String paymentMethod, double projectedValue
});




}
/// @nodoc
class __$SipModelCopyWithImpl<$Res>
    implements _$SipModelCopyWith<$Res> {
  __$SipModelCopyWithImpl(this._self, this._then);

  final _SipModel _self;
  final $Res Function(_SipModel) _then;

/// Create a copy of SipModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fundId = null,Object? fundName = null,Object? amount = null,Object? debitDay = null,Object? paymentMethod = null,Object? projectedValue = null,}) {
  return _then(_SipModel(
fundId: null == fundId ? _self.fundId : fundId // ignore: cast_nullable_to_non_nullable
as String,fundName: null == fundName ? _self.fundName : fundName // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,debitDay: null == debitDay ? _self.debitDay : debitDay // ignore: cast_nullable_to_non_nullable
as int,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,projectedValue: null == projectedValue ? _self.projectedValue : projectedValue // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$SipConfirmation {

 String get folioNumber; DateTime get nextDebitDate; double get amount; String get fundName;
/// Create a copy of SipConfirmation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SipConfirmationCopyWith<SipConfirmation> get copyWith => _$SipConfirmationCopyWithImpl<SipConfirmation>(this as SipConfirmation, _$identity);

  /// Serializes this SipConfirmation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SipConfirmation&&(identical(other.folioNumber, folioNumber) || other.folioNumber == folioNumber)&&(identical(other.nextDebitDate, nextDebitDate) || other.nextDebitDate == nextDebitDate)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.fundName, fundName) || other.fundName == fundName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,folioNumber,nextDebitDate,amount,fundName);

@override
String toString() {
  return 'SipConfirmation(folioNumber: $folioNumber, nextDebitDate: $nextDebitDate, amount: $amount, fundName: $fundName)';
}


}

/// @nodoc
abstract mixin class $SipConfirmationCopyWith<$Res>  {
  factory $SipConfirmationCopyWith(SipConfirmation value, $Res Function(SipConfirmation) _then) = _$SipConfirmationCopyWithImpl;
@useResult
$Res call({
 String folioNumber, DateTime nextDebitDate, double amount, String fundName
});




}
/// @nodoc
class _$SipConfirmationCopyWithImpl<$Res>
    implements $SipConfirmationCopyWith<$Res> {
  _$SipConfirmationCopyWithImpl(this._self, this._then);

  final SipConfirmation _self;
  final $Res Function(SipConfirmation) _then;

/// Create a copy of SipConfirmation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? folioNumber = null,Object? nextDebitDate = null,Object? amount = null,Object? fundName = null,}) {
  return _then(_self.copyWith(
folioNumber: null == folioNumber ? _self.folioNumber : folioNumber // ignore: cast_nullable_to_non_nullable
as String,nextDebitDate: null == nextDebitDate ? _self.nextDebitDate : nextDebitDate // ignore: cast_nullable_to_non_nullable
as DateTime,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,fundName: null == fundName ? _self.fundName : fundName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SipConfirmation].
extension SipConfirmationPatterns on SipConfirmation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SipConfirmation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SipConfirmation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SipConfirmation value)  $default,){
final _that = this;
switch (_that) {
case _SipConfirmation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SipConfirmation value)?  $default,){
final _that = this;
switch (_that) {
case _SipConfirmation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String folioNumber,  DateTime nextDebitDate,  double amount,  String fundName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SipConfirmation() when $default != null:
return $default(_that.folioNumber,_that.nextDebitDate,_that.amount,_that.fundName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String folioNumber,  DateTime nextDebitDate,  double amount,  String fundName)  $default,) {final _that = this;
switch (_that) {
case _SipConfirmation():
return $default(_that.folioNumber,_that.nextDebitDate,_that.amount,_that.fundName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String folioNumber,  DateTime nextDebitDate,  double amount,  String fundName)?  $default,) {final _that = this;
switch (_that) {
case _SipConfirmation() when $default != null:
return $default(_that.folioNumber,_that.nextDebitDate,_that.amount,_that.fundName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SipConfirmation implements SipConfirmation {
  const _SipConfirmation({required this.folioNumber, required this.nextDebitDate, required this.amount, required this.fundName});
  factory _SipConfirmation.fromJson(Map<String, dynamic> json) => _$SipConfirmationFromJson(json);

@override final  String folioNumber;
@override final  DateTime nextDebitDate;
@override final  double amount;
@override final  String fundName;

/// Create a copy of SipConfirmation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SipConfirmationCopyWith<_SipConfirmation> get copyWith => __$SipConfirmationCopyWithImpl<_SipConfirmation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SipConfirmationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SipConfirmation&&(identical(other.folioNumber, folioNumber) || other.folioNumber == folioNumber)&&(identical(other.nextDebitDate, nextDebitDate) || other.nextDebitDate == nextDebitDate)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.fundName, fundName) || other.fundName == fundName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,folioNumber,nextDebitDate,amount,fundName);

@override
String toString() {
  return 'SipConfirmation(folioNumber: $folioNumber, nextDebitDate: $nextDebitDate, amount: $amount, fundName: $fundName)';
}


}

/// @nodoc
abstract mixin class _$SipConfirmationCopyWith<$Res> implements $SipConfirmationCopyWith<$Res> {
  factory _$SipConfirmationCopyWith(_SipConfirmation value, $Res Function(_SipConfirmation) _then) = __$SipConfirmationCopyWithImpl;
@override @useResult
$Res call({
 String folioNumber, DateTime nextDebitDate, double amount, String fundName
});




}
/// @nodoc
class __$SipConfirmationCopyWithImpl<$Res>
    implements _$SipConfirmationCopyWith<$Res> {
  __$SipConfirmationCopyWithImpl(this._self, this._then);

  final _SipConfirmation _self;
  final $Res Function(_SipConfirmation) _then;

/// Create a copy of SipConfirmation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? folioNumber = null,Object? nextDebitDate = null,Object? amount = null,Object? fundName = null,}) {
  return _then(_SipConfirmation(
folioNumber: null == folioNumber ? _self.folioNumber : folioNumber // ignore: cast_nullable_to_non_nullable
as String,nextDebitDate: null == nextDebitDate ? _self.nextDebitDate : nextDebitDate // ignore: cast_nullable_to_non_nullable
as DateTime,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,fundName: null == fundName ? _self.fundName : fundName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
