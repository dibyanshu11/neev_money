// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppFailure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppFailure()';
}


}

/// @nodoc
class $AppFailureCopyWith<$Res>  {
$AppFailureCopyWith(AppFailure _, $Res Function(AppFailure) __);
}


/// Adds pattern-matching-related methods to [AppFailure].
extension AppFailurePatterns on AppFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ServerError value)?  serverError,TResult Function( ConnectionFailure value)?  connectionFailure,TResult Function( Unauthorized value)?  unauthorized,TResult Function( NotFound value)?  notFound,TResult Function( UnknownFailure value)?  unknown,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ServerError() when serverError != null:
return serverError(_that);case ConnectionFailure() when connectionFailure != null:
return connectionFailure(_that);case Unauthorized() when unauthorized != null:
return unauthorized(_that);case NotFound() when notFound != null:
return notFound(_that);case UnknownFailure() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ServerError value)  serverError,required TResult Function( ConnectionFailure value)  connectionFailure,required TResult Function( Unauthorized value)  unauthorized,required TResult Function( NotFound value)  notFound,required TResult Function( UnknownFailure value)  unknown,}){
final _that = this;
switch (_that) {
case ServerError():
return serverError(_that);case ConnectionFailure():
return connectionFailure(_that);case Unauthorized():
return unauthorized(_that);case NotFound():
return notFound(_that);case UnknownFailure():
return unknown(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ServerError value)?  serverError,TResult? Function( ConnectionFailure value)?  connectionFailure,TResult? Function( Unauthorized value)?  unauthorized,TResult? Function( NotFound value)?  notFound,TResult? Function( UnknownFailure value)?  unknown,}){
final _that = this;
switch (_that) {
case ServerError() when serverError != null:
return serverError(_that);case ConnectionFailure() when connectionFailure != null:
return connectionFailure(_that);case Unauthorized() when unauthorized != null:
return unauthorized(_that);case NotFound() when notFound != null:
return notFound(_that);case UnknownFailure() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  serverError,TResult Function()?  connectionFailure,TResult Function()?  unauthorized,TResult Function()?  notFound,TResult Function()?  unknown,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ServerError() when serverError != null:
return serverError(_that.message);case ConnectionFailure() when connectionFailure != null:
return connectionFailure();case Unauthorized() when unauthorized != null:
return unauthorized();case NotFound() when notFound != null:
return notFound();case UnknownFailure() when unknown != null:
return unknown();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  serverError,required TResult Function()  connectionFailure,required TResult Function()  unauthorized,required TResult Function()  notFound,required TResult Function()  unknown,}) {final _that = this;
switch (_that) {
case ServerError():
return serverError(_that.message);case ConnectionFailure():
return connectionFailure();case Unauthorized():
return unauthorized();case NotFound():
return notFound();case UnknownFailure():
return unknown();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  serverError,TResult? Function()?  connectionFailure,TResult? Function()?  unauthorized,TResult? Function()?  notFound,TResult? Function()?  unknown,}) {final _that = this;
switch (_that) {
case ServerError() when serverError != null:
return serverError(_that.message);case ConnectionFailure() when connectionFailure != null:
return connectionFailure();case Unauthorized() when unauthorized != null:
return unauthorized();case NotFound() when notFound != null:
return notFound();case UnknownFailure() when unknown != null:
return unknown();case _:
  return null;

}
}

}

/// @nodoc


class ServerError implements AppFailure {
  const ServerError(this.message);
  

 final  String message;

/// Create a copy of AppFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerErrorCopyWith<ServerError> get copyWith => _$ServerErrorCopyWithImpl<ServerError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AppFailure.serverError(message: $message)';
}


}

/// @nodoc
abstract mixin class $ServerErrorCopyWith<$Res> implements $AppFailureCopyWith<$Res> {
  factory $ServerErrorCopyWith(ServerError value, $Res Function(ServerError) _then) = _$ServerErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ServerErrorCopyWithImpl<$Res>
    implements $ServerErrorCopyWith<$Res> {
  _$ServerErrorCopyWithImpl(this._self, this._then);

  final ServerError _self;
  final $Res Function(ServerError) _then;

/// Create a copy of AppFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ServerError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ConnectionFailure implements AppFailure {
  const ConnectionFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppFailure.connectionFailure()';
}


}




/// @nodoc


class Unauthorized implements AppFailure {
  const Unauthorized();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Unauthorized);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppFailure.unauthorized()';
}


}




/// @nodoc


class NotFound implements AppFailure {
  const NotFound();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotFound);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppFailure.notFound()';
}


}




/// @nodoc


class UnknownFailure implements AppFailure {
  const UnknownFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnknownFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppFailure.unknown()';
}


}




// dart format on
