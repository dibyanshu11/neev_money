import 'package:flutter/material.dart';
import 'package:new_app/core/constant/app_colors.dart';
import 'package:new_app/core/constant/text_styles.dart';
import 'package:new_app/core/constant/app_icon_sizes.dart';
import 'package:new_app/core/utils/platform_icons.dart';
import 'package:new_app/presentation/widgets/app_back_button.dart';
import 'package:new_app/presentation/widgets/app_button.dart';
import 'package:new_app/router/route_manager.dart';

/// Screen 9 — KYC details collected before Start SIP / Invest now.
class KycDetailsScreen extends StatefulWidget {
  const KycDetailsScreen({super.key, this.fundId});

  final String? fundId;

  @override
  State<KycDetailsScreen> createState() => _KycDetailsScreenState();
}

class _KycDetailsScreenState extends State<KycDetailsScreen> {
  final _pan = TextEditingController(text: 'ABCDE1234F');
  final _name = TextEditingController(text: 'Aarav Mehta');
  final _dob = TextEditingController(text: '14 Mar 1994');
  final _email = TextEditingController(text: 'aarav.mehta@gmail.com');
  String _gender = 'Male';

  @override
  void dispose() {
    _pan.dispose();
    _name.dispose();
    _dob.dispose();
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: Row(
                children: [
                  const AppBackButton(),
                  const Spacer(),
                  Row(
                    children: [
                      Container(
                        width: 28,
                        height: 4,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(width: 6),
                      for (var i = 0; i < 3; i++) ...[
                        Container(
                          width: 6,
                          height: 6,
                          decoration: const BoxDecoration(
                            color: AppColors.border,
                            shape: BoxShape.circle,
                          ),
                        ),
                        if (i < 2) const SizedBox(width: 6),
                      ],
                    ],
                  ),
                  const Spacer(),
                  const SizedBox(width: 40),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(22, 20, 22, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Just few details before we setup your account',
                      style: TextStyles.heading2,
                    ),
                    const SizedBox(height: 24),
                    const _FieldLabel('PAN'),
                    Stack(
                      children: [
                        _SoftField(controller: _pan),
                        Positioned(
                          right: 10,
                          top: 12,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.success,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                AppIcon(
                                  AppIcons.checkPlain(),
                                  size: AppIconSizes.xs,
                                  color: AppColors.white,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Verified',
                                  style: TextStyles.caption.copyWith(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const _FieldLabel('Full name'),
                    _SoftField(controller: _name),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const _FieldLabel('Date of birth'),
                              _SoftField(controller: _dob),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const _FieldLabel('Gender'),
                              Container(
                                height: 54,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 14),
                                decoration: BoxDecoration(
                                  color: AppColors.surfaceMuted,
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: _gender,
                                    isExpanded: true,
                                    items: const [
                                      DropdownMenuItem(
                                        value: 'Male',
                                        child: Text('Male'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'Female',
                                        child: Text('Female'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'Other',
                                        child: Text('Other'),
                                      ),
                                    ],
                                    onChanged: (v) {
                                      if (v != null) setState(() => _gender = v);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const _FieldLabel('Email'),
                    _SoftField(controller: _email),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 0, 22, 20),
              child: AppButton(
                title: 'Invest now',
                borderRadius: 28,
                padding: const EdgeInsets.symmetric(vertical: 18),
                onTap: () {
                  final fundId = widget.fundId ?? '1';
                  NavigateTo.startSip(context, fundId);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  const _FieldLabel(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text.toUpperCase(),
        style: TextStyles.label.copyWith(
          color: AppColors.textMuted,
          letterSpacing: 1,
          fontSize: 11,
        ),
      ),
    );
  }
}

class _SoftField extends StatelessWidget {
  const _SoftField({required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyles.bodyBold,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.surfaceMuted,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
      ),
    );
  }
}
