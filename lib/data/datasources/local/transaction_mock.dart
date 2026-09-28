import 'package:new_app/core/utils/formatters.dart';

enum TxnType { sip, oneTime, redeem, processing }

enum TxnStatus { allotted, credited, processing }

class TransactionItem {
  const TransactionItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.type,
    required this.amount,
    required this.date,
    required this.status,
  });

  final String id;
  final String title;
  final String subtitle;
  final TxnType type;
  final double amount;
  final DateTime date;
  final TxnStatus status;

  String get amountLabel => Formatters.currency(amount);

  String get statusLabel => switch (status) {
        TxnStatus.allotted => 'Allotted',
        TxnStatus.credited => 'Credited',
        TxnStatus.processing => 'Processing',
      };
}

class TransactionMock {
  static final items = <TransactionItem>[
    TransactionItem(
      id: 't1',
      title: 'SIP · Parag Parikh Flexi Cap',
      subtitle: '5 Jul · UPI Auto-pay',
      type: TxnType.sip,
      amount: 5000,
      date: DateTime(2023, 7, 5),
      status: TxnStatus.allotted,
    ),
    TransactionItem(
      id: 't2',
      title: 'One-time · HDFC Balanced Adv.',
      subtitle: '12 Jul · Net-banking',
      type: TxnType.oneTime,
      amount: 25000,
      date: DateTime(2023, 7, 12),
      status: TxnStatus.allotted,
    ),
    TransactionItem(
      id: 't3',
      title: 'SIP · Neev Index Fund',
      subtitle: '5 Jul · UPI Auto-pay',
      type: TxnType.processing,
      amount: 3000,
      date: DateTime(2023, 7, 5),
      status: TxnStatus.processing,
    ),
    TransactionItem(
      id: 't4',
      title: 'Redeemed · UTI Nifty 50',
      subtitle: '28 Jun · Bank transfer',
      type: TxnType.redeem,
      amount: 12000,
      date: DateTime(2023, 6, 28),
      status: TxnStatus.credited,
    ),
    TransactionItem(
      id: 't5',
      title: 'SIP · Parag Parikh Flexi Cap',
      subtitle: '5 Jun · UPI Auto-pay',
      type: TxnType.sip,
      amount: 5000,
      date: DateTime(2023, 6, 5),
      status: TxnStatus.allotted,
    ),
  ];
}
