import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

/// Temporary placeholder for CalculatorScreen.
/// Replace with CalculatorScreen() in Sprint 1.
class CalculatorScreenPlaceholder extends StatelessWidget {
  const CalculatorScreenPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.midnightDark,
      body: Center(
        child: Text(
          'Calculadora\nPróximamente',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: AppColors.slateGray,
            height: 1.6,
          ),
        ),
      ),
    );
  }
}