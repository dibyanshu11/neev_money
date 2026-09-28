import 'package:flutter/material.dart';
import 'package:new_app/core/constants/app_colors.dart';
import 'package:new_app/core/constants/text_styles.dart';
import 'package:new_app/presentation/widgets/app_back_button.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text('Privacy policy', style: appBarTitleStyle),
        leading: appBarLeading(context),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        physics: const BouncingScrollPhysics(),
        children: [
          Text(
            'How Neev uses your information',
            style: TextStyles.heading3,
          ),
          const SizedBox(height: 10),
          Text(
            'We collect only what’s needed to open your account, complete KYC, and manage your investments.',
            style: TextStyles.body.copyWith(
              color: AppColors.textSecondary,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 20),
          _Section(
            title: 'What we collect',
            body:
                'Name, mobile number, email, and investment preferences you share while using the app.',
          ),
          _Section(
            title: 'How we use it',
            body:
                'To verify your identity, process SIPs and redemptions, send statements, and improve the product.',
          ),
          _Section(
            title: 'Sharing',
            body:
                'We may share data with regulated partners (banks, registrars, KYC agencies) only to provide investment services.',
          ),
          _Section(
            title: 'Your choices',
            body:
                'You can update profile details anytime, or request account deletion from Account → Delete account.',
          ),
          const SizedBox(height: 8),
          Text(
            'For questions, write to support@neev.money.',
            style: TextStyles.caption.copyWith(color: AppColors.textMuted),
          ),
        ],
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.cardBorder),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyles.bodyBold.copyWith(fontSize: 15)),
            const SizedBox(height: 6),
            Text(
              body,
              style: TextStyles.body.copyWith(
                color: AppColors.textSecondary,
                height: 1.45,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
