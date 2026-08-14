import 'package:new_app/domain/models/fund_model.dart';
import 'package:new_app/domain/models/goal_option.dart';
import 'package:new_app/domain/models/portfolio_model.dart';
import 'package:new_app/domain/models/user_model.dart';

class MockData {
  static const user = UserModel(
    id: '1',
    name: 'Shaira',
    email: 'shaira@email.com',
    phone: '+919876543210',
    isKycVerified: true,
  );

  static const portfolio = PortfolioSummary(
    currentValue: 486240,
    investedAmount: 425000,
    totalReturns: 61240,
    totalReturnsPercent: 14.4,
    oneDayChange: 1842,
    oneDayChangePercent: 0.38,
    allocation: [
      AllocationItem(name: 'Flexi Cap', percentage: 40),
      AllocationItem(name: 'Small Cap', percentage: 31),
      AllocationItem(name: 'Index', percentage: 29),
    ],
    holdings: [
      PortfolioHolding(
        fundId: '1',
        fundName: 'Parag Parikh Flexi Cap',
        currentValue: 194496,
        dailyChange: 936,
        dailyChangePercent: 0.48,
        profitLoss: 28496,
        profitLossPercent: 17.1,
      ),
      PortfolioHolding(
        fundId: '2',
        fundName: 'HDFC Small Cap Fund',
        currentValue: 150734,
        dailyChange: 725,
        dailyChangePercent: 0.48,
        profitLoss: 20734,
        profitLossPercent: 15.9,
      ),
      PortfolioHolding(
        fundId: '3',
        fundName: 'Neev Index Fund',
        currentValue: 141010,
        dailyChange: 681,
        dailyChangePercent: 0.48,
        profitLoss: 12010,
        profitLossPercent: 9.3,
      ),
    ],
  );

  static const funds = [
    FundModel(
      id: '1',
      name: 'Parag Parikh Flexi Cap',
      shortCode: 'PP',
      category: 'Flexi Cap',
      riskLevel: 'Very high risk',
      returns3Y: 16.2,
      minSip: 1000,
      nav: 74.82,
      expenseRatio: 1.44,
      fundSize: 84910,
      rating: 5,
      planType: 'Direct · Growth · Flexi Cap',
      holdings: [
        HoldingModel(name: 'HDFC Bank', percentage: 7.8),
        HoldingModel(name: 'Bajaj Holdings', percentage: 5.6),
        HoldingModel(name: 'Infosys', percentage: 4.9),
        HoldingModel(name: 'ITC', percentage: 4.2),
      ],
    ),
    FundModel(
      id: '2',
      name: 'HDFC Small Cap Fund',
      shortCode: 'HD',
      category: 'Small Cap',
      riskLevel: 'Very high risk',
      returns3Y: 22.4,
      minSip: 1000,
      nav: 128.15,
      expenseRatio: 1.68,
      fundSize: 32100,
      rating: 4.5,
      holdings: [
        HoldingModel(name: 'Persistent Systems', percentage: 3.8),
        HoldingModel(name: 'Coforge', percentage: 3.5),
        HoldingModel(name: 'Titan Company', percentage: 3.2),
      ],
    ),
    FundModel(
      id: '3',
      name: 'Neev Index Fund',
      shortCode: 'NI',
      category: 'Index',
      riskLevel: 'Moderate',
      returns3Y: 13.8,
      minSip: 500,
      nav: 24.56,
      expenseRatio: 0.35,
      fundSize: 15600,
      rating: 4.8,
      holdings: [
        HoldingModel(name: 'Nifty 50 Stocks', percentage: 95),
        HoldingModel(name: 'Cash', percentage: 5),
      ],
    ),
    FundModel(
      id: '4',
      name: 'Neev Debt Fund',
      shortCode: 'ND',
      category: 'Debt',
      riskLevel: 'Low',
      returns3Y: 7.2,
      minSip: 500,
      nav: 15.89,
      expenseRatio: 0.45,
      fundSize: 3200,
      rating: 4.2,
      holdings: [
        HoldingModel(name: 'AAA Corporate Bonds', percentage: 45),
        HoldingModel(name: 'Government Bonds', percentage: 35),
      ],
    ),
    FundModel(
      id: '5',
      name: 'Neev ELSS Tax Saver',
      shortCode: 'NE',
      category: 'ELSS',
      riskLevel: 'Moderate',
      returns3Y: 16.5,
      minSip: 500,
      nav: 52.34,
      expenseRatio: 0.95,
      fundSize: 780,
      rating: 4.6,
      holdings: [
        HoldingModel(name: 'Large Cap Stocks', percentage: 60),
        HoldingModel(name: 'Mid Cap Stocks', percentage: 25),
      ],
    ),
  ];

  static const goalOptions = [
    GoalOption(
      id: 'home',
      title: 'Home',
      subtitle: 'Down payment',
      emoji: '🏠',
    ),
    GoalOption(
      id: 'travel',
      title: 'Travel',
      subtitle: 'That big trip',
      emoji: '✈️',
    ),
    GoalOption(
      id: 'child',
      title: "Child's future",
      subtitle: 'Graduation / fees',
      emoji: '🎓',
    ),
    GoalOption(
      id: 'retirement',
      title: 'Retirement',
      subtitle: 'Relax later',
      emoji: '🌴',
    ),
    GoalOption(
      id: 'big_buy',
      title: 'Big buy',
      subtitle: 'Car, wedding...',
      emoji: '🚗',
    ),
    GoalOption(
      id: 'emergency',
      title: 'Emergency',
      subtitle: 'Safety net',
      emoji: '🛟',
    ),
  ];

  static const filterTags = ['For you', 'Equity', 'Debt', 'Hybrid', 'ELSS'];
}
