import 'package:flutter/material.dart';
import 'package:new_app/core/constant/app_colors.dart';
import 'package:new_app/core/constant/text_styles.dart';
import 'package:new_app/core/constant/app_icon_sizes.dart';
import 'package:new_app/core/utils/greeting.dart';
import 'package:new_app/core/utils/platform_icons.dart';
import 'package:new_app/data/local/user_prefs.dart';
import 'package:new_app/data/local/watchlist_storage.dart';
import 'package:new_app/presentation/screens/account/edit_profile_screen.dart';
import 'package:new_app/presentation/screens/account/privacy_policy_screen.dart';
import 'package:new_app/presentation/screens/account/transactions_screen.dart';
import 'package:new_app/presentation/screens/explore/watchlist_screen.dart';
import 'package:new_app/presentation/widgets/app_dialogs.dart';
import 'package:new_app/presentation/widgets/custom_bottom_nav.dart';
import 'package:new_app/router/route_manager.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  static const _pageBg = Color(0xFFF5F5F5);

  String _name = '';
  String _email = '';
  String _phone = '';
  bool _emailVerified = false;
  bool _loading = true;

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
    if (!mounted) return;
    setState(() {
      _name = name.isNotEmpty ? name : 'Investor';
      _email = email;
      _phone = phone;
      _emailVerified = verified;
      _loading = false;
    });
  }

  Future<void> _openEdit() async {
    final updated = await Navigator.push<bool>(
      context,
      MaterialPageRoute(builder: (_) => const EditProfileScreen()),
    );
    if (updated == true || mounted) await _load();
  }

  Future<void> _deleteAccount() async {
    final confirmed = await showDeleteAccountConfirmDialog(context);
    if (!confirmed || !mounted) return;
    await UserPrefs.instance.clearProfile();
    await WatchlistStorage.instance.clear();
    if (!mounted) return;
    NavigateTo.splash(context);
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: TextStyles.overline.copyWith(
          color: AppColors.textMuted,
          letterSpacing: 1.2,
          fontSize: 12,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: _pageBg,
      child: SafeArea(
        bottom: false,
        child: _loading
            ? const Center(
                child: AppProgress(color: AppColors.primary),
              )
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.fromLTRB(
                  20,
                  16,
                  20,
                  CustomBottomNav.scrollBottomInset(context),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profile — matches design: avatar · name · email · KYC
                    Material(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20),
                      elevation: 0,
                      shadowColor: Colors.black.withValues(alpha: 0.06),
                      child: InkWell(
                        onTap: _openEdit,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
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
                          child: Row(
                            children: [
                              Container(
                                width: 56,
                                height: 56,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Text(
                                  GreetingHelper.initialsFor(_name),
                                  style: TextStyles.bodyBold.copyWith(
                                    color: AppColors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(_name, style: TextStyles.sectionTitle),
                                    const SizedBox(height: 4),
                                    Text(
                                      _email.isNotEmpty
                                          ? _email
                                          : (_phone.isNotEmpty
                                              ? '+91 $_phone'
                                              : 'Add email in profile'),
                                      style: TextStyles.caption.copyWith(
                                        color: AppColors.textMuted,
                                        fontSize: 13,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        color: _emailVerified
                                            ? AppColors.success
                                            : AppColors.secondarySoft,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          if (_emailVerified) ...[
                                            AppIcon(
                                              AppIcons.checkPlain(),
                                              size: 12,
                                              color: AppColors.white,
                                            ),
                                            const SizedBox(width: 5),
                                          ],
                                          Text(
                                            _emailVerified
                                                ? 'KYC verified'
                                                : 'KYC pending',
                                            style: TextStyles.caption.copyWith(
                                              color: _emailVerified
                                                  ? AppColors.white
                                                  : AppColors.secondaryDark,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 11,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
                    _sectionTitle('ACCOUNT INFORMATION'),
                    _MenuGroup(
                      items: [
                        _MenuEntry(
                          icon: AppIcons.bank(),
                          title: 'Bank & mandates',
                        ),
                        _MenuEntry(
                          icon: AppIcons.people(),
                          title: 'Nominee',
                          trailing: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.secondarySoft,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Add',
                              style: TextStyles.caption.copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 11,
                                color: AppColors.secondaryDark,
                              ),
                            ),
                          ),
                        ),
                        _MenuEntry(
                          icon: AppIcons.notifications(),
                          title: 'Notifications',
                          onTap: () => NavigateTo.notifications(context),
                        ),
                        _MenuEntry(
                          icon: AppIcons.favorite(),
                          title: 'Wishlist',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const WatchlistScreen(),
                              ),
                            );
                          },
                        ),
                        _MenuEntry(
                          icon: AppIcons.history(),
                          title: 'Activity',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const TransactionsScreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    _sectionTitle('REPORTS'),
                    _MenuGroup(
                      items: [
                        _MenuEntry(
                          icon: AppIcons.receipt(),
                          title: 'Capital gains statement',
                        ),
                        _MenuEntry(
                          icon: AppIcons.chart(),
                          title: 'Download statement',
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    _sectionTitle('PRIVACY SETTINGS'),
                    _PrivacySettingsCard(
                      onPrivacyPolicy: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const PrivacyPolicyScreen(),
                          ),
                        );
                      },
                      onDeleteAccount: _deleteAccount,
                    ),
                    const SizedBox(height: 28),
                    Center(
                      child: Text(
                        'Neev Money v1.0 · JK Capital · ARN-XXXXXX',
                        style: TextStyles.caption.copyWith(
                          color: AppColors.textMuted,
                          fontSize: 11,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: GestureDetector(
                        onTap: () async {
                          final confirmed =
                              await showLogoutConfirmDialog(context);
                          if (confirmed && context.mounted) {
                            await UserPrefs.instance.clearProfile();
                            if (context.mounted) NavigateTo.splash(context);
                          }
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AppIcon(
                              AppIcons.logout(),
                              color: AppColors.error,
                              size: AppIconSizes.sm,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Log out',
                              style: TextStyles.bodyBold.copyWith(
                                color: AppColors.error,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class _PrivacySettingsCard extends StatefulWidget {
  const _PrivacySettingsCard({
    required this.onPrivacyPolicy,
    required this.onDeleteAccount,
  });

  final VoidCallback onPrivacyPolicy;
  final VoidCallback onDeleteAccount;

  @override
  State<_PrivacySettingsCard> createState() => _PrivacySettingsCardState();
}

class _PrivacySettingsCardState extends State<_PrivacySettingsCard> {
  bool _biometric = false;
  bool _ready = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final enabled = await UserPrefs.instance.getBiometricEnabled();
    if (!mounted) return;
    setState(() {
      _biometric = enabled;
      _ready = true;
    });
  }

  Future<void> _toggleBiometric(bool value) async {
    final confirmed = await showBiometricConfirmDialog(
      context,
      enabling: value,
    );
    if (!confirmed || !mounted) return;
    await UserPrefs.instance.setBiometricEnabled(value);
    if (!mounted) return;
    setState(() => _biometric = value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
        children: [
          InkWell(
            onTap: widget.onPrivacyPolicy,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                children: [
                  _IconBox(icon: AppIcons.privacy()),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      'Privacy policy',
                      style: TextStyles.bodyBold.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  AppIcon(
                    AppIcons.chevronRight(),
                    color: AppColors.textMuted,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
          const Divider(height: 1, thickness: 1, indent: 70, color: AppColors.divider),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                _IconBox(icon: AppIcons.biometric()),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        isCupertinoPlatform
                            ? 'Face ID / Touch ID'
                            : 'Biometric unlock',
                        style: TextStyles.bodyBold.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Unlock the app faster next time',
                        style: TextStyles.caption.copyWith(
                          color: AppColors.textMuted,
                        ),
                      ),
                    ],
                  ),
                ),
                if (_ready)
                  AppSwitch(
                    value: _biometric,
                    onChanged: _toggleBiometric,
                    activeColor: AppColors.primary,
                  )
                else
                  const SizedBox(
                    width: 24,
                    height: 24,
                    child: AppProgress.button(color: AppColors.primary),
                  ),
              ],
            ),
          ),
          const Divider(height: 1, thickness: 1, indent: 70, color: AppColors.divider),
          InkWell(
            onTap: widget.onDeleteAccount,
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                children: [
                  _IconBox(
                    icon: AppIcons.delete(),
                    color: AppColors.error,
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      'Delete account',
                      style: TextStyles.bodyBold.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppColors.error,
                      ),
                    ),
                  ),
                  AppIcon(
                    AppIcons.chevronRight(),
                    color: AppColors.textMuted,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _IconBox extends StatelessWidget {
  const _IconBox({required this.icon, this.color});

  final AppIconSpec icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final c = color ?? AppColors.primary;
    return Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.chipSelectedBg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: AppIcon(icon, color: c, size: AppIconSizes.md),
    );
  }
}

class _MenuEntry {
  const _MenuEntry({
    required this.icon,
    required this.title,
    this.trailing,
    this.onTap,
  });

  final AppIconSpec icon;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;
}

class _MenuGroup extends StatelessWidget {
  const _MenuGroup({required this.items});

  final List<_MenuEntry> items;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        children: List.generate(items.length, (index) {
          final item = items[index];
          final isLast = index == items.length - 1;

          return Column(
            children: [
              InkWell(
                onTap: item.onTap,
                borderRadius: BorderRadius.vertical(
                  top: index == 0 ? const Radius.circular(20) : Radius.zero,
                  bottom: isLast ? const Radius.circular(20) : Radius.zero,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.chipSelectedBg,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: AppIcon(
                          item.icon,
                          color: AppColors.primary,
                          size: AppIconSizes.md,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Text(
                          item.title,
                          style: TextStyles.bodyBold.copyWith(
                            fontSize: 15,
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      if (item.trailing != null)
                        item.trailing!
                      else
                        AppIcon(
                          AppIcons.chevronRight(),
                          color: AppColors.textMuted,
                          size: 20,
                        ),
                    ],
                  ),
                ),
              ),
              if (!isLast)
                const Divider(
                  height: 1,
                  thickness: 1,
                  indent: 70,
                  color: AppColors.divider,
                ),
            ],
          );
        }),
      ),
    );
  }
}
