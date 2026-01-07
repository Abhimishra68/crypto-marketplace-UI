import 'package:flutter/material.dart';
import 'dart:ui';
import '../theme/app_theme.dart';

class BalanceSection extends StatelessWidget {
  final double padding;

  const BalanceSection({
    Key? key,
    required this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppTheme.cardBackground.withOpacity(0.7),
                  AppTheme.cardBackground.withOpacity(0.5),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white.withOpacity(0.15),
                width: 1,
              ),
            ),
            padding: EdgeInsets.all(isMobile ? 16 : 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Balance',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppTheme.textSecondary,
                        fontSize: 14,
                      ),
                ),
                SizedBox(height: 8),

                // Amount with trend
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '\$15,475',
                              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                                    fontSize: isMobile ? 32 : 36,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            TextSpan(
                              text: ' USD',
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Mini sparkline chart
                    Container(
                      width: 80,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppTheme.accentGreen.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppTheme.accentGreen.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.trending_up,
                          color: AppTheme.accentGreen,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),

                // Change Amount
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '+\$432.49',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppTheme.accentGreen,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      TextSpan(
                        text: ' ( +1.2% )',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppTheme.accentGreen,
                              fontSize: 14,
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
    );
  }
}
