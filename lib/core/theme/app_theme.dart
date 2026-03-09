import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';

/// Aequo — Global Theme
///
/// Register in MaterialApp:
///   MaterialApp(
///     theme: AppTheme.light,
///     darkTheme: AppTheme.dark,
///     themeMode: ThemeMode.dark,
///   )
abstract final class AppTheme {

  // ─────────────────────────────────────────────────────────
  // DARK THEME  (primary — the Aequo experience)
  // ─────────────────────────────────────────────────────────
  static ThemeData get dark {
    final base = ThemeData.dark(useMaterial3: true);

    return base.copyWith(
      // ── Color scheme ──────────────────────────────────────
      colorScheme: const ColorScheme.dark(
        brightness: Brightness.dark,

        // Core brand
        primary:            AppColors.oxfordGold,
        onPrimary:          AppColors.midnightDark,
        primaryContainer:   AppColors.oxfordGoldDim,
        onPrimaryContainer: AppColors.cloudWhite,

        // Secondary maps to slateGray family
        secondary:            AppColors.slateGray,
        onSecondary:          AppColors.cloudWhite,
        secondaryContainer:   AppColors.midnightLight,
        onSecondaryContainer: AppColors.slateLight,

        // Surfaces
        surface:                 AppColors.midnightBlue,
        onSurface:               AppColors.cloudWhite,
        surfaceContainerHighest: AppColors.midnightLight,
        surfaceContainerHigh:    AppColors.midnightLight,
        surfaceContainer:        AppColors.midnightBlue,
        surfaceContainerLow:     AppColors.midnightDark,
        surfaceContainerLowest:  AppColors.midnightDark,

        // Feedback
        error:            AppColors.errorRed,
        onError:          AppColors.white,
        errorContainer:   AppColors.terracottaSurface,
        onErrorContainer: AppColors.terracottaLight,

        // Outlines
        outline:        AppColors.borderSubtle,
        outlineVariant: AppColors.borderStrong,
      ),

      // ── Scaffold ──────────────────────────────────────────
      scaffoldBackgroundColor: AppColors.midnightDark,

      // ── AppBar ────────────────────────────────────────────
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.midnightBlue,
        foregroundColor: AppColors.cloudWhite,
        elevation:       0,
        centerTitle:     true,
        titleTextStyle: TextStyle(
          color:         AppColors.cloudWhite,
          fontSize:      17,
          fontWeight:    FontWeight.w600,
          letterSpacing: 0.3,
        ),
        iconTheme:        IconThemeData(color: AppColors.oxfordGold),
        actionsIconTheme: IconThemeData(color: AppColors.oxfordGold),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor:          AppColors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness:     Brightness.dark,
        ),
      ),

      // ── Bottom Navigation ─────────────────────────────────
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor:     AppColors.midnightBlue,
        selectedItemColor:   AppColors.oxfordGold,
        unselectedItemColor: AppColors.slateGray,
        type:                BottomNavigationBarType.fixed,
        elevation:           0,
      ),

      // ── Navigation Bar (Material 3) ───────────────────────
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.midnightBlue,
        // withValues reemplaza al deprecado withOpacity
        indicatorColor:  AppColors.oxfordGold.withValues(alpha: 0.2),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: AppColors.oxfordGold);
          }
          return const IconThemeData(color: AppColors.slateGray);
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const TextStyle(color: AppColors.oxfordGold, fontSize: 11, fontWeight: FontWeight.w600);
          }
          return const TextStyle(color: AppColors.slateGray, fontSize: 11);
        }),
      ),

      // ── Elevated Button ───────────────────────────────────
      // → "Generar Reporte", primary CTAs
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor:         AppColors.oxfordGold,
          foregroundColor:         AppColors.midnightDark,
          disabledBackgroundColor: AppColors.oxfordGoldDim,
          disabledForegroundColor: AppColors.midnightBlue,
          elevation:               0,
          shadowColor:             AppColors.transparent,
          padding:                 const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 0.5),
        ),
      ),

      // ── Outlined Button ───────────────────────────────────
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.oxfordGold,
          side:            const BorderSide(color: AppColors.borderStrong),
          padding:         const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),

      // ── Text Button ───────────────────────────────────────
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.oxfordGold,
          textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
        ),
      ),

      // ── Input / TextField ─────────────────────────────────
      inputDecorationTheme: InputDecorationTheme(
        filled:             true,
        fillColor:          AppColors.midnightLight,
        hintStyle:          const TextStyle(color: AppColors.slateGray, fontSize: 13),
        labelStyle:         const TextStyle(color: AppColors.slateGray, fontSize: 13),
        floatingLabelStyle: const TextStyle(color: AppColors.oxfordGold, fontSize: 12),
        prefixIconColor:    AppColors.slateGray,
        suffixIconColor:    AppColors.slateLight,
        contentPadding:     const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.borderSubtle),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.borderSubtle),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.oxfordGold, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.errorRed),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.errorRed, width: 1.5),
        ),
        errorStyle: const TextStyle(color: AppColors.errorRed, fontSize: 11),
      ),

      // ── Card — usa CardThemeData (no CardTheme) ───────────
      cardTheme: CardThemeData(
        color:     AppColors.midnightLight,
        elevation: 0,
        shape:     RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: AppColors.borderSubtle),
        ),
        margin: const EdgeInsets.all(0),
      ),

      // ── Chip ──────────────────────────────────────────────
      chipTheme: ChipThemeData(
        backgroundColor:     AppColors.midnightLight,
        selectedColor:       AppColors.oxfordGold.withValues(alpha: 0.2),
        disabledColor:       AppColors.midnightDark,
        labelStyle:          const TextStyle(color: AppColors.cloudWhite, fontSize: 12),
        secondaryLabelStyle: const TextStyle(color: AppColors.oxfordGold, fontSize: 12),
        side:                const BorderSide(color: AppColors.borderSubtle),
        shape:               RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        padding:             const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      ),

      // ── Divider ───────────────────────────────────────────
      dividerTheme: const DividerThemeData(
        color:     AppColors.borderSubtle,
        thickness: 1,
        space:     1,
      ),

      // ── List Tile ─────────────────────────────────────────
      listTileTheme: const ListTileThemeData(
        tileColor:         AppColors.transparent,
        iconColor:         AppColors.slateGray,
        textColor:         AppColors.cloudWhite,
        subtitleTextStyle: TextStyle(color: AppColors.slateGray, fontSize: 12),
        contentPadding:    EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      ),

      // ── Floating Action Button ────────────────────────────
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.oxfordGold,
        foregroundColor: AppColors.midnightDark,
        elevation:       2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
      ),

      // ── Switch ────────────────────────────────────────────
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return AppColors.oxfordGold;
          return AppColors.slateGray;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.oxfordGold.withValues(alpha: 0.3);
          }
          return AppColors.midnightLight;
        }),
      ),

      // ── Checkbox ──────────────────────────────────────────
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return AppColors.oxfordGold;
          return AppColors.transparent;
        }),
        checkColor: WidgetStateProperty.all(AppColors.midnightDark),
        side:       const BorderSide(color: AppColors.borderStrong, width: 1.5),
        shape:      RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),

      // ── Radio ─────────────────────────────────────────────
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return AppColors.oxfordGold;
          return AppColors.slateGray;
        }),
      ),

      // ── Progress Indicator ────────────────────────────────
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color:              AppColors.oxfordGold,
        linearTrackColor:   AppColors.midnightLight,
        circularTrackColor: AppColors.midnightLight,
      ),

      // ── Snack Bar ─────────────────────────────────────────
      snackBarTheme: SnackBarThemeData(
        backgroundColor:  AppColors.midnightLight,
        contentTextStyle: const TextStyle(color: AppColors.cloudWhite, fontSize: 13),
        actionTextColor:  AppColors.oxfordGold,
        shape:            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        behavior:         SnackBarBehavior.floating,
      ),

      // ── Bottom Sheet ──────────────────────────────────────
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.midnightBlue,
        dragHandleColor: AppColors.slateGray,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
      ),

      // ── Dialog — usa DialogThemeData (no DialogTheme) ─────
      dialogTheme: DialogThemeData(
        backgroundColor:  AppColors.midnightBlue,
        elevation:        0,
        shape:            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        titleTextStyle:   const TextStyle(color: AppColors.cloudWhite, fontSize: 17, fontWeight: FontWeight.w600),
        contentTextStyle: const TextStyle(color: AppColors.slateLight, fontSize: 14),
      ),

      // ── Tab Bar — usa TabBarThemeData (no TabBarTheme) ────
      tabBarTheme: const TabBarThemeData(
        labelColor:           AppColors.oxfordGold,
        unselectedLabelColor: AppColors.slateGray,
        indicatorColor:       AppColors.oxfordGold,
        indicatorSize:        TabBarIndicatorSize.label,
        labelStyle:           TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
      ),

      // ── Icon ──────────────────────────────────────────────
      iconTheme: const IconThemeData(
        color: AppColors.slateGray,
        size:  22,
      ),
      primaryIconTheme: const IconThemeData(
        color: AppColors.oxfordGold,
        size:  22,
      ),

      // ── Text Selection ────────────────────────────────────
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor:          AppColors.oxfordGold,
        selectionColor:       AppColors.borderStrong,
        selectionHandleColor: AppColors.oxfordGold,
      ),
    );
  }

  // ─────────────────────────────────────────────────────────
  // LIGHT THEME  (opcional — pantalla de PDF preview)
  // ─────────────────────────────────────────────────────────
  static ThemeData get light {
    final base = ThemeData.light(useMaterial3: true);

    return base.copyWith(
      colorScheme: const ColorScheme.light(
        brightness:  Brightness.light,
        primary:     AppColors.midnightBlue,
        onPrimary:   AppColors.cloudWhite,
        secondary:   AppColors.oxfordGold,
        onSecondary: AppColors.midnightDark,
        surface:     AppColors.cloudWhite,
        onSurface:   AppColors.midnightBlue,
        outline:     AppColors.dividerLight,
      ),
      scaffoldBackgroundColor: AppColors.surfaceGray,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.midnightBlue,
        foregroundColor: AppColors.cloudWhite,
        elevation:       0,
        iconTheme:       IconThemeData(color: AppColors.oxfordGold),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor:          AppColors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      // CardThemeData también en light theme
      cardTheme: CardThemeData(
        color:     AppColors.cloudWhite,
        elevation: 0,
        shape:     RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: AppColors.dividerLight),
        ),
      ),
    );
  }
}