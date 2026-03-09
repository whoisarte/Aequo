import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../calculator/calculator_screen.dart';
import '../vault/vault_screen.dart';
import '../settings/settings_screen.dart';

/// MainTabScreen — Root screen after onboarding is complete.
///
/// Hosts the three main sections of the app via a bottom tab bar:
///   0. Calculator — dual scenario calculation
///   1. Vault      — saved expeditions library
///   2. Settings   — profile and app configuration
///
/// Each tab maintains its own navigation stack via IndexedStack,
/// preserving scroll position and state when switching tabs.
class MainTabScreen extends StatefulWidget {
  const MainTabScreen({super.key});

  @override
  State<MainTabScreen> createState() => _MainTabScreenState();
}

class _MainTabScreenState extends State<MainTabScreen> {

  // Currently selected tab index
  int _currentIndex = 0;

  // Tab definitions — label, icon, activeIcon
  static const List<_TabItem> _tabs = [
    _TabItem(
      label:      'Calculadora',
      icon:       Icons.balance_outlined,
      activeIcon: Icons.balance_rounded,
    ),
    _TabItem(
      label:      'Bóveda',
      icon:       Icons.folder_outlined,
      activeIcon: Icons.folder_rounded,
    ),
    _TabItem(
      label:      'Ajustes',
      icon:       Icons.settings_outlined,
      activeIcon: Icons.settings_rounded,
    ),
  ];

  // Screens — built once and preserved via IndexedStack
  static const List<Widget> _screens = [
    CalculatorScreenPlaceholder(),
    VaultScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.midnightDark,

      // ── Body — IndexedStack keeps all tabs alive ───────
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),

      // ── Bottom tab bar ─────────────────────────────────
      bottomNavigationBar: _AequoTabBar(
        tabs:         _tabs,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}

// ── Tab bar ───────────────────────────────────────────────────
class _AequoTabBar extends StatelessWidget {
  final List<_TabItem> tabs;
  final int currentIndex;
  final ValueChanged<int> onTap;

  const _AequoTabBar({
    required this.tabs,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.midnightBlue,
        border: Border(
          top: BorderSide(color: AppColors.borderSubtle, width: 1),
        ),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 56,
          child: Row(
            children: List.generate(tabs.length, (index) {
              final isSelected = index == currentIndex;
              final tab = tabs[index];
              return Expanded(
                child: GestureDetector(
                  onTap: () => onTap(index),
                  behavior: HitTestBehavior.opaque,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeOut,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // ── Icon ────────────────────────
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 200),
                          child: Icon(
                            isSelected ? tab.activeIcon : tab.icon,
                            key: ValueKey(isSelected),
                            color: isSelected
                                ? AppColors.oxfordGold
                                : AppColors.slateGray,
                            size: 22,
                          ),
                        ),

                        const SizedBox(height: 3),

                        // ── Label ───────────────────────
                        AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 200),
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: isSelected
                                ? FontWeight.w600
                                : FontWeight.w400,
                            color: isSelected
                                ? AppColors.oxfordGold
                                : AppColors.slateGray,
                          ),
                          child: Text(tab.label),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

// ── Tab item model ────────────────────────────────────────────
class _TabItem {
  final String label;
  final IconData icon;
  final IconData activeIcon;

  const _TabItem({
    required this.label,
    required this.icon,
    required this.activeIcon,
  });
}