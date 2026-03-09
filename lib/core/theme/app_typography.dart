import 'package:flutter/material.dart';
import 'app_colors.dart';

/// AppTypography — Reusable text styles for Aequo.
///
/// Usage:
///   Text('Título', style: AppTypography.screenTitle)
///   Text('Subtítulo', style: AppTypography.screenSubtitle)
abstract final class AppTypography {

  // ── Screen titles ────────────────────────────────────────
  /// Large screen title — onboarding steps, main section headers.
  /// 28px · w700 · cloudWhite · height 1.2 · tracking -0.5
  static const TextStyle screenTitle = TextStyle(
    fontSize:      28,
    fontWeight:    FontWeight.w700,
    color:         AppColors.cloudWhite,
    height:        1.2,
    letterSpacing: -0.5,
  );

  /// Medium title — card headers, settings section names.
  /// 17px · w600 · cloudWhite
  static const TextStyle sectionTitle = TextStyle(
    fontSize:   17,
    fontWeight: FontWeight.w600,
    color:      AppColors.cloudWhite,
  );

  /// App name display — "Aequo" wordmark size.
  /// 18px · w700 · cloudWhite
  static const TextStyle appNameDisplay = TextStyle(
    fontSize:      18,
    fontWeight:    FontWeight.w700,
    color:         AppColors.cloudWhite,
    letterSpacing: -0.5,
  );

  // ── Body ─────────────────────────────────────────────────
  /// Screen subtitle / description under a title.
  /// 13px · w300 · slateGray · height 1.5
  static const TextStyle screenSubtitle = TextStyle(
    fontSize:   13,
    fontWeight: FontWeight.w300,
    color:      AppColors.slateGray,
    height:     1.5,
  );

  /// Standard body text.
  /// 14px · w400 · cloudWhite
  static const TextStyle body = TextStyle(
    fontSize:   14,
    fontWeight: FontWeight.w400,
    color:      AppColors.cloudWhite,
  );

  /// Secondary body — supporting info, metadata.
  /// 13px · w400 · slateGray
  static const TextStyle bodySecondary = TextStyle(
    fontSize:   13,
    fontWeight: FontWeight.w400,
    color:      AppColors.slateGray,
  );

  // ── Labels ───────────────────────────────────────────────
  /// Section label — uppercase, wide tracking.
  /// Used in SettingsSection, vault group headers.
  /// 10px · w600 · slateGray · tracking 1.5
  static const TextStyle sectionLabel = TextStyle(
    fontSize:      10,
    fontWeight:    FontWeight.w600,
    color:         AppColors.slateGray,
    letterSpacing: 1.5,
  );

  /// Row title — primary label in list rows.
  /// 14px · w500 · cloudWhite
  static const TextStyle rowTitle = TextStyle(
    fontSize:   14,
    fontWeight: FontWeight.w500,
    color:      AppColors.cloudWhite,
  );

  /// Row subtitle — secondary label in list rows.
  /// 11px · w400 · slateGray · height 1.4
  static const TextStyle rowSubtitle = TextStyle(
    fontSize:   11,
    fontWeight: FontWeight.w400,
    color:      AppColors.slateGray,
    height:     1.4,
  );

  // ── Captions ─────────────────────────────────────────────
  /// Legal note / caption — bottom of screens.
  /// 10px · w400 · slateGray · tracking 0.2
  static const TextStyle caption = TextStyle(
    fontSize:      10,
    fontWeight:    FontWeight.w400,
    color:         AppColors.slateGray,
    letterSpacing: 0.2,
  );

  /// Badge label — profile type, status chips.
  /// 9px · w600 · tracking 1
  static const TextStyle badge = TextStyle(
    fontSize:      9,
    fontWeight:    FontWeight.w600,
    letterSpacing: 1,
  );

  // ── Monetary amounts ─────────────────────────────────────
  /// Large monetary amount — main result in calculator cards.
  /// 32px · w700 · cloudWhite · tracking -0.5
  static const TextStyle amountLarge = TextStyle(
    fontSize:      32,
    fontWeight:    FontWeight.w700,
    color:         AppColors.cloudWhite,
    letterSpacing: -0.5,
  );

  /// Small monetary amount — breakdown rows.
  /// 14px · w600 · cloudWhite
  static const TextStyle amountSmall = TextStyle(
    fontSize:   14,
    fontWeight: FontWeight.w600,
    color:      AppColors.cloudWhite,
  );
}