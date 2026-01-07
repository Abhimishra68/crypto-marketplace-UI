import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CryptoHeader extends StatelessWidget {
  final double padding;

  const CryptoHeader({
    Key? key,
    required this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Profile Section
          Row(
            children: [
              CircleAvatar(
                radius: isMobile ? 18 : 22,
                backgroundColor: AppTheme.cardBackground,
                child: Icon(
                  Icons.person,
                  color: AppTheme.textPrimary,
                  size: isMobile ? 20 : 24,
                ),
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello, Oripio 👋',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: isMobile ? 16 : 18,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
            ],
          ),

          // Right Icons
          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.notifications_none_outlined,
                  color: AppTheme.textPrimary,
                  size: isMobile ? 20 : 24,
                ),
                onPressed: () {},
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              SizedBox(width: isMobile ? 12 : 16),
              IconButton(
                icon: Icon(
                  Icons.account_balance_wallet_outlined,
                  color: AppTheme.textPrimary,
                  size: isMobile ? 20 : 24,
                ),
                onPressed: () {},
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
