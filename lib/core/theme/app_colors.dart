import 'package:flutter/material.dart';

/// Aequo — Brand Color Palette
///
/// Usage:
///   Container(color: AppColors.midnightBlue)
///   Text('Hello', style: TextStyle(color: AppColors.oxfordGold))
abstract final class AppColors {
  // ── Primary ─────────────────────────────────────────────
  
  /// Main background, headers, nav bar, app bar.
  /// Communicates authority and legal depth.
  static const Color midnightBlue = Color(0xFF1A2B47);

  /// Slightly lighter surface variant of midnightBlue.
  /// Used for cards, bottom sheets, elevated surfaces.
  static const Color midnightLight = Color(0xFF243658);

  /// Darkest shade. Used for the scaffold background.
  static const Color midnightDark = Color(0xFF111D30);

  // ── Accent ──────────────────────────────────────────────

  /// CTAs, "Generar Reporte" button, section accents,
  /// validation seals, active state indicators.
  static const Color oxfordGold = Color(0xFFC5A059);

  /// Dimmed gold for disabled gold elements or subtle borders.
  static const Color oxfordGoldDim = Color(0xFF9A7A3F);

  // ── Neutral ─────────────────────────────────────────────

  /// Secondary text, field labels, hints, metadata.
  /// Avoids pure black fatigue on light backgrounds.
  static const Color slateGray = Color(0xFF64748B);

  /// Lighter slate for dividers and inactive icons.
  static const Color slateLight = Color(0xFF94A3B8);

  // ── Background / Surface ────────────────────────────────

  /// Input backgrounds, PDF canvas, card surfaces.
  /// Slight blue tint keeps it from feeling sterile.
  static const Color cloudWhite = Color(0xFFF8FAFC);

  /// Slightly darker surface for grouped sections on light screens.
  static const Color surfaceGray = Color(0xFFEFF3F8);

  // ── Scenario: Renuncia Voluntaria ───────────────────────

  /// Primary color for the "Renuncia" scenario card.
  /// Associates voluntary resignation with a positive, peaceful outcome.
  static const Color emeraldGreen = Color(0xFF2D6A4F);

  /// Lighter emerald for text/icons on dark emerald backgrounds.
  static const Color emeraldLight = Color(0xFF4ADE80);

  /// Subtle emerald tint for scenario card background fills.
  static const Color emeraldSurface = Color(0xFF1A3D2E);

  // ── Scenario: Despido Injustificado ─────────────────────

  /// Primary color for the "Despido" scenario card.
  /// Sober red that marks economic difference without alarm.
  static const Color terracottaRed = Color(0xFFA63D40);

  /// Lighter terracotta for text/icons on dark red backgrounds.
  static const Color terracottaLight = Color(0xFFFCA5A5);

  /// Subtle terracotta tint for scenario card background fills.
  static const Color terracottaSurface = Color(0xFF3D1A1B);

  // ── Utility ─────────────────────────────────────────────

  /// Success states outside of the scenario context (e.g. saved, copied).
  static const Color successGreen = Color(0xFF22C55E);

  /// Warning states (e.g. missing fields, ISR alert).
  static const Color warningAmber = Color(0xFFF59E0B);

  /// Error states (e.g. invalid date range, form errors).
  static const Color errorRed = Color(0xFFEF4444);

  /// Pure white for text on dark backgrounds.
  static const Color white = Color(0xFFFFFFFF);

  /// Transparent — convenience alias.
  static const Color transparent = Colors.transparent;

  // ── Border / Divider ────────────────────────────────────

  /// Subtle border using gold at low opacity.
  /// Use for card outlines and section dividers on dark backgrounds.
  static const Color borderSubtle = Color(0x33C5A059);   // oxfordGold @ 20%

  /// More visible border for focused inputs or hover states.
  static const Color borderStrong = Color(0x80C5A059);   // oxfordGold @ 50%

  /// Neutral divider for light (cloudWhite) backgrounds.
  static const Color dividerLight = Color(0xFFE2E8F0);

  // ── Scenario helpers ────────────────────────────────────

  /// Returns the correct primary color for a given scenario type.
  ///
  /// Example:
  ///   Color primary = AppColors.forScenario(ScenarioType.renuncia);
  static Color forScenario(ScenarioType type) {
    return switch (type) {
      ScenarioType.renuncia => emeraldGreen,
      ScenarioType.despido  => terracottaRed,
    };
  }

  /// Returns the surface (background fill) color for a given scenario.
  static Color surfaceForScenario(ScenarioType type) {
    return switch (type) {
      ScenarioType.renuncia => emeraldSurface,
      ScenarioType.despido  => terracottaSurface,
    };
  }

  /// Returns the light (text/icon) color for a given scenario.
  static Color lightForScenario(ScenarioType type) {
    return switch (type) {
      ScenarioType.renuncia => emeraldLight,
      ScenarioType.despido  => terracottaLight,
    };
  }
}

/// The two legal scenarios the app compares.
enum ScenarioType { renuncia, despido }