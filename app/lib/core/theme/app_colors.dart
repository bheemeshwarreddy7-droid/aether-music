import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primaryBlack = Color(0xFF000000);
  static const Color secondaryNavy = Color(0xFF0A192F);
  static const Color accentTeal = Color(0xFF14B8A6);
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB0B0B0);

  static const Color glassSurface = Color(0x1AFFFFFF);
  static const Color glassBorder = Color(0x33FFFFFF);

  static const LinearGradient nowPlayingGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [secondaryNavy, primaryBlack],
  );

  static const LinearGradient accentGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [accentTeal, Color(0xFF0D9488)],
  );
}
