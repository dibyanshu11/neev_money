import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Wraps a screen with the standard Bloc pattern:
/// - [BlocListener] → errors / navigation (side effects)
/// - [BlocBuilder]  → UI from state
///
/// Keep navigation in [listener], keep painting in [builder].
class AppBlocView<B extends StateStreamable<S>, S> extends StatelessWidget {
  const AppBlocView({
    super.key,
    required this.listener,
    required this.builder,
    this.listenWhen,
    this.buildWhen,
  });

  final BlocWidgetListener<S> listener;
  final BlocWidgetBuilder<S> builder;
  final BlocListenerCondition<S>? listenWhen;
  final BlocBuilderCondition<S>? buildWhen;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<B, S>(
      listenWhen: listenWhen,
      listener: listener,
      buildWhen: buildWhen,
      builder: builder,
    );
  }
}
