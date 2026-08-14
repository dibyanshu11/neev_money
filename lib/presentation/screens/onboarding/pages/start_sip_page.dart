import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_app/core/constant/text_styles.dart';
import 'package:new_app/core/utils/formatters.dart';
import 'package:new_app/core/utils/platform_icons.dart';
import 'package:new_app/data/local/onboarding_data.dart';
import 'package:new_app/presentation/blocs/onboarding/onboarding_bloc.dart';
import 'package:new_app/presentation/blocs/onboarding/onboarding_event_state.dart';
import 'package:new_app/presentation/screens/onboarding/shared/onboarding_widgets.dart';
import 'package:new_app/presentation/widgets/onboarding/neev_outline_button.dart';

class StartSipPage extends StatelessWidget {
  const StartSipPage({super.key, required this.state, required this.bloc});

  final OnboardingState state;
  final OnboardingBloc bloc;

  @override
  Widget build(BuildContext context) {
    if (state.sipJustConfirmed && state.sip != null) {
      return _SipSuccess(state: state, bloc: bloc);
    }

    return OnboardingPage(
      bottom: NeevOutlineButton(
        title: 'Start SIP',
        filled: true,
        enabled: bloc.sipValid,
        onTap: () => bloc.add(const OnboardingEvent.confirmSip()),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PageIntro(
            eyebrow: 'Automation',
            title: 'Start a SIP',
            subtitle: 'Invest automatically every month — set once, stay consistent.',
          ),
          const SizedBox(height: 20),
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FieldLabel('Monthly amount'),
                ChipWrap(
                  options: sipAmountOptions,
                  selectedId: state.sipAmountId,
                  onSelected: (id) =>
                      bloc.add(OnboardingEvent.sipAmountSelected(id)),
                ),
                if (state.sipAmountId == 'custom') ...[
                  const SizedBox(height: 12),
                  NeevTextField(
                    value: state.sipCustomAmount,
                    hint: 'Amount in ₹',
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (v) =>
                        bloc.add(OnboardingEvent.sipCustomAmountChanged(v)),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 18),
          const FieldLabel('Fund'),
          for (final key in fundKeys)
            FundRecCard(
              fundKey: key,
              pct: 0,
              selected: state.sipFundKey == key,
              onTap: () => bloc.add(OnboardingEvent.sipFundSelected(key)),
            ),
          const SizedBox(height: 8),
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FieldLabel('Debit date'),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    for (final date in sipDateOptions)
                      NeevChip(
                        label: date,
                        selected: state.sipDate == date,
                        onTap: () =>
                            bloc.add(OnboardingEvent.sipDateSelected(date)),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SipSuccess extends StatelessWidget {
  const _SipSuccess({required this.state, required this.bloc});

  final OnboardingState state;
  final OnboardingBloc bloc;

  @override
  Widget build(BuildContext context) {
    final sip = state.sip!;
    final fund = fundTemplates[sip.fundKey]!;

    return OnboardingPage(
      bottom: Column(
        children: [
          NeevOutlineButton(
            title: 'Edit SIP',
            onTap: () => bloc.add(const OnboardingEvent.editSip()),
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
          SuccessBadge(icon: AppIcons.sip()),
          const SizedBox(height: 20),
          Text('SIP started', style: TextStyles.heading2),
          const SizedBox(height: 8),
          Text(
            '${Formatters.currency(sip.amount)} will be debited on the ${sip.date} of every month into ${fund.name}.',
            style: TextStyles.body,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          AppCard(
            child: Column(
              children: [
                SummaryRow(
                  label: 'Amount',
                  value: '${Formatters.currency(sip.amount)}/mo',
                ),
                SummaryRow(label: 'Fund', value: fund.name),
                SummaryRow(label: 'Date', value: sip.date),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

