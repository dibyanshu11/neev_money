enum NotificationKind {
  sip,
  goal,
  market,
  kyc,
  security,
  promo,
}

class AppNotification {
  const AppNotification({
    required this.id,
    required this.kind,
    required this.title,
    required this.body,
    required this.timeLabel,
    this.unread = false,
  });

  final String id;
  final NotificationKind kind;
  final String title;
  final String body;
  final String timeLabel;
  final bool unread;

  AppNotification copyWith({bool? unread}) {
    return AppNotification(
      id: id,
      kind: kind,
      title: title,
      body: body,
      timeLabel: timeLabel,
      unread: unread ?? this.unread,
    );
  }
}

/// Demo inbox for the notifications screen.
class NotificationMock {
  NotificationMock._();

  static const samples = <AppNotification>[
    AppNotification(
      id: '1',
      kind: NotificationKind.sip,
      title: 'SIP due tomorrow',
      body: '₹5,000 will be debited for Parag Parikh Flexi Cap on 11 Apr.',
      timeLabel: '2h ago',
      unread: true,
    ),
    AppNotification(
      id: '2',
      kind: NotificationKind.goal,
      title: 'Home goal on track',
      body: 'You’re 12% closer this quarter. Keep your SIP running.',
      timeLabel: '5h ago',
      unread: true,
    ),
    AppNotification(
      id: '3',
      kind: NotificationKind.market,
      title: 'Markets closed higher',
      body: 'Nifty +0.8%. Your equity sleeve is up about ₹1,240 today.',
      timeLabel: 'Yesterday',
      unread: true,
    ),
    AppNotification(
      id: '4',
      kind: NotificationKind.kyc,
      title: 'KYC reminder',
      body: 'Finish e-sign to start investing without delays.',
      timeLabel: 'Yesterday',
    ),
    AppNotification(
      id: '5',
      kind: NotificationKind.security,
      title: 'New sign-in',
      body:
          'We noticed a login from this device. If that wasn’t you, lock the app.',
      timeLabel: '3 days ago',
    ),
    AppNotification(
      id: '6',
      kind: NotificationKind.promo,
      title: 'Tax-saving tip',
      body: 'ELSS SIPs can help with Section 80C — explore funds when ready.',
      timeLabel: '1 week ago',
    ),
  ];

  static List<AppNotification> items = List<AppNotification>.from(samples);
}
