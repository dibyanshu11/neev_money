// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'portfolio_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PortfolioSummary {

 double get currentValue; double get investedAmount; double get totalReturns; double get totalReturnsPercent; double get oneDayChange; double get oneDayChangePercent; List<AllocationItem> get allocation; List<PortfolioHolding> get holdings;
/// Create a copy of PortfolioSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PortfolioSummaryCopyWith<PortfolioSummary> get copyWith => _$PortfolioSummaryCopyWithImpl<PortfolioSummary>(this as PortfolioSummary, _$identity);

  /// Serializes this PortfolioSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PortfolioSummary&&(identical(other.currentValue, currentValue) || other.currentValue == currentValue)&&(identical(other.investedAmount, investedAmount) || other.investedAmount == investedAmount)&&(identical(other.totalReturns, totalReturns) || other.totalReturns == totalReturns)&&(identical(other.totalReturnsPercent, totalReturnsPercent) || other.totalReturnsPercent == totalReturnsPercent)&&(identical(other.oneDayChange, oneDayChange) || other.oneDayChange == oneDayChange)&&(identical(other.oneDayChangePercent, oneDayChangePercent) || other.oneDayChangePercent == oneDayChangePercent)&&const DeepCollectionEquality().equals(other.allocation, allocation)&&const DeepCollectionEquality().equals(other.holdings, holdings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentValue,investedAmount,totalReturns,totalReturnsPercent,oneDayChange,oneDayChangePercent,const DeepCollectionEquality().hash(allocation),const DeepCollectionEquality().hash(holdings));

@override
String toString() {
  return 'PortfolioSummary(currentValue: $currentValue, investedAmount: $investedAmount, totalReturns: $totalReturns, totalReturnsPercent: $totalReturnsPercent, oneDayChange: $oneDayChange, oneDayChangePercent: $oneDayChangePercent, allocation: $allocation, holdings: $holdings)';
}


}

/// @nodoc
abstract mixin class $PortfolioSummaryCopyWith<$Res>  {
  factory $PortfolioSummaryCopyWith(PortfolioSummary value, $Res Function(PortfolioSummary) _then) = _$PortfolioSummaryCopyWithImpl;
@useResult
$Res call({
 double currentValue, double investedAmount, double totalReturns, double totalReturnsPercent, double oneDayChange, double oneDayChangePercent, List<AllocationItem> allocation, List<PortfolioHolding> holdings
});




}
/// @nodoc
class _$PortfolioSummaryCopyWithImpl<$Res>
    implements $PortfolioSummaryCopyWith<$Res> {
  _$PortfolioSummaryCopyWithImpl(this._self, this._then);

  final PortfolioSummary _self;
  final $Res Function(PortfolioSummary) _then;

/// Create a copy of PortfolioSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentValue = null,Object? investedAmount = null,Object? totalReturns = null,Object? totalReturnsPercent = null,Object? oneDayChange = null,Object? oneDayChangePercent = null,Object? allocation = null,Object? holdings = null,}) {
  return _then(_self.copyWith(
currentValue: null == currentValue ? _self.currentValue : currentValue // ignore: cast_nullable_to_non_nullable
as double,investedAmount: null == investedAmount ? _self.investedAmount : investedAmount // ignore: cast_nullable_to_non_nullable
as double,totalReturns: null == totalReturns ? _self.totalReturns : totalReturns // ignore: cast_nullable_to_non_nullable
as double,totalReturnsPercent: null == totalReturnsPercent ? _self.totalReturnsPercent : totalReturnsPercent // ignore: cast_nullable_to_non_nullable
as double,oneDayChange: null == oneDayChange ? _self.oneDayChange : oneDayChange // ignore: cast_nullable_to_non_nullable
as double,oneDayChangePercent: null == oneDayChangePercent ? _self.oneDayChangePercent : oneDayChangePercent // ignore: cast_nullable_to_non_nullable
as double,allocation: null == allocation ? _self.allocation : allocation // ignore: cast_nullable_to_non_nullable
as List<AllocationItem>,holdings: null == holdings ? _self.holdings : holdings // ignore: cast_nullable_to_non_nullable
as List<PortfolioHolding>,
  ));
}

}


/// Adds pattern-matching-related methods to [PortfolioSummary].
extension PortfolioSummaryPatterns on PortfolioSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PortfolioSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PortfolioSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PortfolioSummary value)  $default,){
final _that = this;
switch (_that) {
case _PortfolioSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PortfolioSummary value)?  $default,){
final _that = this;
switch (_that) {
case _PortfolioSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double currentValue,  double investedAmount,  double totalReturns,  double totalReturnsPercent,  double oneDayChange,  double oneDayChangePercent,  List<AllocationItem> allocation,  List<PortfolioHolding> holdings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PortfolioSummary() when $default != null:
return $default(_that.currentValue,_that.investedAmount,_that.totalReturns,_that.totalReturnsPercent,_that.oneDayChange,_that.oneDayChangePercent,_that.allocation,_that.holdings);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double currentValue,  double investedAmount,  double totalReturns,  double totalReturnsPercent,  double oneDayChange,  double oneDayChangePercent,  List<AllocationItem> allocation,  List<PortfolioHolding> holdings)  $default,) {final _that = this;
switch (_that) {
case _PortfolioSummary():
return $default(_that.currentValue,_that.investedAmount,_that.totalReturns,_that.totalReturnsPercent,_that.oneDayChange,_that.oneDayChangePercent,_that.allocation,_that.holdings);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double currentValue,  double investedAmount,  double totalReturns,  double totalReturnsPercent,  double oneDayChange,  double oneDayChangePercent,  List<AllocationItem> allocation,  List<PortfolioHolding> holdings)?  $default,) {final _that = this;
switch (_that) {
case _PortfolioSummary() when $default != null:
return $default(_that.currentValue,_that.investedAmount,_that.totalReturns,_that.totalReturnsPercent,_that.oneDayChange,_that.oneDayChangePercent,_that.allocation,_that.holdings);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PortfolioSummary implements PortfolioSummary {
  const _PortfolioSummary({required this.currentValue, required this.investedAmount, required this.totalReturns, required this.totalReturnsPercent, required this.oneDayChange, required this.oneDayChangePercent, final  List<AllocationItem> allocation = const [], final  List<PortfolioHolding> holdings = const []}): _allocation = allocation,_holdings = holdings;
  factory _PortfolioSummary.fromJson(Map<String, dynamic> json) => _$PortfolioSummaryFromJson(json);

@override final  double currentValue;
@override final  double investedAmount;
@override final  double totalReturns;
@override final  double totalReturnsPercent;
@override final  double oneDayChange;
@override final  double oneDayChangePercent;
 final  List<AllocationItem> _allocation;
@override@JsonKey() List<AllocationItem> get allocation {
  if (_allocation is EqualUnmodifiableListView) return _allocation;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allocation);
}

 final  List<PortfolioHolding> _holdings;
@override@JsonKey() List<PortfolioHolding> get holdings {
  if (_holdings is EqualUnmodifiableListView) return _holdings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_holdings);
}


/// Create a copy of PortfolioSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PortfolioSummaryCopyWith<_PortfolioSummary> get copyWith => __$PortfolioSummaryCopyWithImpl<_PortfolioSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PortfolioSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PortfolioSummary&&(identical(other.currentValue, currentValue) || other.currentValue == currentValue)&&(identical(other.investedAmount, investedAmount) || other.investedAmount == investedAmount)&&(identical(other.totalReturns, totalReturns) || other.totalReturns == totalReturns)&&(identical(other.totalReturnsPercent, totalReturnsPercent) || other.totalReturnsPercent == totalReturnsPercent)&&(identical(other.oneDayChange, oneDayChange) || other.oneDayChange == oneDayChange)&&(identical(other.oneDayChangePercent, oneDayChangePercent) || other.oneDayChangePercent == oneDayChangePercent)&&const DeepCollectionEquality().equals(other._allocation, _allocation)&&const DeepCollectionEquality().equals(other._holdings, _holdings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentValue,investedAmount,totalReturns,totalReturnsPercent,oneDayChange,oneDayChangePercent,const DeepCollectionEquality().hash(_allocation),const DeepCollectionEquality().hash(_holdings));

@override
String toString() {
  return 'PortfolioSummary(currentValue: $currentValue, investedAmount: $investedAmount, totalReturns: $totalReturns, totalReturnsPercent: $totalReturnsPercent, oneDayChange: $oneDayChange, oneDayChangePercent: $oneDayChangePercent, allocation: $allocation, holdings: $holdings)';
}


}

/// @nodoc
abstract mixin class _$PortfolioSummaryCopyWith<$Res> implements $PortfolioSummaryCopyWith<$Res> {
  factory _$PortfolioSummaryCopyWith(_PortfolioSummary value, $Res Function(_PortfolioSummary) _then) = __$PortfolioSummaryCopyWithImpl;
@override @useResult
$Res call({
 double currentValue, double investedAmount, double totalReturns, double totalReturnsPercent, double oneDayChange, double oneDayChangePercent, List<AllocationItem> allocation, List<PortfolioHolding> holdings
});




}
/// @nodoc
class __$PortfolioSummaryCopyWithImpl<$Res>
    implements _$PortfolioSummaryCopyWith<$Res> {
  __$PortfolioSummaryCopyWithImpl(this._self, this._then);

  final _PortfolioSummary _self;
  final $Res Function(_PortfolioSummary) _then;

/// Create a copy of PortfolioSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentValue = null,Object? investedAmount = null,Object? totalReturns = null,Object? totalReturnsPercent = null,Object? oneDayChange = null,Object? oneDayChangePercent = null,Object? allocation = null,Object? holdings = null,}) {
  return _then(_PortfolioSummary(
currentValue: null == currentValue ? _self.currentValue : currentValue // ignore: cast_nullable_to_non_nullable
as double,investedAmount: null == investedAmount ? _self.investedAmount : investedAmount // ignore: cast_nullable_to_non_nullable
as double,totalReturns: null == totalReturns ? _self.totalReturns : totalReturns // ignore: cast_nullable_to_non_nullable
as double,totalReturnsPercent: null == totalReturnsPercent ? _self.totalReturnsPercent : totalReturnsPercent // ignore: cast_nullable_to_non_nullable
as double,oneDayChange: null == oneDayChange ? _self.oneDayChange : oneDayChange // ignore: cast_nullable_to_non_nullable
as double,oneDayChangePercent: null == oneDayChangePercent ? _self.oneDayChangePercent : oneDayChangePercent // ignore: cast_nullable_to_non_nullable
as double,allocation: null == allocation ? _self._allocation : allocation // ignore: cast_nullable_to_non_nullable
as List<AllocationItem>,holdings: null == holdings ? _self._holdings : holdings // ignore: cast_nullable_to_non_nullable
as List<PortfolioHolding>,
  ));
}


}


/// @nodoc
mixin _$AllocationItem {

 String get name; double get percentage;
/// Create a copy of AllocationItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AllocationItemCopyWith<AllocationItem> get copyWith => _$AllocationItemCopyWithImpl<AllocationItem>(this as AllocationItem, _$identity);

  /// Serializes this AllocationItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AllocationItem&&(identical(other.name, name) || other.name == name)&&(identical(other.percentage, percentage) || other.percentage == percentage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,percentage);

@override
String toString() {
  return 'AllocationItem(name: $name, percentage: $percentage)';
}


}

/// @nodoc
abstract mixin class $AllocationItemCopyWith<$Res>  {
  factory $AllocationItemCopyWith(AllocationItem value, $Res Function(AllocationItem) _then) = _$AllocationItemCopyWithImpl;
@useResult
$Res call({
 String name, double percentage
});




}
/// @nodoc
class _$AllocationItemCopyWithImpl<$Res>
    implements $AllocationItemCopyWith<$Res> {
  _$AllocationItemCopyWithImpl(this._self, this._then);

  final AllocationItem _self;
  final $Res Function(AllocationItem) _then;

/// Create a copy of AllocationItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? percentage = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,percentage: null == percentage ? _self.percentage : percentage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [AllocationItem].
extension AllocationItemPatterns on AllocationItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AllocationItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AllocationItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AllocationItem value)  $default,){
final _that = this;
switch (_that) {
case _AllocationItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AllocationItem value)?  $default,){
final _that = this;
switch (_that) {
case _AllocationItem() when $default != null:
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
case _AllocationItem() when $default != null:
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
case _AllocationItem():
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
case _AllocationItem() when $default != null:
return $default(_that.name,_that.percentage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AllocationItem implements AllocationItem {
  const _AllocationItem({required this.name, required this.percentage});
  factory _AllocationItem.fromJson(Map<String, dynamic> json) => _$AllocationItemFromJson(json);

@override final  String name;
@override final  double percentage;

/// Create a copy of AllocationItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AllocationItemCopyWith<_AllocationItem> get copyWith => __$AllocationItemCopyWithImpl<_AllocationItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AllocationItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AllocationItem&&(identical(other.name, name) || other.name == name)&&(identical(other.percentage, percentage) || other.percentage == percentage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,percentage);

@override
String toString() {
  return 'AllocationItem(name: $name, percentage: $percentage)';
}


}

/// @nodoc
abstract mixin class _$AllocationItemCopyWith<$Res> implements $AllocationItemCopyWith<$Res> {
  factory _$AllocationItemCopyWith(_AllocationItem value, $Res Function(_AllocationItem) _then) = __$AllocationItemCopyWithImpl;
@override @useResult
$Res call({
 String name, double percentage
});




}
/// @nodoc
class __$AllocationItemCopyWithImpl<$Res>
    implements _$AllocationItemCopyWith<$Res> {
  __$AllocationItemCopyWithImpl(this._self, this._then);

  final _AllocationItem _self;
  final $Res Function(_AllocationItem) _then;

/// Create a copy of AllocationItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? percentage = null,}) {
  return _then(_AllocationItem(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,percentage: null == percentage ? _self.percentage : percentage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$PortfolioHolding {

 String get fundId; String get fundName; double get currentValue; double get dailyChange; double get dailyChangePercent; double get profitLoss; double get profitLossPercent;
/// Create a copy of PortfolioHolding
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PortfolioHoldingCopyWith<PortfolioHolding> get copyWith => _$PortfolioHoldingCopyWithImpl<PortfolioHolding>(this as PortfolioHolding, _$identity);

  /// Serializes this PortfolioHolding to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PortfolioHolding&&(identical(other.fundId, fundId) || other.fundId == fundId)&&(identical(other.fundName, fundName) || other.fundName == fundName)&&(identical(other.currentValue, currentValue) || other.currentValue == currentValue)&&(identical(other.dailyChange, dailyChange) || other.dailyChange == dailyChange)&&(identical(other.dailyChangePercent, dailyChangePercent) || other.dailyChangePercent == dailyChangePercent)&&(identical(other.profitLoss, profitLoss) || other.profitLoss == profitLoss)&&(identical(other.profitLossPercent, profitLossPercent) || other.profitLossPercent == profitLossPercent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fundId,fundName,currentValue,dailyChange,dailyChangePercent,profitLoss,profitLossPercent);

@override
String toString() {
  return 'PortfolioHolding(fundId: $fundId, fundName: $fundName, currentValue: $currentValue, dailyChange: $dailyChange, dailyChangePercent: $dailyChangePercent, profitLoss: $profitLoss, profitLossPercent: $profitLossPercent)';
}


}

/// @nodoc
abstract mixin class $PortfolioHoldingCopyWith<$Res>  {
  factory $PortfolioHoldingCopyWith(PortfolioHolding value, $Res Function(PortfolioHolding) _then) = _$PortfolioHoldingCopyWithImpl;
@useResult
$Res call({
 String fundId, String fundName, double currentValue, double dailyChange, double dailyChangePercent, double profitLoss, double profitLossPercent
});




}
/// @nodoc
class _$PortfolioHoldingCopyWithImpl<$Res>
    implements $PortfolioHoldingCopyWith<$Res> {
  _$PortfolioHoldingCopyWithImpl(this._self, this._then);

  final PortfolioHolding _self;
  final $Res Function(PortfolioHolding) _then;

/// Create a copy of PortfolioHolding
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fundId = null,Object? fundName = null,Object? currentValue = null,Object? dailyChange = null,Object? dailyChangePercent = null,Object? profitLoss = null,Object? profitLossPercent = null,}) {
  return _then(_self.copyWith(
fundId: null == fundId ? _self.fundId : fundId // ignore: cast_nullable_to_non_nullable
as String,fundName: null == fundName ? _self.fundName : fundName // ignore: cast_nullable_to_non_nullable
as String,currentValue: null == currentValue ? _self.currentValue : currentValue // ignore: cast_nullable_to_non_nullable
as double,dailyChange: null == dailyChange ? _self.dailyChange : dailyChange // ignore: cast_nullable_to_non_nullable
as double,dailyChangePercent: null == dailyChangePercent ? _self.dailyChangePercent : dailyChangePercent // ignore: cast_nullable_to_non_nullable
as double,profitLoss: null == profitLoss ? _self.profitLoss : profitLoss // ignore: cast_nullable_to_non_nullable
as double,profitLossPercent: null == profitLossPercent ? _self.profitLossPercent : profitLossPercent // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [PortfolioHolding].
extension PortfolioHoldingPatterns on PortfolioHolding {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PortfolioHolding value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PortfolioHolding() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PortfolioHolding value)  $default,){
final _that = this;
switch (_that) {
case _PortfolioHolding():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PortfolioHolding value)?  $default,){
final _that = this;
switch (_that) {
case _PortfolioHolding() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fundId,  String fundName,  double currentValue,  double dailyChange,  double dailyChangePercent,  double profitLoss,  double profitLossPercent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PortfolioHolding() when $default != null:
return $default(_that.fundId,_that.fundName,_that.currentValue,_that.dailyChange,_that.dailyChangePercent,_that.profitLoss,_that.profitLossPercent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fundId,  String fundName,  double currentValue,  double dailyChange,  double dailyChangePercent,  double profitLoss,  double profitLossPercent)  $default,) {final _that = this;
switch (_that) {
case _PortfolioHolding():
return $default(_that.fundId,_that.fundName,_that.currentValue,_that.dailyChange,_that.dailyChangePercent,_that.profitLoss,_that.profitLossPercent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fundId,  String fundName,  double currentValue,  double dailyChange,  double dailyChangePercent,  double profitLoss,  double profitLossPercent)?  $default,) {final _that = this;
switch (_that) {
case _PortfolioHolding() when $default != null:
return $default(_that.fundId,_that.fundName,_that.currentValue,_that.dailyChange,_that.dailyChangePercent,_that.profitLoss,_that.profitLossPercent);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PortfolioHolding implements PortfolioHolding {
  const _PortfolioHolding({required this.fundId, required this.fundName, required this.currentValue, required this.dailyChange, required this.dailyChangePercent, required this.profitLoss, required this.profitLossPercent});
  factory _PortfolioHolding.fromJson(Map<String, dynamic> json) => _$PortfolioHoldingFromJson(json);

@override final  String fundId;
@override final  String fundName;
@override final  double currentValue;
@override final  double dailyChange;
@override final  double dailyChangePercent;
@override final  double profitLoss;
@override final  double profitLossPercent;

/// Create a copy of PortfolioHolding
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PortfolioHoldingCopyWith<_PortfolioHolding> get copyWith => __$PortfolioHoldingCopyWithImpl<_PortfolioHolding>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PortfolioHoldingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PortfolioHolding&&(identical(other.fundId, fundId) || other.fundId == fundId)&&(identical(other.fundName, fundName) || other.fundName == fundName)&&(identical(other.currentValue, currentValue) || other.currentValue == currentValue)&&(identical(other.dailyChange, dailyChange) || other.dailyChange == dailyChange)&&(identical(other.dailyChangePercent, dailyChangePercent) || other.dailyChangePercent == dailyChangePercent)&&(identical(other.profitLoss, profitLoss) || other.profitLoss == profitLoss)&&(identical(other.profitLossPercent, profitLossPercent) || other.profitLossPercent == profitLossPercent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fundId,fundName,currentValue,dailyChange,dailyChangePercent,profitLoss,profitLossPercent);

@override
String toString() {
  return 'PortfolioHolding(fundId: $fundId, fundName: $fundName, currentValue: $currentValue, dailyChange: $dailyChange, dailyChangePercent: $dailyChangePercent, profitLoss: $profitLoss, profitLossPercent: $profitLossPercent)';
}


}

/// @nodoc
abstract mixin class _$PortfolioHoldingCopyWith<$Res> implements $PortfolioHoldingCopyWith<$Res> {
  factory _$PortfolioHoldingCopyWith(_PortfolioHolding value, $Res Function(_PortfolioHolding) _then) = __$PortfolioHoldingCopyWithImpl;
@override @useResult
$Res call({
 String fundId, String fundName, double currentValue, double dailyChange, double dailyChangePercent, double profitLoss, double profitLossPercent
});




}
/// @nodoc
class __$PortfolioHoldingCopyWithImpl<$Res>
    implements _$PortfolioHoldingCopyWith<$Res> {
  __$PortfolioHoldingCopyWithImpl(this._self, this._then);

  final _PortfolioHolding _self;
  final $Res Function(_PortfolioHolding) _then;

/// Create a copy of PortfolioHolding
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fundId = null,Object? fundName = null,Object? currentValue = null,Object? dailyChange = null,Object? dailyChangePercent = null,Object? profitLoss = null,Object? profitLossPercent = null,}) {
  return _then(_PortfolioHolding(
fundId: null == fundId ? _self.fundId : fundId // ignore: cast_nullable_to_non_nullable
as String,fundName: null == fundName ? _self.fundName : fundName // ignore: cast_nullable_to_non_nullable
as String,currentValue: null == currentValue ? _self.currentValue : currentValue // ignore: cast_nullable_to_non_nullable
as double,dailyChange: null == dailyChange ? _self.dailyChange : dailyChange // ignore: cast_nullable_to_non_nullable
as double,dailyChangePercent: null == dailyChangePercent ? _self.dailyChangePercent : dailyChangePercent // ignore: cast_nullable_to_non_nullable
as double,profitLoss: null == profitLoss ? _self.profitLoss : profitLoss // ignore: cast_nullable_to_non_nullable
as double,profitLossPercent: null == profitLossPercent ? _self.profitLossPercent : profitLossPercent // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
