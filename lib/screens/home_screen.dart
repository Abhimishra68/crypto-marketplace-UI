import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/crypto_header.dart';
import '../widgets/balance_section.dart';
import '../widgets/time_filter.dart';
import '../widgets/crypto_chart.dart';
import '../widgets/transaction_card.dart';
import '../widgets/custom_bottom_nav.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTimeFilter = 5; // 1QM selected by default
  int selectedNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final padding = isMobile ? 16.0 : 24.0;

    return Scaffold(
      backgroundColor: AppTheme.primaryBackground,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 120),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Section
                  CryptoHeader(padding: padding),
                  SizedBox(height: isMobile ? 20 : 24),

                  // Balance Section
                  BalanceSection(padding: padding),
                  SizedBox(height: isMobile ? 24 : 32),

                  // Time Filter Tabs
                  TimeFilterNav(
                    selectedIndex: selectedTimeFilter,
                    onIndexChanged: (index) {
                      setState(() => selectedTimeFilter = index);
                    },
                    padding: padding,
                  ),

                  SizedBox(height: isMobile ? 20 : 24),

                  // Chart Section
                  CryptoChart(padding: padding),
                  SizedBox(height: isMobile ? 28 : 36),

                  // Recent Transactions Header
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: padding),
                    child: Text(
                      'Recent Transactions',
                      style: Theme.of(context).textTheme.displayMedium
                          ?.copyWith(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(height: isMobile ? 16 : 20),

                  // Transaction Cards
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: padding),
                    child: Column(
                      children: [
                        TransactionCard(
                          icon: '₿',
                          title: 'Receive',
                          subtitle: '05:14 AM',
                          amount: '+0.65487478',
                          currency: 'BTC',
                          backgroundColor: AppTheme.accentOrange.withOpacity(
                            0.2,
                          ),
                          iconColor: AppTheme.accentOrange,
                          isPositive: true,
                        ),
                        SizedBox(height: 12),
                        TransactionCard(
                          icon: 'Ξ',
                          title: 'Send',
                          subtitle: 'ATC',
                          amount: '-0.024987',
                          currency: 'ETH',
                          backgroundColor: AppTheme.textSecondary.withOpacity(
                            0.1,
                          ),
                          iconColor: AppTheme.textPrimary,
                          isPositive: false,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: padding),
                ],
              ),
            ),

            CustomBottomNav(
              selectedIndex: selectedNavIndex,
              onIndexChanged: (index) {
                setState(() => selectedNavIndex = index);
              },
            ),
          ],
        ),
      ),
    );
  }
}
