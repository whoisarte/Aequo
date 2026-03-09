import 'package:flutter/material.dart';
import '../../presentation/screens/onboarding/welcome_screen.dart';
import '../../presentation/screens/onboarding/onboarding_screen.dart';
import '../../presentation/screens/main/main_tab_screen.dart';
import '../../presentation/screens/settings/settings_screen.dart';

/// AppRouter — Maps route names to widgets.
///
/// Only responsibility: given a route name, return the correct widget.
/// No business logic, no use cases, no session checks.
///
/// Navigation decisions live in AppCoordinator.
class AppRouter {

  // ── Route names ─────────────────────────────────────────
  // Used internally by generateRoute and AppCoordinator.
  // Screens never reference these directly.
  static const String onboarding  = '/onboarding';
  static const String main        = '/main';
  static const String appSettings = '/settings';
  static const String report      = '/report';
  static const String calculator  = '/calculator'; // → Sprint 1
  static const String vault       = '/vault';      // → Sprint 3

  // ── Widget builders ──────────────────────────────────────
  // Used by AppCoordinator.startScreen() to build
  // the initial widget without going through the navigator.
  static Widget buildWelcome()    => const WelcomeScreen();
  static Widget buildOnboarding() => const OnboardingScreen();
  static Widget buildMain()       => const MainTabScreen();
  static Widget buildSettings()   => const SettingsScreen();

  // ── Route generator ──────────────────────────────────────
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onboarding:
        return _slide(buildOnboarding());
      case main:
        return _slide(buildMain());
      case appSettings:
        return _slide(buildSettings());
      case calculator:
        // → CalculatorScreen() in Sprint 1
        return _slide(const Scaffold(body: Center(child: Placeholder())));
      case vault:
        // → VaultScreen() in Sprint 3
        return _slide(const Scaffold(body: Center(child: Placeholder())));
      case report:
        // → ReportPreviewScreen() in Sprint 2
        return _slide(const Scaffold(body: Center(child: Placeholder())));
      default:
        return _slide(const Scaffold(body: Center(child: Placeholder())));
    }
  }

  // ── Standard transition — slide left ─────────────────────
  static PageRouteBuilder _slide(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (_, animation, __, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutCubic,
          )),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 400),
    );
  }
}