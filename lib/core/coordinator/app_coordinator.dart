import 'package:flutter/material.dart';
import '../../data/repositories_impl/session_repository_impl.dart';
import '../../domain/usecases/get_session.dart';
import '../router/app_router.dart';

/// AppCoordinator — Decides navigation flows.
///
/// Uses a static NavigatorKey so it never needs BuildContext.
/// Access from anywhere via AppCoordinator.instance.
///
/// Usage:
///   AppCoordinator.instance.goToOnboarding();
class AppCoordinator {

  // ── Singleton ───────────────────────────────────────────
  AppCoordinator._();
  static final AppCoordinator instance = AppCoordinator._();

  // ── Navigator key — injected into MaterialApp ───────────
  /// Passed to MaterialApp.navigatorKey so the coordinator
  /// can navigate without needing a BuildContext.
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  /// Convenience getter for the NavigatorState.
  NavigatorState get _navigator => navigatorKey.currentState!;

  // ── Initial screen ──────────────────────────────────────
  /// Determines the first widget based on session state.
  /// Called once by App during build.
  static Widget startScreen() {
    final session = GetSession(const SessionRepositoryImpl())();
    return session.isUserLogged
        ? AppRouter.buildMain()
        : AppRouter.buildWelcome();
  }

  // ── Auth flow ───────────────────────────────────────────
  /// Welcome → Onboarding
  void goToOnboarding() {
    _navigator.pushNamed(AppRouter.onboarding);
  }

  // ── Onboarding flow ─────────────────────────────────────
  /// Onboarding complete → Main
  /// Uses pushReplacement so the user can't go back to onboarding.
  void onboardingCompleted() {
    _navigator.pushReplacementNamed(AppRouter.main);
  }

  // ── Main flow ───────────────────────────────────────────
  /// Any tab → Report preview
  void goToReport() {
    _navigator.pushNamed(AppRouter.report);
  }

  /// Any screen → Settings (outside tab bar if needed)
  void goToSettings() {
    _navigator.pushNamed(AppRouter.appSettings);
  }

  /// Go back one screen
  void goBack() {
    if (_navigator.canPop()) _navigator.pop();
  }
}