import 'package:new_app/core/utils/formatters.dart';

class GoalOption {
  const GoalOption({
    required this.id,
    required this.label,
    required this.sub,
    required this.letter,
  });

  final String id;
  final String label;
  final String sub;
  final String letter;
}

class AmountOption {
  const AmountOption({
    required this.id,
    required this.label,
    required this.value,
  });

  final String id;
  final String label;
  final int? value;
}

class TimeframeOption {
  const TimeframeOption({
    required this.id,
    required this.label,
  });

  final String id;
  final String label;
}

class QuizOption {
  const QuizOption({
    required this.text,
    required this.score,
    this.subtitle = '',
    this.bandLabel = 'Balanced',
  });

  final String text;
  final String subtitle;
  final int score;
  /// Shown in the “You’re shaping up as” card while selected.
  final String bandLabel;
}

class QuizQuestion {
  const QuizQuestion({
    required this.text,
    required this.options,
    this.subtitle =
        'Helps us match funds to your comfort zone. There’s no wrong answer.',
  });

  final String text;
  final String subtitle;
  final List<QuizOption> options;
}

class RiskBand {
  const RiskBand({
    required this.key,
    required this.min,
    required this.max,
    required this.label,
    required this.desc,
    required this.equityPct,
    required this.hybridPct,
    required this.debtPct,
  });

  final String key;
  final int min;
  final int max;
  final String label;
  final String desc;
  final int equityPct;
  final int hybridPct;
  final int debtPct;
}

class RelationshipManager {
  const RelationshipManager({
    required this.id,
    required this.name,
    required this.initials,
    required this.creds,
    required this.base,
    required this.focus,
    required this.matches,
  });

  final String id;
  final String name;
  final String initials;
  final String creds;
  final String base;
  final String focus;
  final List<String> matches;
}

class FundTemplate {
  const FundTemplate({
    required this.name,
    required this.category,
    required this.ret,
    required this.growthFactor,
  });

  final String name;
  final String category;
  final String ret;
  final double growthFactor;
}

const goals = <GoalOption>[
  GoalOption(
    id: 'home',
    label: 'Home',
    sub: 'Planning for your dream home',
    letter: 'H',
  ),
  GoalOption(
    id: 'travel',
    label: 'Travel',
    sub: 'Take your dream vacation',
    letter: 'T',
  ),
  GoalOption(
    id: 'education',
    label: "Child's future",
    sub: 'Lets secure your child\'s future',
    letter: 'E',
  ),
  GoalOption(
    id: 'retirement',
    label: 'Retirement',
    sub: 'Get steady income after retirement',
    letter: 'R',
  ),
  GoalOption(
    id: 'wealth_creation',
    label: 'Wealth creation',
    sub: 'Let compounding do the magic',
    letter: 'B',
  ),
  GoalOption(
    id: 'emergency',
    label: 'Emergency fund',
    sub: '6–12 months of buffer',
    letter: 'S',
  ),
];

const amountOptions = <AmountOption>[
  AmountOption(id: '5l', label: '₹5L', value: 500000),
  AmountOption(id: '10l', label: '₹10L', value: 1000000),
  AmountOption(id: '25l', label: '₹25L', value: 2500000),
  AmountOption(id: '50l', label: '₹50L', value: 5000000),
  AmountOption(id: '1cr', label: '₹1Cr', value: 10000000),
  AmountOption(id: 'custom', label: 'Custom', value: null),
];

const timeframeOptions = <TimeframeOption>[
  TimeframeOption(id: '1-3', label: '1–3 yrs'),
  TimeframeOption(id: '3-5', label: '3–5 yrs'),
  TimeframeOption(id: '5-10', label: '5–10 yrs'),
  TimeframeOption(id: '10+', label: '10+ yrs'),
];

const quiz = <QuizQuestion>[
  QuizQuestion(
    text: 'Markets dip 15% in a month. You...',
    options: [
      QuizOption(
        text: "Sell — I can't watch it fall",
        subtitle: 'Play it safe',
        score: 1,
        bandLabel: 'Conservative',
      ),
      QuizOption(
        text: 'Hold — markets bounce back',
        subtitle: 'Steady & balanced',
        score: 2,
        bandLabel: 'Balanced',
      ),
      QuizOption(
        text: "Buy more — it's a discount",
        subtitle: 'Go for growth',
        score: 3,
        bandLabel: 'Aggressive',
      ),
    ],
  ),
  QuizQuestion(
    text: 'Your investment horizon for this goal is...',
    options: [
      QuizOption(
        text: 'Short — under 3 years',
        subtitle: 'Need access sooner',
        score: 1,
        bandLabel: 'Conservative',
      ),
      QuizOption(
        text: 'Medium — 3 to 7 years',
        subtitle: 'Room to grow steadily',
        score: 2,
        bandLabel: 'Balanced',
      ),
      QuizOption(
        text: 'Long — 7+ years',
        subtitle: 'Time is on your side',
        score: 3,
        bandLabel: 'Aggressive',
      ),
    ],
  ),
  QuizQuestion(
    text: 'When markets swing, you usually...',
    options: [
      QuizOption(
        text: 'Prefer stability over upside',
        subtitle: 'Protect what I have',
        score: 1,
        bandLabel: 'Conservative',
      ),
      QuizOption(
        text: 'Accept some ups and downs',
        subtitle: 'Balanced approach',
        score: 2,
        bandLabel: 'Balanced',
      ),
      QuizOption(
        text: 'Lean into volatility for growth',
        subtitle: 'Opportunity mindset',
        score: 3,
        bandLabel: 'Aggressive',
      ),
    ],
  ),
];

const bands = <RiskBand>[
  RiskBand(
    key: 'CONSERVATIVE',
    min: 3,
    max: 4,
    label: 'Conservative',
    desc:
        'You prioritize safety over high returns and prefer stable, predictable growth.',
    equityPct: 20,
    hybridPct: 10,
    debtPct: 70,
  ),
  RiskBand(
    key: 'MODERATE',
    min: 5,
    max: 5,
    label: 'Steady Builder',
    desc: 'You want your money to grow steadily while keeping risk in check.',
    equityPct: 35,
    hybridPct: 15,
    debtPct: 50,
  ),
  RiskBand(
    key: 'BALANCED',
    min: 6,
    max: 7,
    label: 'Balanced',
    desc:
        "You're happy to ride short-term ups and downs for stronger long-term growth — so we lean toward equity, with a debt cushion.",
    equityPct: 55,
    hybridPct: 15,
    debtPct: 30,
  ),
  RiskBand(
    key: 'GROWTH',
    min: 8,
    max: 8,
    label: 'Growth Seeker',
    desc: "You're focused on long-term growth and can ride out market swings.",
    equityPct: 70,
    hybridPct: 10,
    debtPct: 20,
  ),
  RiskBand(
    key: 'AGGRESSIVE',
    min: 9,
    max: 9,
    label: 'Aggressive',
    desc:
        'You seek maximum growth and are comfortable with significant volatility.',
    equityPct: 85,
    hybridPct: 5,
    debtPct: 10,
  ),
];

const rms = <RelationshipManager>[
  RelationshipManager(
    id: 'ananya',
    name: 'Ananya Rao',
    initials: 'AR',
    creds: 'CFP · 9 yrs experience',
    base: 'Mumbai',
    focus: 'Balanced & growth portfolios',
    matches: ['BALANCED', 'GROWTH'],
  ),
  RelationshipManager(
    id: 'vikram',
    name: 'Vikram Shah',
    initials: 'VS',
    creds: 'CFA · 12 yrs experience',
    base: 'Bengaluru',
    focus: 'Conservative & retirement planning',
    matches: ['CONSERVATIVE', 'MODERATE'],
  ),
  RelationshipManager(
    id: 'priya',
    name: 'Priya Menon',
    initials: 'PM',
    creds: 'CFP · 6 yrs experience',
    base: 'Delhi NCR',
    focus: 'Goal-based & aggressive growth',
    matches: ['GROWTH', 'AGGRESSIVE'],
  ),
];

const fundTemplates = <String, FundTemplate>{
  'equity': FundTemplate(
    name: 'Neev Bluechip Equity Fund',
    category: 'Large Cap Equity',
    ret: '14.2%',
    growthFactor: 1.092,
  ),
  'hybrid': FundTemplate(
    name: 'Neev Balanced Advantage Fund',
    category: 'Hybrid',
    ret: '10.8%',
    growthFactor: 1.058,
  ),
  'debt': FundTemplate(
    name: 'Neev Corporate Bond Fund',
    category: 'Debt',
    ret: '7.1%',
    growthFactor: 1.021,
  ),
};

const extraAmountOptions = <AmountOption>[
  AmountOption(id: '5k', label: '₹5,000', value: 5000),
  AmountOption(id: '10k', label: '₹10,000', value: 10000),
  AmountOption(id: '25k', label: '₹25,000', value: 25000),
  AmountOption(id: '50k', label: '₹50,000', value: 50000),
  AmountOption(id: '1l', label: '₹1,00,000', value: 100000),
  AmountOption(id: 'custom', label: 'Custom', value: null),
];

const sipAmountOptions = <AmountOption>[
  AmountOption(id: '1k', label: '₹1,000', value: 1000),
  AmountOption(id: '2k', label: '₹2,000', value: 2000),
  AmountOption(id: '5k', label: '₹5,000', value: 5000),
  AmountOption(id: '10k', label: '₹10,000', value: 10000),
  AmountOption(id: 'custom', label: 'Custom', value: null),
];

const sipDateOptions = <String>['1st', '5th', '10th', '15th', '25th'];

const fundKeys = <String>['equity', 'hybrid', 'debt'];

const growthFactor = <String, double>{
  'equity': 1.092,
  'hybrid': 1.058,
  'debt': 1.021,
};

String formatINR(num n) => Formatters.currency(n);

/// Kept for call-sites — same simple ₹ formatting (no L/Cr shorthand).
String formatCompactINR(num n) => Formatters.currency(n);

class PlanFundLine {
  const PlanFundLine({
    required this.initials,
    required this.name,
    required this.subtitle,
    required this.pct,
    required this.color,
  });

  final String initials;
  final String name;
  final String subtitle;
  final int pct;
  final int color;

  PlanFundLine copyWith({int? pct}) => PlanFundLine(
        initials: initials,
        name: name,
        subtitle: subtitle,
        pct: pct ?? this.pct,
        color: color,
      );
}

/// Redistribute weights so percentages sum to 100 after removals.
List<PlanFundLine> renormalizePlanFunds(List<PlanFundLine> funds) {
  if (funds.isEmpty) return funds;
  final total = funds.fold<int>(0, (s, f) => s + f.pct);
  if (total <= 0) {
    final even = (100 / funds.length).floor();
    return [
      for (var i = 0; i < funds.length; i++)
        funds[i].copyWith(
          pct: i == funds.length - 1
              ? 100 - even * (funds.length - 1)
              : even,
        ),
    ];
  }
  var allocated = 0;
  final out = <PlanFundLine>[];
  for (var i = 0; i < funds.length; i++) {
    if (i == funds.length - 1) {
      out.add(funds[i].copyWith(pct: 100 - allocated));
    } else {
      final p = ((funds[i].pct / total) * 100).round().clamp(1, 99);
      allocated += p;
      out.add(funds[i].copyWith(pct: p));
    }
  }
  return out;
}

/// Sample fund mix for Screen 9 — same template, slight tilt by goal.
List<PlanFundLine> samplePlanFunds(String goalId) {
  const base = <PlanFundLine>[
    PlanFundLine(
      initials: 'PP',
      name: 'Parag Parikh Flexi Cap',
      subtitle: 'Flexi Cap · core equity',
      pct: 30,
      color: 0xFF6B4EFF,
    ),
    PlanFundLine(
      initials: 'HD',
      name: 'HDFC Balanced Advantage',
      subtitle: 'Hybrid · cushion',
      pct: 25,
      color: 0xFF1B7A4E,
    ),
    PlanFundLine(
      initials: 'UT',
      name: 'UTI Nifty 50 Index',
      subtitle: 'Large Cap · low cost',
      pct: 20,
      color: 0xFFE07A2F,
    ),
    PlanFundLine(
      initials: 'NI',
      name: 'Nippon India Small Cap',
      subtitle: 'Small Cap · growth tilt',
      pct: 15,
      color: 0xFF3D4F6F,
    ),
    PlanFundLine(
      initials: 'SB',
      name: 'SBI Corporate Bond',
      subtitle: 'Debt · stability',
      pct: 10,
      color: 0xFF6F6F6A,
    ),
  ];

  switch (goalId) {
    case 'travel':
    case 'emergency':
      return const [
        PlanFundLine(
          initials: 'HD',
          name: 'HDFC Balanced Advantage',
          subtitle: 'Hybrid · cushion',
          pct: 35,
          color: 0xFF1B7A4E,
        ),
        PlanFundLine(
          initials: 'PP',
          name: 'Parag Parikh Flexi Cap',
          subtitle: 'Flexi Cap · core equity',
          pct: 25,
          color: 0xFF6B4EFF,
        ),
        PlanFundLine(
          initials: 'UT',
          name: 'UTI Nifty 50 Index',
          subtitle: 'Large Cap · low cost',
          pct: 20,
          color: 0xFFE07A2F,
        ),
        PlanFundLine(
          initials: 'SB',
          name: 'SBI Corporate Bond',
          subtitle: 'Debt · stability',
          pct: 20,
          color: 0xFF6F6F6A,
        ),
      ];
    case 'retirement':
      return const [
        PlanFundLine(
          initials: 'PP',
          name: 'Parag Parikh Flexi Cap',
          subtitle: 'Flexi Cap · core equity',
          pct: 25,
          color: 0xFF6B4EFF,
        ),
        PlanFundLine(
          initials: 'HD',
          name: 'HDFC Balanced Advantage',
          subtitle: 'Hybrid · cushion',
          pct: 30,
          color: 0xFF1B7A4E,
        ),
        PlanFundLine(
          initials: 'UT',
          name: 'UTI Nifty 50 Index',
          subtitle: 'Large Cap · low cost',
          pct: 20,
          color: 0xFFE07A2F,
        ),
        PlanFundLine(
          initials: 'SB',
          name: 'SBI Corporate Bond',
          subtitle: 'Debt · stability',
          pct: 25,
          color: 0xFF6F6F6A,
        ),
      ];
    default:
      return base;
  }
}

int estimateTenureMonths(String tenureLabel) {
  final lower = tenureLabel.toLowerCase();
  if (lower.contains('10+') || lower.contains('10 +')) return 180;
  if (lower.contains('5–10') || lower.contains('5-10')) return 90;
  if (lower.contains('3–5') || lower.contains('3-5')) return 48;
  if (lower.contains('1–3') || lower.contains('1-3')) return 24;
  final match = RegExp(r'(\d+)').firstMatch(lower);
  if (match != null) {
    final yrs = int.tryParse(match.group(1)!) ?? 10;
    return (yrs * 12).clamp(12, 360);
  }
  return 120;
}

double suggestedMonthlySip(double target, String tenureLabel) {
  final months = estimateTenureMonths(tenureLabel);
  return (target / months).clamp(1000, 100000).roundToDouble();
}
