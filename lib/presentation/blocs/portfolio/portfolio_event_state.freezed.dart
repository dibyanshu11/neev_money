// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'portfolio_event_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PortfolioEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PortfolioEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PortfolioEvent()';
}


}

/// @nodoc
class $PortfolioEventCopyWith<$Res>  {
$PortfolioEventCopyWith(PortfolioEvent _, $Res Function(PortfolioEvent) __);
}


/// Adds pattern-matching-related methods to [PortfolioEvent].
extension PortfolioEventPatterns on PortfolioEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadPortfolio value)?  load,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadPortfolio() when load != null:
return load(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadPortfolio value)  load,}){
final _that = this;
switch (_that) {
case LoadPortfolio():
return load(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadPortfolio value)?  load,}){
final _that = this;
switch (_that) {
case LoadPortfolio() when load != null:
return load(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadPortfolio() when load != null:
return load();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,}) {final _that = this;
switch (_that) {
case LoadPortfolio():
return load();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,}) {final _that = this;
switch (_that) {
case LoadPortfolio() when load != null:
return load();case _:
  return null;

}
}

}

/// @nodoc


class LoadPortfolio implements PortfolioEvent {
  const LoadPortfolio();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadPortfolio);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PortfolioEvent.load()';
}


}




/// @nodoc
mixin _$PortfolioState {

 bool get isLoading; PortfolioSummary? get portfolio; String? get error;
/// Create a copy of PortfolioState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PortfolioStateCopyWith<PortfolioState> get copyWith => _$PortfolioStateCopyWithImpl<PortfolioState>(this as PortfolioState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PortfolioState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.portfolio, portfolio) || other.portfolio == portfolio)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,portfolio,error);

@override
String toString() {
  return 'PortfolioState(isLoading: $isLoading, portfolio: $portfolio, error: $error)';
}


}

/// @nodoc
abstract mixin class $PortfolioStateCopyWith<$Res>  {
  factory $PortfolioStateCopyWith(PortfolioState value, $Res Function(PortfolioState) _then) = _$PortfolioStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, PortfolioSummary? portfolio, String? error
});


$PortfolioSummaryCopyWith<$Res>? get portfolio;

}
/// @nodoc
class _$PortfolioStateCopyWithImpl<$Res>
    implements $PortfolioStateCopyWith<$Res> {
  _$PortfolioStateCopyWithImpl(this._self, this._then);

  final PortfolioState _self;
  final $Res Function(PortfolioState) _then;

/// Create a copy of PortfolioState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? portfolio = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,portfolio: freezed == portfolio ? _self.portfolio : portfolio // ignore: cast_nullable_to_non_nullable
as PortfolioSummary?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of PortfolioState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PortfolioSummaryCopyWith<$Res>? get portfolio {
    if (_self.portfolio == null) {
    return null;
  }

  return $PortfolioSummaryCopyWith<$Res>(_self.portfolio!, (value) {
    return _then(_self.copyWith(portfolio: value));
  });
}
}


/// Adds pattern-matching-related methods to [PortfolioState].
extension PortfolioStatePatterns on PortfolioState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PortfolioState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PortfolioState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PortfolioState value)  $default,){
final _that = this;
switch (_that) {
case _PortfolioState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PortfolioState value)?  $default,){
final _that = this;
switch (_that) {
case _PortfolioState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  PortfolioSummary? portfolio,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PortfolioState() when $default != null:
return $default(_that.isLoading,_that.portfolio,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  PortfolioSummary? portfolio,  String? error)  $default,) {final _that = this;
switch (_that) {
case _PortfolioState():
return $default(_that.isLoading,_that.portfolio,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  PortfolioSummary? portfolio,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _PortfolioState() when $default != null:
return $default(_that.isLoading,_that.portfolio,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _PortfolioState implements PortfolioState {
  const _PortfolioState({this.isLoading = false, this.portfolio, this.error});
  

@override@JsonKey() final  bool isLoading;
@override final  PortfolioSummary? portfolio;
@override final  String? error;

/// Create a copy of PortfolioState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PortfolioStateCopyWith<_PortfolioState> get copyWith => __$PortfolioStateCopyWithImpl<_PortfolioState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PortfolioState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.portfolio, portfolio) || other.portfolio == portfolio)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,portfolio,error);

@override
String toString() {
  return 'PortfolioState(isLoading: $isLoading, portfolio: $portfolio, error: $error)';
}


}

/// @nodoc
abstract mixin class _$PortfolioStateCopyWith<$Res> implements $PortfolioStateCopyWith<$Res> {
  factory _$PortfolioStateCopyWith(_PortfolioState value, $Res Function(_PortfolioState) _then) = __$PortfolioStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, PortfolioSummary? portfolio, String? error
});


@override $PortfolioSummaryCopyWith<$Res>? get portfolio;

}
/// @nodoc
class __$PortfolioStateCopyWithImpl<$Res>
    implements _$PortfolioStateCopyWith<$Res> {
  __$PortfolioStateCopyWithImpl(this._self, this._then);

  final _PortfolioState _self;
  final $Res Function(_PortfolioState) _then;

/// Create a copy of PortfolioState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? portfolio = freezed,Object? error = freezed,}) {
  return _then(_PortfolioState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,portfolio: freezed == portfolio ? _self.portfolio : portfolio // ignore: cast_nullable_to_non_nullable
as PortfolioSummary?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of PortfolioState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PortfolioSummaryCopyWith<$Res>? get portfolio {
    if (_self.portfolio == null) {
    return null;
  }

  return $PortfolioSummaryCopyWith<$Res>(_self.portfolio!, (value) {
    return _then(_self.copyWith(portfolio: value));
  });
}
}

// dart format on
