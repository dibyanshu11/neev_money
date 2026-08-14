// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fund_detail_event_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FundDetailEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FundDetailEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FundDetailEvent()';
}


}

/// @nodoc
class $FundDetailEventCopyWith<$Res>  {
$FundDetailEventCopyWith(FundDetailEvent _, $Res Function(FundDetailEvent) __);
}


/// Adds pattern-matching-related methods to [FundDetailEvent].
extension FundDetailEventPatterns on FundDetailEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadFundDetail value)?  load,TResult Function( ChartPeriodChanged value)?  chartPeriodChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadFundDetail() when load != null:
return load(_that);case ChartPeriodChanged() when chartPeriodChanged != null:
return chartPeriodChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadFundDetail value)  load,required TResult Function( ChartPeriodChanged value)  chartPeriodChanged,}){
final _that = this;
switch (_that) {
case LoadFundDetail():
return load(_that);case ChartPeriodChanged():
return chartPeriodChanged(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadFundDetail value)?  load,TResult? Function( ChartPeriodChanged value)?  chartPeriodChanged,}){
final _that = this;
switch (_that) {
case LoadFundDetail() when load != null:
return load(_that);case ChartPeriodChanged() when chartPeriodChanged != null:
return chartPeriodChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String fundId)?  load,TResult Function( String period)?  chartPeriodChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadFundDetail() when load != null:
return load(_that.fundId);case ChartPeriodChanged() when chartPeriodChanged != null:
return chartPeriodChanged(_that.period);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String fundId)  load,required TResult Function( String period)  chartPeriodChanged,}) {final _that = this;
switch (_that) {
case LoadFundDetail():
return load(_that.fundId);case ChartPeriodChanged():
return chartPeriodChanged(_that.period);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String fundId)?  load,TResult? Function( String period)?  chartPeriodChanged,}) {final _that = this;
switch (_that) {
case LoadFundDetail() when load != null:
return load(_that.fundId);case ChartPeriodChanged() when chartPeriodChanged != null:
return chartPeriodChanged(_that.period);case _:
  return null;

}
}

}

/// @nodoc


class LoadFundDetail implements FundDetailEvent {
  const LoadFundDetail(this.fundId);
  

 final  String fundId;

/// Create a copy of FundDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadFundDetailCopyWith<LoadFundDetail> get copyWith => _$LoadFundDetailCopyWithImpl<LoadFundDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadFundDetail&&(identical(other.fundId, fundId) || other.fundId == fundId));
}


@override
int get hashCode => Object.hash(runtimeType,fundId);

@override
String toString() {
  return 'FundDetailEvent.load(fundId: $fundId)';
}


}

/// @nodoc
abstract mixin class $LoadFundDetailCopyWith<$Res> implements $FundDetailEventCopyWith<$Res> {
  factory $LoadFundDetailCopyWith(LoadFundDetail value, $Res Function(LoadFundDetail) _then) = _$LoadFundDetailCopyWithImpl;
@useResult
$Res call({
 String fundId
});




}
/// @nodoc
class _$LoadFundDetailCopyWithImpl<$Res>
    implements $LoadFundDetailCopyWith<$Res> {
  _$LoadFundDetailCopyWithImpl(this._self, this._then);

  final LoadFundDetail _self;
  final $Res Function(LoadFundDetail) _then;

/// Create a copy of FundDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? fundId = null,}) {
  return _then(LoadFundDetail(
null == fundId ? _self.fundId : fundId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ChartPeriodChanged implements FundDetailEvent {
  const ChartPeriodChanged(this.period);
  

 final  String period;

/// Create a copy of FundDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChartPeriodChangedCopyWith<ChartPeriodChanged> get copyWith => _$ChartPeriodChangedCopyWithImpl<ChartPeriodChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChartPeriodChanged&&(identical(other.period, period) || other.period == period));
}


@override
int get hashCode => Object.hash(runtimeType,period);

@override
String toString() {
  return 'FundDetailEvent.chartPeriodChanged(period: $period)';
}


}

/// @nodoc
abstract mixin class $ChartPeriodChangedCopyWith<$Res> implements $FundDetailEventCopyWith<$Res> {
  factory $ChartPeriodChangedCopyWith(ChartPeriodChanged value, $Res Function(ChartPeriodChanged) _then) = _$ChartPeriodChangedCopyWithImpl;
@useResult
$Res call({
 String period
});




}
/// @nodoc
class _$ChartPeriodChangedCopyWithImpl<$Res>
    implements $ChartPeriodChangedCopyWith<$Res> {
  _$ChartPeriodChangedCopyWithImpl(this._self, this._then);

  final ChartPeriodChanged _self;
  final $Res Function(ChartPeriodChanged) _then;

/// Create a copy of FundDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? period = null,}) {
  return _then(ChartPeriodChanged(
null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$FundDetailState {

 bool get isLoading; FundModel? get fund; String get selectedPeriod; String? get error;
/// Create a copy of FundDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FundDetailStateCopyWith<FundDetailState> get copyWith => _$FundDetailStateCopyWithImpl<FundDetailState>(this as FundDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FundDetailState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.fund, fund) || other.fund == fund)&&(identical(other.selectedPeriod, selectedPeriod) || other.selectedPeriod == selectedPeriod)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,fund,selectedPeriod,error);

@override
String toString() {
  return 'FundDetailState(isLoading: $isLoading, fund: $fund, selectedPeriod: $selectedPeriod, error: $error)';
}


}

/// @nodoc
abstract mixin class $FundDetailStateCopyWith<$Res>  {
  factory $FundDetailStateCopyWith(FundDetailState value, $Res Function(FundDetailState) _then) = _$FundDetailStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, FundModel? fund, String selectedPeriod, String? error
});


$FundModelCopyWith<$Res>? get fund;

}
/// @nodoc
class _$FundDetailStateCopyWithImpl<$Res>
    implements $FundDetailStateCopyWith<$Res> {
  _$FundDetailStateCopyWithImpl(this._self, this._then);

  final FundDetailState _self;
  final $Res Function(FundDetailState) _then;

/// Create a copy of FundDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? fund = freezed,Object? selectedPeriod = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,fund: freezed == fund ? _self.fund : fund // ignore: cast_nullable_to_non_nullable
as FundModel?,selectedPeriod: null == selectedPeriod ? _self.selectedPeriod : selectedPeriod // ignore: cast_nullable_to_non_nullable
as String,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of FundDetailState
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
}
}


/// Adds pattern-matching-related methods to [FundDetailState].
extension FundDetailStatePatterns on FundDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FundDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FundDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FundDetailState value)  $default,){
final _that = this;
switch (_that) {
case _FundDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FundDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _FundDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  FundModel? fund,  String selectedPeriod,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FundDetailState() when $default != null:
return $default(_that.isLoading,_that.fund,_that.selectedPeriod,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  FundModel? fund,  String selectedPeriod,  String? error)  $default,) {final _that = this;
switch (_that) {
case _FundDetailState():
return $default(_that.isLoading,_that.fund,_that.selectedPeriod,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  FundModel? fund,  String selectedPeriod,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _FundDetailState() when $default != null:
return $default(_that.isLoading,_that.fund,_that.selectedPeriod,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _FundDetailState implements FundDetailState {
  const _FundDetailState({this.isLoading = false, this.fund, this.selectedPeriod = '5Y', this.error});
  

@override@JsonKey() final  bool isLoading;
@override final  FundModel? fund;
@override@JsonKey() final  String selectedPeriod;
@override final  String? error;

/// Create a copy of FundDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FundDetailStateCopyWith<_FundDetailState> get copyWith => __$FundDetailStateCopyWithImpl<_FundDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FundDetailState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.fund, fund) || other.fund == fund)&&(identical(other.selectedPeriod, selectedPeriod) || other.selectedPeriod == selectedPeriod)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,fund,selectedPeriod,error);

@override
String toString() {
  return 'FundDetailState(isLoading: $isLoading, fund: $fund, selectedPeriod: $selectedPeriod, error: $error)';
}


}

/// @nodoc
abstract mixin class _$FundDetailStateCopyWith<$Res> implements $FundDetailStateCopyWith<$Res> {
  factory _$FundDetailStateCopyWith(_FundDetailState value, $Res Function(_FundDetailState) _then) = __$FundDetailStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, FundModel? fund, String selectedPeriod, String? error
});


@override $FundModelCopyWith<$Res>? get fund;

}
/// @nodoc
class __$FundDetailStateCopyWithImpl<$Res>
    implements _$FundDetailStateCopyWith<$Res> {
  __$FundDetailStateCopyWithImpl(this._self, this._then);

  final _FundDetailState _self;
  final $Res Function(_FundDetailState) _then;

/// Create a copy of FundDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? fund = freezed,Object? selectedPeriod = null,Object? error = freezed,}) {
  return _then(_FundDetailState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,fund: freezed == fund ? _self.fund : fund // ignore: cast_nullable_to_non_nullable
as FundModel?,selectedPeriod: null == selectedPeriod ? _self.selectedPeriod : selectedPeriod // ignore: cast_nullable_to_non_nullable
as String,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of FundDetailState
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
}
}

// dart format on
