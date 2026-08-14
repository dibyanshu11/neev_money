// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_event_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent()';
}


}

/// @nodoc
class $HomeEventCopyWith<$Res>  {
$HomeEventCopyWith(HomeEvent _, $Res Function(HomeEvent) __);
}


/// Adds pattern-matching-related methods to [HomeEvent].
extension HomeEventPatterns on HomeEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadHome value)?  load,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadHome() when load != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadHome value)  load,}){
final _that = this;
switch (_that) {
case LoadHome():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadHome value)?  load,}){
final _that = this;
switch (_that) {
case LoadHome() when load != null:
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
case LoadHome() when load != null:
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
case LoadHome():
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
case LoadHome() when load != null:
return load();case _:
  return null;

}
}

}

/// @nodoc


class LoadHome implements HomeEvent {
  const LoadHome();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadHome);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.load()';
}


}




/// @nodoc
mixin _$HomeState {

 bool get isLoading; UserModel? get user; PortfolioSummary? get portfolio; List<FundModel> get funds; String? get error;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.user, user) || other.user == user)&&(identical(other.portfolio, portfolio) || other.portfolio == portfolio)&&const DeepCollectionEquality().equals(other.funds, funds)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,user,portfolio,const DeepCollectionEquality().hash(funds),error);

@override
String toString() {
  return 'HomeState(isLoading: $isLoading, user: $user, portfolio: $portfolio, funds: $funds, error: $error)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, UserModel? user, PortfolioSummary? portfolio, List<FundModel> funds, String? error
});


$UserModelCopyWith<$Res>? get user;$PortfolioSummaryCopyWith<$Res>? get portfolio;

}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? user = freezed,Object? portfolio = freezed,Object? funds = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,portfolio: freezed == portfolio ? _self.portfolio : portfolio // ignore: cast_nullable_to_non_nullable
as PortfolioSummary?,funds: null == funds ? _self.funds : funds // ignore: cast_nullable_to_non_nullable
as List<FundModel>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of HomeState
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


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeState value)  $default,){
final _that = this;
switch (_that) {
case _HomeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  UserModel? user,  PortfolioSummary? portfolio,  List<FundModel> funds,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.isLoading,_that.user,_that.portfolio,_that.funds,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  UserModel? user,  PortfolioSummary? portfolio,  List<FundModel> funds,  String? error)  $default,) {final _that = this;
switch (_that) {
case _HomeState():
return $default(_that.isLoading,_that.user,_that.portfolio,_that.funds,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  UserModel? user,  PortfolioSummary? portfolio,  List<FundModel> funds,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.isLoading,_that.user,_that.portfolio,_that.funds,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _HomeState implements HomeState {
  const _HomeState({this.isLoading = false, this.user, this.portfolio, final  List<FundModel> funds = const [], this.error}): _funds = funds;
  

@override@JsonKey() final  bool isLoading;
@override final  UserModel? user;
@override final  PortfolioSummary? portfolio;
 final  List<FundModel> _funds;
@override@JsonKey() List<FundModel> get funds {
  if (_funds is EqualUnmodifiableListView) return _funds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_funds);
}

@override final  String? error;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.user, user) || other.user == user)&&(identical(other.portfolio, portfolio) || other.portfolio == portfolio)&&const DeepCollectionEquality().equals(other._funds, _funds)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,user,portfolio,const DeepCollectionEquality().hash(_funds),error);

@override
String toString() {
  return 'HomeState(isLoading: $isLoading, user: $user, portfolio: $portfolio, funds: $funds, error: $error)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, UserModel? user, PortfolioSummary? portfolio, List<FundModel> funds, String? error
});


@override $UserModelCopyWith<$Res>? get user;@override $PortfolioSummaryCopyWith<$Res>? get portfolio;

}
/// @nodoc
class __$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? user = freezed,Object? portfolio = freezed,Object? funds = null,Object? error = freezed,}) {
  return _then(_HomeState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,portfolio: freezed == portfolio ? _self.portfolio : portfolio // ignore: cast_nullable_to_non_nullable
as PortfolioSummary?,funds: null == funds ? _self._funds : funds // ignore: cast_nullable_to_non_nullable
as List<FundModel>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of HomeState
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
