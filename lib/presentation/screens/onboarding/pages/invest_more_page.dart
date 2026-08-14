import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_app/core/constant/text_styles.dart';
import 'package:new_app/core/utils/formatters.dart';
import 'package:new_app/data/local/onboarding_data.dart';
import 'package:new_app/presentation/blocs/onboarding/onboarding_bloc.dart';
import 'package:new_app/presentation/blocs/onboarding/onboarding_event_state.dart';
import 'package:new_app/presentation/screens/onboarding/shared/onboarding_widgets.dart';
import 'package:new_app/presentation/widgets/onboarding/neev_outline_button.dart';

class InvestMorePage extends StatelessWidget {
  const InvestMorePage({super.key, required this.state, required this.bloc});

  final OnboardingState state;
  final OnboardingBloc bloc;

  @override
  Widget build(BuildContext context) {
    if (state.investConfirmed) {
      return _InvestSuccess(state: state, bloc: bloc);
    }

    return OnboardingPage(
      bottom: NeevOutlineButton(
        title: 'Confirm investment',
        filled: true,
        enabled: bloc.investValid,
        onTap: () => bloc.add(const OnboardingEvent.confirmInvestMore()),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PageIntro(
            eyebrow: 'Lump sum',
            title: 'Invest more',
            subtitle: 'Add a one-time amount to any fund in your portfolio.',
          ),
          const SizedBox(height: 20),
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FieldLabel('Amount'),
                ChipWrap(
                  options: extraAmountOptions,
                  selectedId: state.investAmountId,
                  onSelected: (id) =>
                      bloc.add(OnboardingEvent.investAmountSelected(id)),
                ),
                if (state.investAmountId == 'custom') ...[
                  const SizedBox(height: 12),
                  NeevTextField(
                    value: state.investCustomAmount,
                    hint: 'Amount in ₹',
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (v) =>
                        bloc.add(OnboardingEvent.investCustomAmountChanged(v)),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 18),
          const FieldLabel('Choose fund'),
          for (final key in fundKeys)
            FundRecCard(
              fundKey: key,
              pct: 0,
              selected: state.investFundKey == key,
              onTap: () =>
                  bloc.add(OnboardingEvent.investFundSelected(key)),
            ),
        ],
      ),
    );
  }
}

class _InvestSuccess extends StatelessWidget {
  const _InvestSuccess({required this.state, required this.bloc});

  final OnboardingState state;
  final OnboardingBloc bloc;

  @override
  Widget build(BuildContext context) {
    final fund = fundTemplates[state.lastInvestFundKey ?? 'equity']!;

    return OnboardingPage(
      bottom: Column(
        children: [
          NeevOutlineButton(
            title: 'Invest more',
            onTap: () => bloc.add(const OnboardingEvent.investAgain()),
          ),
          const SizedBox(height: 10),
          NeevOutlineButton(
            title: 'View portfolio',
            filled: true,
            onTap: () => bloc.add(const OnboardingEvent.goToDashboard()),
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 24),
          const SuccessBadge(),
          const SizedBox(height: 20),
          Text('Investment added', style: TextStyles.heading2),
          const SizedBox(height: 8),
          Text(
            '${Formatters.currency(state.lastInvestAmount ?? 0)} added to ${fund.name}.',
            style: TextStyles.body,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          AppCard(
            child: Column(
              children: [
                SummaryRow(
                  label: 'Amount',
                  value: Formatters.currency(state.lastInvestAmount ?? 0),
                ),
                SummaryRow(label: 'Fund', value: fund.name),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

