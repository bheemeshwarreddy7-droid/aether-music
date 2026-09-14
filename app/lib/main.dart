import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/library/screens/library_screen.dart';

/// SIMPLIFIED VERSION — runs standalone, no backend servers needed.
void main() {
  runApp(const AetherAppStandalone());
}

class AetherAppStandalone extends StatelessWidget {
  const AetherAppStandalone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aether Music',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.dark,
      home: const LibraryScreen(),
    );
  }
}
