import 'package:flutter/material.dart';
import 'package:new_app/core/constants/app_colors.dart';
import 'package:new_app/core/constants/app_icon_sizes.dart';
import 'package:new_app/core/constants/text_styles.dart';
import 'package:new_app/core/utils/platform_icons.dart';
import 'package:new_app/data/datasources/local/notification_mock.dart';
import 'package:new_app/presentation/widgets/app_back_button.dart';
import 'package:new_app/presentation/widgets/app_dialogs.dart';
import 'package:new_app/core/utils/toast_utils.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  late List<AppNotification> _items;

  @override
  void initState() {
    super.initState();
    _items = List<AppNotification>.from(NotificationMock.items);
  }

  int get _unreadCount => _items.where((n) => n.unread).length;

  void _markAllRead() {
    setState(() {
      _items = _items.map((n) => n.copyWith(unread: false)).toList();
      NotificationMock.items = _items;
    });
    ToastUtils.showToast(
      context,
      message: 'All caught up',
      type: ToastType.success,
    );
  }

  void _openItem(int index) {
    final item = _items[index];
    setState(() {
      _items[index] = item.copyWith(unread: false);
      NotificationMock.items = _items;
    });
  }

  Future<void> _clearAll() async {
    final ok = await showAppConfirmDialog(
      context,
      title: 'Clear all?',
      message: 'Remove every notification from your inbox.',
      confirmLabel: 'Clear',
      cancelLabel: 'Keep',
      isDestructive: true,
    );
    if (!ok || !mounted) return;
    setState(() {
      _items = [];
      NotificationMock.items = _items;
    });
  }

  void _restoreSamples() {
    setState(() {
      _items = List<AppNotification>.from(NotificationMock.samples);
      NotificationMock.items = _items;
    });
  }

  AppIconSpec _iconFor(NotificationKind kind) => switch (kind) {
        NotificationKind.sip => AppIcons.sip(),
        NotificationKind.goal => AppIcons.goals(),
        NotificationKind.market => AppIcons.trendingUp(),
        NotificationKind.kyc => AppIcons.verified(),
        NotificationKind.security => AppIcons.lock(),
        NotificationKind.promo => AppIcons.notifications(),
      };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        leading: appBarLeading(context),
        title: Text('Notifications', style: appBarTitleStyle),
        actions: [
          if (_unreadCount > 0)
            TextButton(
              onPressed: _markAllRead,
              child: Text(
                'Read all',
                style: TextStyles.caption.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
        ],
      ),
      body: _items.isEmpty
          ? _EmptyInbox(onRefresh: _restoreSamples)
          : ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
              itemCount: _items.length + 1,
              separatorBuilder: (_, i) =>
                  i >= _items.length - 1 ? const SizedBox(height: 8) : const SizedBox(height: 10),
              itemBuilder: (context, index) {
                if (index == _items.length) {
                  return Center(
                    child: TextButton(
                      onPressed: _clearAll,
                      child: Text(
                        'Clear all',
                        style: TextStyles.caption.copyWith(
                          color: AppColors.textMuted,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                }
                final n = _items[index];
                return _NotificationTile(
                  item: n,
                  icon: _iconFor(n.kind),
                  onTap: () => _openItem(index),
                );
              },
            ),
    );
  }
}

class _NotificationTile extends StatelessWidget {
  const _NotificationTile({
    required this.item,
    required this.icon,
    required this.onTap,
  });

  final AppNotification item;
  final AppIconSpec icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final unread = item.unread;

    return Material(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.cardBorder),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 44,
                height: 44,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.chipSelectedBg,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: AppIcon(
                  icon,
                  color: AppColors.primary,
                  size: AppIconSizes.md,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            item.title,
                            style: TextStyles.bodyBold.copyWith(
                              fontSize: 15,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ),
                        if (unread)
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: AppColors.secondary,
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.body,
                      style: TextStyles.body.copyWith(
                        color: AppColors.textSecondary,
                        height: 1.4,
                        fontSize: 13,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item.timeLabel,
                      style: TextStyles.caption.copyWith(
                        color: AppColors.textMuted,
                        fontWeight: FontWeight.w600,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmptyInbox extends StatelessWidget {
  const _EmptyInbox({required this.onRefresh});

  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 72,
              height: 72,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.chipSelectedBg,
                borderRadius: BorderRadius.circular(20),
              ),
              child: AppIcon(
                AppIcons.notifications(),
                size: AppIconSizes.xl,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 18),
            Text(
              'You’re all caught up',
              style: TextStyles.heading3,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'SIP reminders and goal updates will show up here.',
              style: TextStyles.body.copyWith(
                color: AppColors.textMuted,
                height: 1.45,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: onRefresh,
              child: Text(
                'Show sample alerts',
                style: TextStyles.bodyBold.copyWith(color: AppColors.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
