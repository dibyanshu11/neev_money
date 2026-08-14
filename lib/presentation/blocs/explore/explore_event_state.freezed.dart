// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'explore_event_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExploreEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExploreEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExploreEvent()';
}


}

/// @nodoc
class $ExploreEventCopyWith<$Res>  {
$ExploreEventCopyWith(ExploreEvent _, $Res Function(ExploreEvent) __);
}


/// Adds pattern-matching-related methods to [ExploreEvent].
extension ExploreEventPatterns on ExploreEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadExplore value)?  load,TResult Function( FilterChanged value)?  filterChanged,TResult Function( SearchChanged value)?  searchChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadExplore() when load != null:
return load(_that);case FilterChanged() when filterChanged != null:
return filterChanged(_that);case SearchChanged() when searchChanged != null:
return searchChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadExplore value)  load,required TResult Function( FilterChanged value)  filterChanged,required TResult Function( SearchChanged value)  searchChanged,}){
final _that = this;
switch (_that) {
case LoadExplore():
return load(_that);case FilterChanged():
return filterChanged(_that);case SearchChanged():
return searchChanged(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadExplore value)?  load,TResult? Function( FilterChanged value)?  filterChanged,TResult? Function( SearchChanged value)?  searchChanged,}){
final _that = this;
switch (_that) {
case LoadExplore() when load != null:
return load(_that);case FilterChanged() when filterChanged != null:
return filterChanged(_that);case SearchChanged() when searchChanged != null:
return searchChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,TResult Function( String category)?  filterChanged,TResult Function( String query)?  searchChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadExplore() when load != null:
return load();case FilterChanged() when filterChanged != null:
return filterChanged(_that.category);case SearchChanged() when searchChanged != null:
return searchChanged(_that.query);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,required TResult Function( String category)  filterChanged,required TResult Function( String query)  searchChanged,}) {final _that = this;
switch (_that) {
case LoadExplore():
return load();case FilterChanged():
return filterChanged(_that.category);case SearchChanged():
return searchChanged(_that.query);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,TResult? Function( String category)?  filterChanged,TResult? Function( String query)?  searchChanged,}) {final _that = this;
switch (_that) {
case LoadExplore() when load != null:
return load();case FilterChanged() when filterChanged != null:
return filterChanged(_that.category);case SearchChanged() when searchChanged != null:
return searchChanged(_that.query);case _:
  return null;

}
}

}

/// @nodoc


class LoadExplore implements ExploreEvent {
  const LoadExplore();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadExplore);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExploreEvent.load()';
}


}




/// @nodoc


class FilterChanged implements ExploreEvent {
  const FilterChanged(this.category);
  

 final  String category;

/// Create a copy of ExploreEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FilterChangedCopyWith<FilterChanged> get copyWith => _$FilterChangedCopyWithImpl<FilterChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FilterChanged&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,category);

@override
String toString() {
  return 'ExploreEvent.filterChanged(category: $category)';
}


}

/// @nodoc
abstract mixin class $FilterChangedCopyWith<$Res> implements $ExploreEventCopyWith<$Res> {
  factory $FilterChangedCopyWith(FilterChanged value, $Res Function(FilterChanged) _then) = _$FilterChangedCopyWithImpl;
@useResult
$Res call({
 String category
});




}
/// @nodoc
class _$FilterChangedCopyWithImpl<$Res>
    implements $FilterChangedCopyWith<$Res> {
  _$FilterChangedCopyWithImpl(this._self, this._then);

  final FilterChanged _self;
  final $Res Function(FilterChanged) _then;

/// Create a copy of ExploreEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = null,}) {
  return _then(FilterChanged(
null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SearchChanged implements ExploreEvent {
  const SearchChanged(this.query);
  

 final  String query;

/// Create a copy of ExploreEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchChangedCopyWith<SearchChanged> get copyWith => _$SearchChangedCopyWithImpl<SearchChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchChanged&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'ExploreEvent.searchChanged(query: $query)';
}


}

/// @nodoc
abstract mixin class $SearchChangedCopyWith<$Res> implements $ExploreEventCopyWith<$Res> {
  factory $SearchChangedCopyWith(SearchChanged value, $Res Function(SearchChanged) _then) = _$SearchChangedCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$SearchChangedCopyWithImpl<$Res>
    implements $SearchChangedCopyWith<$Res> {
  _$SearchChangedCopyWithImpl(this._self, this._then);

  final SearchChanged _self;
  final $Res Function(SearchChanged) _then;

/// Create a copy of ExploreEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(SearchChanged(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ExploreState {

 bool get isLoading; List<FundModel> get funds; List<FundModel> get filteredFunds; String get selectedFilter; String get searchQuery; String? get error;
/// Create a copy of ExploreState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExploreStateCopyWith<ExploreState> get copyWith => _$ExploreStateCopyWithImpl<ExploreState>(this as ExploreState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExploreState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.funds, funds)&&const DeepCollectionEquality().equals(other.filteredFunds, filteredFunds)&&(identical(other.selectedFilter, selectedFilter) || other.selectedFilter == selectedFilter)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(funds),const DeepCollectionEquality().hash(filteredFunds),selectedFilter,searchQuery,error);

@override
String toString() {
  return 'ExploreState(isLoading: $isLoading, funds: $funds, filteredFunds: $filteredFunds, selectedFilter: $selectedFilter, searchQuery: $searchQuery, error: $error)';
}


}

/// @nodoc
abstract mixin class $ExploreStateCopyWith<$Res>  {
  factory $ExploreStateCopyWith(ExploreState value, $Res Function(ExploreState) _then) = _$ExploreStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, List<FundModel> funds, List<FundModel> filteredFunds, String selectedFilter, String searchQuery, String? error
});




}
/// @nodoc
class _$ExploreStateCopyWithImpl<$Res>
    implements $ExploreStateCopyWith<$Res> {
  _$ExploreStateCopyWithImpl(this._self, this._then);

  final ExploreState _self;
  final $Res Function(ExploreState) _then;

/// Create a copy of ExploreState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? funds = null,Object? filteredFunds = null,Object? selectedFilter = null,Object? searchQuery = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,funds: null == funds ? _self.funds : funds // ignore: cast_nullable_to_non_nullable
as List<FundModel>,filteredFunds: null == filteredFunds ? _self.filteredFunds : filteredFunds // ignore: cast_nullable_to_non_nullable
as List<FundModel>,selectedFilter: null == selectedFilter ? _self.selectedFilter : selectedFilter // ignore: cast_nullable_to_non_nullable
as String,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ExploreState].
extension ExploreStatePatterns on ExploreState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExploreState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExploreState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExploreState value)  $default,){
final _that = this;
switch (_that) {
case _ExploreState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExploreState value)?  $default,){
final _that = this;
switch (_that) {
case _ExploreState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  List<FundModel> funds,  List<FundModel> filteredFunds,  String selectedFilter,  String searchQuery,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExploreState() when $default != null:
return $default(_that.isLoading,_that.funds,_that.filteredFunds,_that.selectedFilter,_that.searchQuery,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  List<FundModel> funds,  List<FundModel> filteredFunds,  String selectedFilter,  String searchQuery,  String? error)  $default,) {final _that = this;
switch (_that) {
case _ExploreState():
return $default(_that.isLoading,_that.funds,_that.filteredFunds,_that.selectedFilter,_that.searchQuery,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  List<FundModel> funds,  List<FundModel> filteredFunds,  String selectedFilter,  String searchQuery,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _ExploreState() when $default != null:
return $default(_that.isLoading,_that.funds,_that.filteredFunds,_that.selectedFilter,_that.searchQuery,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _ExploreState implements ExploreState {
  const _ExploreState({this.isLoading = false, final  List<FundModel> funds = const [], final  List<FundModel> filteredFunds = const [], this.selectedFilter = 'For you', this.searchQuery = '', this.error}): _funds = funds,_filteredFunds = filteredFunds;
  

@override@JsonKey() final  bool isLoading;
 final  List<FundModel> _funds;
@override@JsonKey() List<FundModel> get funds {
  if (_funds is EqualUnmodifiableListView) return _funds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_funds);
}

 final  List<FundModel> _filteredFunds;
@override@JsonKey() List<FundModel> get filteredFunds {
  if (_filteredFunds is EqualUnmodifiableListView) return _filteredFunds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_filteredFunds);
}

@override@JsonKey() final  String selectedFilter;
@override@JsonKey() final  String searchQuery;
@override final  String? error;

/// Create a copy of ExploreState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExploreStateCopyWith<_ExploreState> get copyWith => __$ExploreStateCopyWithImpl<_ExploreState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExploreState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._funds, _funds)&&const DeepCollectionEquality().equals(other._filteredFunds, _filteredFunds)&&(identical(other.selectedFilter, selectedFilter) || other.selectedFilter == selectedFilter)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(_funds),const DeepCollectionEquality().hash(_filteredFunds),selectedFilter,searchQuery,error);

@override
String toString() {
  return 'ExploreState(isLoading: $isLoading, funds: $funds, filteredFunds: $filteredFunds, selectedFilter: $selectedFilter, searchQuery: $searchQuery, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ExploreStateCopyWith<$Res> implements $ExploreStateCopyWith<$Res> {
  factory _$ExploreStateCopyWith(_ExploreState value, $Res Function(_ExploreState) _then) = __$ExploreStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, List<FundModel> funds, List<FundModel> filteredFunds, String selectedFilter, String searchQuery, String? error
});




}
/// @nodoc
class __$ExploreStateCopyWithImpl<$Res>
    implements _$ExploreStateCopyWith<$Res> {
  __$ExploreStateCopyWithImpl(this._self, this._then);

  final _ExploreState _self;
  final $Res Function(_ExploreState) _then;

/// Create a copy of ExploreState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? funds = null,Object? filteredFunds = null,Object? selectedFilter = null,Object? searchQuery = null,Object? error = freezed,}) {
  return _then(_ExploreState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,funds: null == funds ? _self._funds : funds // ignore: cast_nullable_to_non_nullable
as List<FundModel>,filteredFunds: null == filteredFunds ? _self._filteredFunds : filteredFunds // ignore: cast_nullable_to_non_nullable
as List<FundModel>,selectedFilter: null == selectedFilter ? _self.selectedFilter : selectedFilter // ignore: cast_nullable_to_non_nullable
as String,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
