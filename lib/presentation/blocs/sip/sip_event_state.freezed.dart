// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sip_event_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SipEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SipEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SipEvent()';
}


}

/// @nodoc
class $SipEventCopyWith<$Res>  {
$SipEventCopyWith(SipEvent _, $Res Function(SipEvent) __);
}


/// Adds pattern-matching-related methods to [SipEvent].
extension SipEventPatterns on SipEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InitSip value)?  init,TResult Function( AmountChanged value)?  amountChanged,TResult Function( DebitDayChanged value)?  debitDayChanged,TResult Function( PaymentMethodChanged value)?  paymentMethodChanged,TResult Function( LoadPaymentMethods value)?  loadPaymentMethods,TResult Function( SubmitSip value)?  submit,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InitSip() when init != null:
return init(_that);case AmountChanged() when amountChanged != null:
return amountChanged(_that);case DebitDayChanged() when debitDayChanged != null:
return debitDayChanged(_that);case PaymentMethodChanged() when paymentMethodChanged != null:
return paymentMethodChanged(_that);case LoadPaymentMethods() when loadPaymentMethods != null:
return loadPaymentMethods(_that);case SubmitSip() when submit != null:
return submit(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InitSip value)  init,required TResult Function( AmountChanged value)  amountChanged,required TResult Function( DebitDayChanged value)  debitDayChanged,required TResult Function( PaymentMethodChanged value)  paymentMethodChanged,required TResult Function( LoadPaymentMethods value)  loadPaymentMethods,required TResult Function( SubmitSip value)  submit,}){
final _that = this;
switch (_that) {
case InitSip():
return init(_that);case AmountChanged():
return amountChanged(_that);case DebitDayChanged():
return debitDayChanged(_that);case PaymentMethodChanged():
return paymentMethodChanged(_that);case LoadPaymentMethods():
return loadPaymentMethods(_that);case SubmitSip():
return submit(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InitSip value)?  init,TResult? Function( AmountChanged value)?  amountChanged,TResult? Function( DebitDayChanged value)?  debitDayChanged,TResult? Function( PaymentMethodChanged value)?  paymentMethodChanged,TResult? Function( LoadPaymentMethods value)?  loadPaymentMethods,TResult? Function( SubmitSip value)?  submit,}){
final _that = this;
switch (_that) {
case InitSip() when init != null:
return init(_that);case AmountChanged() when amountChanged != null:
return amountChanged(_that);case DebitDayChanged() when debitDayChanged != null:
return debitDayChanged(_that);case PaymentMethodChanged() when paymentMethodChanged != null:
return paymentMethodChanged(_that);case LoadPaymentMethods() when loadPaymentMethods != null:
return loadPaymentMethods(_that);case SubmitSip() when submit != null:
return submit(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String fundId)?  init,TResult Function( double amount)?  amountChanged,TResult Function( int day)?  debitDayChanged,TResult Function( String method)?  paymentMethodChanged,TResult Function()?  loadPaymentMethods,TResult Function()?  submit,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InitSip() when init != null:
return init(_that.fundId);case AmountChanged() when amountChanged != null:
return amountChanged(_that.amount);case DebitDayChanged() when debitDayChanged != null:
return debitDayChanged(_that.day);case PaymentMethodChanged() when paymentMethodChanged != null:
return paymentMethodChanged(_that.method);case LoadPaymentMethods() when loadPaymentMethods != null:
return loadPaymentMethods();case SubmitSip() when submit != null:
return submit();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String fundId)  init,required TResult Function( double amount)  amountChanged,required TResult Function( int day)  debitDayChanged,required TResult Function( String method)  paymentMethodChanged,required TResult Function()  loadPaymentMethods,required TResult Function()  submit,}) {final _that = this;
switch (_that) {
case InitSip():
return init(_that.fundId);case AmountChanged():
return amountChanged(_that.amount);case DebitDayChanged():
return debitDayChanged(_that.day);case PaymentMethodChanged():
return paymentMethodChanged(_that.method);case LoadPaymentMethods():
return loadPaymentMethods();case SubmitSip():
return submit();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String fundId)?  init,TResult? Function( double amount)?  amountChanged,TResult? Function( int day)?  debitDayChanged,TResult? Function( String method)?  paymentMethodChanged,TResult? Function()?  loadPaymentMethods,TResult? Function()?  submit,}) {final _that = this;
switch (_that) {
case InitSip() when init != null:
return init(_that.fundId);case AmountChanged() when amountChanged != null:
return amountChanged(_that.amount);case DebitDayChanged() when debitDayChanged != null:
return debitDayChanged(_that.day);case PaymentMethodChanged() when paymentMethodChanged != null:
return paymentMethodChanged(_that.method);case LoadPaymentMethods() when loadPaymentMethods != null:
return loadPaymentMethods();case SubmitSip() when submit != null:
return submit();case _:
  return null;

}
}

}

/// @nodoc


class InitSip implements SipEvent {
  const InitSip(this.fundId);
  

 final  String fundId;

/// Create a copy of SipEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InitSipCopyWith<InitSip> get copyWith => _$InitSipCopyWithImpl<InitSip>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitSip&&(identical(other.fundId, fundId) || other.fundId == fundId));
}


@override
int get hashCode => Object.hash(runtimeType,fundId);

@override
String toString() {
  return 'SipEvent.init(fundId: $fundId)';
}


}

/// @nodoc
abstract mixin class $InitSipCopyWith<$Res> implements $SipEventCopyWith<$Res> {
  factory $InitSipCopyWith(InitSip value, $Res Function(InitSip) _then) = _$InitSipCopyWithImpl;
@useResult
$Res call({
 String fundId
});




}
/// @nodoc
class _$InitSipCopyWithImpl<$Res>
    implements $InitSipCopyWith<$Res> {
  _$InitSipCopyWithImpl(this._self, this._then);

  final InitSip _self;
  final $Res Function(InitSip) _then;

/// Create a copy of SipEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? fundId = null,}) {
  return _then(InitSip(
null == fundId ? _self.fundId : fundId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AmountChanged implements SipEvent {
  const AmountChanged(this.amount);
  

 final  double amount;

/// Create a copy of SipEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AmountChangedCopyWith<AmountChanged> get copyWith => _$AmountChangedCopyWithImpl<AmountChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AmountChanged&&(identical(other.amount, amount) || other.amount == amount));
}


@override
int get hashCode => Object.hash(runtimeType,amount);

@override
String toString() {
  return 'SipEvent.amountChanged(amount: $amount)';
}


}

/// @nodoc
abstract mixin class $AmountChangedCopyWith<$Res> implements $SipEventCopyWith<$Res> {
  factory $AmountChangedCopyWith(AmountChanged value, $Res Function(AmountChanged) _then) = _$AmountChangedCopyWithImpl;
@useResult
$Res call({
 double amount
});




}
/// @nodoc
class _$AmountChangedCopyWithImpl<$Res>
    implements $AmountChangedCopyWith<$Res> {
  _$AmountChangedCopyWithImpl(this._self, this._then);

  final AmountChanged _self;
  final $Res Function(AmountChanged) _then;

/// Create a copy of SipEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? amount = null,}) {
  return _then(AmountChanged(
null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class DebitDayChanged implements SipEvent {
  const DebitDayChanged(this.day);
  

 final  int day;

/// Create a copy of SipEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DebitDayChangedCopyWith<DebitDayChanged> get copyWith => _$DebitDayChangedCopyWithImpl<DebitDayChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DebitDayChanged&&(identical(other.day, day) || other.day == day));
}


@override
int get hashCode => Object.hash(runtimeType,day);

@override
String toString() {
  return 'SipEvent.debitDayChanged(day: $day)';
}


}

/// @nodoc
abstract mixin class $DebitDayChangedCopyWith<$Res> implements $SipEventCopyWith<$Res> {
  factory $DebitDayChangedCopyWith(DebitDayChanged value, $Res Function(DebitDayChanged) _then) = _$DebitDayChangedCopyWithImpl;
@useResult
$Res call({
 int day
});




}
/// @nodoc
class _$DebitDayChangedCopyWithImpl<$Res>
    implements $DebitDayChangedCopyWith<$Res> {
  _$DebitDayChangedCopyWithImpl(this._self, this._then);

  final DebitDayChanged _self;
  final $Res Function(DebitDayChanged) _then;

/// Create a copy of SipEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? day = null,}) {
  return _then(DebitDayChanged(
null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class PaymentMethodChanged implements SipEvent {
  const PaymentMethodChanged(this.method);
  

 final  String method;

/// Create a copy of SipEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentMethodChangedCopyWith<PaymentMethodChanged> get copyWith => _$PaymentMethodChangedCopyWithImpl<PaymentMethodChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentMethodChanged&&(identical(other.method, method) || other.method == method));
}


@override
int get hashCode => Object.hash(runtimeType,method);

@override
String toString() {
  return 'SipEvent.paymentMethodChanged(method: $method)';
}


}

/// @nodoc
abstract mixin class $PaymentMethodChangedCopyWith<$Res> implements $SipEventCopyWith<$Res> {
  factory $PaymentMethodChangedCopyWith(PaymentMethodChanged value, $Res Function(PaymentMethodChanged) _then) = _$PaymentMethodChangedCopyWithImpl;
@useResult
$Res call({
 String method
});




}
/// @nodoc
class _$PaymentMethodChangedCopyWithImpl<$Res>
    implements $PaymentMethodChangedCopyWith<$Res> {
  _$PaymentMethodChangedCopyWithImpl(this._self, this._then);

  final PaymentMethodChanged _self;
  final $Res Function(PaymentMethodChanged) _then;

/// Create a copy of SipEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? method = null,}) {
  return _then(PaymentMethodChanged(
null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LoadPaymentMethods implements SipEvent {
  const LoadPaymentMethods();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadPaymentMethods);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SipEvent.loadPaymentMethods()';
}


}




/// @nodoc


class SubmitSip implements SipEvent {
  const SubmitSip();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmitSip);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SipEvent.submit()';
}


}




/// @nodoc
mixin _$SipState {

 bool get isLoading; bool get isSubmitting; FundModel? get fund; double get amount; int get debitDay; String get paymentMethod; List<String> get paymentMethods; SipConfirmation? get confirmation; String? get error;
/// Create a copy of SipState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SipStateCopyWith<SipState> get copyWith => _$SipStateCopyWithImpl<SipState>(this as SipState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SipState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.fund, fund) || other.fund == fund)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.debitDay, debitDay) || other.debitDay == debitDay)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&const DeepCollectionEquality().equals(other.paymentMethods, paymentMethods)&&(identical(other.confirmation, confirmation) || other.confirmation == confirmation)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isSubmitting,fund,amount,debitDay,paymentMethod,const DeepCollectionEquality().hash(paymentMethods),confirmation,error);

@override
String toString() {
  return 'SipState(isLoading: $isLoading, isSubmitting: $isSubmitting, fund: $fund, amount: $amount, debitDay: $debitDay, paymentMethod: $paymentMethod, paymentMethods: $paymentMethods, confirmation: $confirmation, error: $error)';
}


}

/// @nodoc
abstract mixin class $SipStateCopyWith<$Res>  {
  factory $SipStateCopyWith(SipState value, $Res Function(SipState) _then) = _$SipStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isSubmitting, FundModel? fund, double amount, int debitDay, String paymentMethod, List<String> paymentMethods, SipConfirmation? confirmation, String? error
});


$FundModelCopyWith<$Res>? get fund;$SipConfirmationCopyWith<$Res>? get confirmation;

}
/// @nodoc
class _$SipStateCopyWithImpl<$Res>
    implements $SipStateCopyWith<$Res> {
  _$SipStateCopyWithImpl(this._self, this._then);

  final SipState _self;
  final $Res Function(SipState) _then;

/// Create a copy of SipState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isSubmitting = null,Object? fund = freezed,Object? amount = null,Object? debitDay = null,Object? paymentMethod = null,Object? paymentMethods = null,Object? confirmation = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,fund: freezed == fund ? _self.fund : fund // ignore: cast_nullable_to_non_nullable
as FundModel?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,debitDay: null == debitDay ? _self.debitDay : debitDay // ignore: cast_nullable_to_non_nullable
as int,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,paymentMethods: null == paymentMethods ? _self.paymentMethods : paymentMethods // ignore: cast_nullable_to_non_nullable
as List<String>,confirmation: freezed == confirmation ? _self.confirmation : confirmation // ignore: cast_nullable_to_non_nullable
as SipConfirmation?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of SipState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FundModelCopyWith<$Res>? get fund {
    if (_self.fund == null) {
    return null;
  }

  return $FundModelCopyWith<$Res>(_self.fund!, (value) {
    return _then(_self.copyWith(fund: value));
  });
}/// Create a copy of SipState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SipConfirmationCopyWith<$Res>? get confirmation {
    if (_self.confirmation == null) {
    return null;
  }

  return $SipConfirmationCopyWith<$Res>(_self.confirmation!, (value) {
    return _then(_self.copyWith(confirmation: value));
  });
}
}


/// Adds pattern-matching-related methods to [SipState].
extension SipStatePatterns on SipState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SipState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SipState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SipState value)  $default,){
final _that = this;
switch (_that) {
case _SipState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SipState value)?  $default,){
final _that = this;
switch (_that) {
case _SipState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool isSubmitting,  FundModel? fund,  double amount,  int debitDay,  String paymentMethod,  List<String> paymentMethods,  SipConfirmation? confirmation,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SipState() when $default != null:
return $default(_that.isLoading,_that.isSubmitting,_that.fund,_that.amount,_that.debitDay,_that.paymentMethod,_that.paymentMethods,_that.confirmation,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool isSubmitting,  FundModel? fund,  double amount,  int debitDay,  String paymentMethod,  List<String> paymentMethods,  SipConfirmation? confirmation,  String? error)  $default,) {final _that = this;
switch (_that) {
case _SipState():
return $default(_that.isLoading,_that.isSubmitting,_that.fund,_that.amount,_that.debitDay,_that.paymentMethod,_that.paymentMethods,_that.confirmation,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool isSubmitting,  FundModel? fund,  double amount,  int debitDay,  String paymentMethod,  List<String> paymentMethods,  SipConfirmation? confirmation,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _SipState() when $default != null:
return $default(_that.isLoading,_that.isSubmitting,_that.fund,_that.amount,_that.debitDay,_that.paymentMethod,_that.paymentMethods,_that.confirmation,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _SipState implements SipState {
  const _SipState({this.isLoading = false, this.isSubmitting = false, this.fund, this.amount = 5000.0, this.debitDay = 5, this.paymentMethod = 'UPI Auto-pay', final  List<String> paymentMethods = const ['UPI Auto-pay', 'Net-banking mandate'], this.confirmation, this.error}): _paymentMethods = paymentMethods;
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isSubmitting;
@override final  FundModel? fund;
@override@JsonKey() final  double amount;
@override@JsonKey() final  int debitDay;
@override@JsonKey() final  String paymentMethod;
 final  List<String> _paymentMethods;
@override@JsonKey() List<String> get paymentMethods {
  if (_paymentMethods is EqualUnmodifiableListView) return _paymentMethods;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_paymentMethods);
}

@override final  SipConfirmation? confirmation;
@override final  String? error;

/// Create a copy of SipState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SipStateCopyWith<_SipState> get copyWith => __$SipStateCopyWithImpl<_SipState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SipState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.fund, fund) || other.fund == fund)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.debitDay, debitDay) || other.debitDay == debitDay)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&const DeepCollectionEquality().equals(other._paymentMethods, _paymentMethods)&&(identical(other.confirmation, confirmation) || other.confirmation == confirmation)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isSubmitting,fund,amount,debitDay,paymentMethod,const DeepCollectionEquality().hash(_paymentMethods),confirmation,error);

@override
String toString() {
  return 'SipState(isLoading: $isLoading, isSubmitting: $isSubmitting, fund: $fund, amount: $amount, debitDay: $debitDay, paymentMethod: $paymentMethod, paymentMethods: $paymentMethods, confirmation: $confirmation, error: $error)';
}


}

/// @nodoc
abstract mixin class _$SipStateCopyWith<$Res> implements $SipStateCopyWith<$Res> {
  factory _$SipStateCopyWith(_SipState value, $Res Function(_SipState) _then) = __$SipStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isSubmitting, FundModel? fund, double amount, int debitDay, String paymentMethod, List<String> paymentMethods, SipConfirmation? confirmation, String? error
});


@override $FundModelCopyWith<$Res>? get fund;@override $SipConfirmationCopyWith<$Res>? get confirmation;

}
/// @nodoc
class __$SipStateCopyWithImpl<$Res>
    implements _$SipStateCopyWith<$Res> {
  __$SipStateCopyWithImpl(this._self, this._then);

  final _SipState _self;
  final $Res Function(_SipState) _then;

/// Create a copy of SipState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isSubmitting = null,Object? fund = freezed,Object? amount = null,Object? debitDay = null,Object? paymentMethod = null,Object? paymentMethods = null,Object? confirmation = freezed,Object? error = freezed,}) {
  return _then(_SipState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,fund: freezed == fund ? _self.fund : fund // ignore: cast_nullable_to_non_nullable
as FundModel?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,debitDay: null == debitDay ? _self.debitDay : debitDay // ignore: cast_nullable_to_non_nullable
as int,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,paymentMethods: null == paymentMethods ? _self._paymentMethods : paymentMethods // ignore: cast_nullable_to_non_nullable
as List<String>,confirmation: freezed == confirmation ? _self.confirmation : confirmation // ignore: cast_nullable_to_non_nullable
as SipConfirmation?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of SipState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FundModelCopyWith<$Res>? get fund {
    if (_self.fund == null) {
    return null;
  }

  return $FundModelCopyWith<$Res>(_self.fund!, (value) {
    return _then(_self.copyWith(fund: value));
  });
}/// Create a copy of SipState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SipConfirmationCopyWith<$Res>? get confirmation {
    if (_self.confirmation == null) {
    return null;
  }

  return $SipConfirmationCopyWith<$Res>(_self.confirmation!, (value) {
    return _then(_self.copyWith(confirmation: value));
  });
}
}

// dart format on
