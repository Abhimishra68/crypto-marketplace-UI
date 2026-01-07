import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryBackground = Color(0xFF171B26);
  static const Color cardBackground = Color(0xFF242835);
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF999999);
  static const Color accentGreen = Color(0xFF00D084);
  static const Color accentRed = Color(0xFFFA6C6C);
  static const Color accentTeal = Color(0xFF00FFCC);
  static const Color accentOrange = Color(0xFFFF8C42);
  static const Color buttonBlue = Color(0xFF4C5BF2);
  static const Color buttonPurple = Color(0xFF8A2BE2);
  static const Color gridLineColor = Color(0xFF2B3445);
  static const Color lossRed        = Color(0xFFEF4444);
  static const Color lossOrange     = Color(0xFFF97316);
  static const Color neutralAmber   = Color(0xFFFBBF24);
  static const Color gainTeal       = Color(0xFF14B8A6);
  static const Color gainGreen      = Color(0xFF22C55E);
  static const Color gainCyan       = Color(0xFF06B6D4);
   static const Color borderColor = Color(0xFF1F2937);

    // 🔴 Reds / Loss
 // static const Color accentRed = Color(0xFFE11D48);
  static const Color accentPink = Color(0xFFEC4899);

  // 🟠 Oranges / Warning
  static const Color accentLightOrange = Color(0xFFF97316);

  // 🟣 Purples (Primary Accent)
  static const Color accentPurple = Color(0xFF7C3AED);
  static const Color accentDarkPurple = Color(0xFF5B21B6);

  // 🔵 Blues (Finance / Action)
  static const Color accentBlue = Color(0xFF2563EB);
  static const Color accentDarkBlue = Color(0xFF1E40AF);

  // 🟢 Gains / Success
  // static const Color accentGreen = Color(0xFF22C55E);
  // static const Color accentTeal = Color(0xFF14B8A6);

  // 🟡 Neutral / Highlight
  static const Color accentAmber = Color(0xFFFBBF24);

  // ⚫ Dark UI Base
  static const Color darkBackground = Color(0xFF0B1220);
  static const Color darkCard = Color(0xFF111827);
  // existing colors (keep yours)
  // static const Color accentRed = Color(0xFFE11D48);
  // static const Color accentPink = Color(0xFFEC4899);
  // static const Color accentLightOrange = Color(0xFFF97316);

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: buttonBlue,
      scaffoldBackgroundColor: primaryBackground,
      useMaterial3: true,
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: textPrimary,
          fontSize: 36,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: TextStyle(
          color: textPrimary,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(
          color: textPrimary,
          fontSize: 16,
        ),
        bodyMedium: TextStyle(
          color: textSecondary,
          fontSize: 14,
        ),
      ),
    );
  }
}
