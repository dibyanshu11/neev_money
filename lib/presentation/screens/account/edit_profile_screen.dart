import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_app/core/constants/app_colors.dart';
import 'package:new_app/core/constants/text_styles.dart';
import 'package:new_app/core/utils/platform_icons.dart';
import 'package:new_app/data/datasources/local/user_prefs.dart';
import 'package:new_app/presentation/widgets/app_back_button.dart';
import 'package:new_app/presentation/widgets/app_button.dart';
import 'package:new_app/core/utils/toast_utils.dart';

/// Edit personal information — name, email (with verify), phone.
class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  static const _pageBg = Color(0xFFF5F5F5);

  final _name = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  String _savedEmail = '';
  bool _emailVerified = false;
  bool _loading = true;
  bool _saving = false;
  bool _verifying = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final prefs = UserPrefs.instance;
    final name = await prefs.getName();
    final email = await prefs.getEmail();
    final phone = await prefs.getPhone();
    final verified = await prefs.isEmailVerified();
    _name.text = name;
    _email.text = email;
    _phone.text = phone;
    _savedEmail = email;
    _emailVerified = verified;
    if (mounted) setState(() => _loading = false);
  }

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _phone.dispose();
    super.dispose();
  }

  bool get _validEmail {
    final e = _email.text.trim();
    return e.contains('@') && e.contains('.');
  }

  bool get _valid =>
      _name.text.trim().length > 1 &&
      _phone.text.replaceAll(RegExp(r'\D'), '').length == 10 &&
      (_email.text.trim().isEmpty || _validEmail);

  bool get _needsVerify =>
      _validEmail &&
      (!_emailVerified ||
          _email.text.trim().toLowerCase() != _savedEmail.toLowerCase());

  Future<void> _save() async {
    if (!_valid || _saving) return;
    if (_needsVerify) {
      ToastUtils.showToast(
        context,
        message: 'Please verify your email before saving.',
        type: ToastType.warning,
      );
      return;
    }
    setState(() => _saving = true);
    await Future<void>.delayed(const Duration(milliseconds: 600));
    await UserPrefs.instance.saveProfile(
      name: _name.text,
      email: _email.text,
      phone: _phone.text,
    );
    await UserPrefs.instance.setEmailVerified(_emailVerified);
    if (!mounted) return;
    setState(() => _saving = false);
    ToastUtils.showToast(
      context,
      message: 'Personal information updated',
      type: ToastType.success,
    );
    Navigator.pop(context, true);
  }

  Future<void> _verifyEmail() async {
    if (!_validEmail || _verifying) return;
    setState(() => _verifying = true);
    await Future<void>.delayed(const Duration(milliseconds: 500));
    if (!mounted) return;
    setState(() => _verifying = false);

    final email = _email.text.trim();
    final ok = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => _EmailVerifySheet(email: email),
    );

    if (ok == true && mounted) {
      await UserPrefs.instance.setEmail(
        email,
        verified: true,
      );
      if (!mounted) return;
      setState(() {
        _emailVerified = true;
        _savedEmail = email;
      });
      ToastUtils.showToast(
        context,
        message: 'Email verified',
        type: ToastType.success,
      );
    }
  }

  InputDecoration _decoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyles.body.copyWith(
        color: AppColors.textMuted.withValues(alpha: 0.75),
      ),

      filled: true,
      fillColor: AppColors.surfaceMuted,

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(
          color: AppColors.primary.withValues(alpha: 0.20),
          width: 1.1,
        ),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(
          color: AppColors.primary.withValues(alpha: 0.30),
          width: 1.1,
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(
          color: AppColors.primary.withValues(alpha: 0.55),
          width: 1.5,
        ),
      ),

      contentPadding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 14,
      ),
    );
  }

  Widget _label(String text) {
    return Text(
      text.toUpperCase(),
      style: TextStyles.caption.copyWith(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.8,
        fontSize: 11,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _pageBg,
      appBar: AppBar(
        backgroundColor: _pageBg,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: appBarLeading(context),
        title: Text('Edit profile', style: appBarTitleStyle),
        centerTitle: true,
      ),
      body: _loading
          ? const Center(
              child: AppProgress(color: AppColors.primary),
            )
          : Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _name.text.trim().isEmpty
                              ? 'Your details'
                              : _name.text.trim(),
                          style: TextStyles.heading2.copyWith(fontSize: 22),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Update how we reach you for SIPs and statements.',
                          style: TextStyles.body.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.04),
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _label('Full name'),
                              const SizedBox(height: 8),
                              TextField(
                                controller: _name,
                                onChanged: (_) => setState(() {}),
                                style:
                                    TextStyles.bodyBold.copyWith(fontSize: 15),
                                textCapitalization: TextCapitalization.words,
                                decoration: _decoration('As per PAN'),
                              ),
                              const SizedBox(height: 18),
                              _label('Email'),
                              const SizedBox(height: 8),
                              TextField(
                                controller: _email,
                                onChanged: (_) {
                                  final changed =
                                      _email.text.trim().toLowerCase() !=
                                          _savedEmail.toLowerCase();
                                  setState(() {
                                    if (changed) _emailVerified = false;
                                  });
                                },
                                keyboardType: TextInputType.emailAddress,
                                style:
                                    TextStyles.bodyBold.copyWith(fontSize: 15),
                                decoration: _decoration('you@email.com'),
                              ),
                              const SizedBox(height: 10),
                              if (_emailVerified && !_needsVerify)
                                Container(
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
                                        size: 12,
                                        color: AppColors.white,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        'Email verified',
                                        style: TextStyles.caption.copyWith(
                                          color: AppColors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              else
                                TextButton(
                                  onPressed: _validEmail && !_verifying
                                      ? _verifyEmail
                                      : null,
                                  style: TextButton.styleFrom(
                                    foregroundColor: AppColors.primary,
                                    padding: EdgeInsets.zero,
                                    minimumSize: Size.zero,
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  child: Text(
                                    _verifying
                                        ? 'Sending code…'
                                        : 'Verify email',
                                    style: TextStyles.bodyBold.copyWith(
                                      color: AppColors.primary,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              const SizedBox(height: 18),
                              _label('Mobile number'),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Container(
                                    height: 50,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 14,
                                    ),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: AppColors.surfaceMuted,
                                      borderRadius: BorderRadius.circular(14),
                                      border: Border.all(
                                        color: AppColors.primary.withValues(alpha: 0.30),
                                        width: 1.1,
                                      ),
                                    ),
                                    child: Text(
                                      '+91',
                                      style: TextStyles.bodyBold.copyWith(
                                        color: AppColors.textPrimary,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: TextField(
                                      controller: _phone,
                                      keyboardType: TextInputType.phone,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        LengthLimitingTextInputFormatter(10),
                                      ],
                                      onChanged: (_) => setState(() {}),
                                      style: TextStyles.bodyBold
                                          .copyWith(fontSize: 15),
                                      decoration: _decoration('98765 43210'),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 14),
                        Text(
                          'Name and number come from sign-up. Verify email for statements and SIP alerts.',
                          style: TextStyles.caption.copyWith(
                            color: AppColors.textMuted,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SafeArea(
                  top: false,
                  child: Container(
                    color: _pageBg,
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
                    child: AppButton(
                      title: 'Save changes',
                      isLoading: _saving,
                      enabled: _valid && !_needsVerify,
                      onTap: _save,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

class _EmailVerifySheet extends StatefulWidget {
  const _EmailVerifySheet({required this.email});

  final String email;

  @override
  State<_EmailVerifySheet> createState() => _EmailVerifySheetState();
}

class _EmailVerifySheetState extends State<_EmailVerifySheet> {
  final _codeCtrl = TextEditingController();

  @override
  void dispose() {
    _codeCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;

    return Padding(
      padding: EdgeInsets.fromLTRB(20, 12, 20, 16 + bottomInset),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: AppColors.border,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            Text('Verify email', style: TextStyles.heading3),
            const SizedBox(height: 8),
            Text(
              'Enter the 6-digit code sent to ${widget.email}',
              style: TextStyles.body.copyWith(color: AppColors.textSecondary),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _codeCtrl,
              keyboardType: TextInputType.number,
              maxLength: 6,
              autofocus: true,
              onChanged: (_) => setState(() {}),
              style: TextStyles.bodyBold.copyWith(
                fontSize: 22,
                letterSpacing: 8,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(6),
              ],
              decoration: InputDecoration(
                hintText: '••••••',
                counterText: '',
                filled: true,
                fillColor: AppColors.surfaceMuted,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(
                    color: AppColors.primary,
                    width: 1.5,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Demo: use any 6 digits',
              style: TextStyles.caption.copyWith(color: AppColors.textMuted),
            ),
            const SizedBox(height: 16),
            AppButton(
              title: 'Confirm email',
              enabled: _codeCtrl.text.length == 6,
              onTap: () => Navigator.pop(context, true),
            ),
          ],
        ),
      ),
    );
  }
}
