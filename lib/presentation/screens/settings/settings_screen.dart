import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../domain/entities/brand_profile.dart';
import '../../../domain/entities/profile_type.dart';
import 'widgets/settings_profile_header.dart';
import 'widgets/settings_section.dart';
import 'widgets/settings_row.dart';

/// SettingsScreen — App configuration and profile management.
///
/// Sections:
///   1. Profile header — logo, name, address
///   2. Profile section — edit profile action
///   3. Legal strategy — LFT segmented control
///   4. App version footer
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  // ── Dummy profile — replace with GetBrandProfile use case ──
  final BrandProfile _profile = const BrandProfile(
    type:          ProfileType.business,
    displayName:   'Martínez & Asociados S.C.',
    fiscalAddress: 'Av. Insurgentes Sur 1234, Col. Del Valle, CDMX',
    logoPath:      null,
  );

  // ── LFT Strategy selection ─────────────────────────────────
  // 0 = LFT 2024 · 1 = Legacy · 2 = Confianza
  int _selectedStrategy = 0;

  static const List<String> _strategyLabels = [
    'LFT 2025 - LFT 2026',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.midnightDark,
      // ── App bar ─────────────────────────────────────────
      appBar: AppBar(
        title: const Text('Configuración'),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          // ── 1. Profile header ────────────────────────
          SettingsProfileHeader(profile: _profile),

          // ── Divider ───────────────────────────────────
          const Divider(height: 1),

          const SizedBox(height: 24),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [

                // ── 2. Profile section ───────────────────
                SettingsSection(
                  title: 'Perfil',
                  children: [
                    SettingsRow(
                      icon:     Icons.edit_outlined,
                      title:    'Editar perfil',
                      subtitle: 'Nombre, dirección y logo del despacho.',
                      onTap:    () => debugPrint('→ Editar perfil'),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // ── 3. Legal strategy ────────────────────
                SettingsSection(
                  title: 'Estrategia legal',
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Label
                          const Text(
                            'Ley Federal del Trabajo',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.cloudWhite,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Algoritmo de cálculo aplicado a todos los expedientes.',
                            style: TextStyle(
                              fontSize: 11,
                              color: AppColors.slateGray,
                              height: 1.4,
                            ),
                          ),

                          const SizedBox(height: 14),

                          // Segmented control
                          _LftSegmentedControl(
                            labels:        _strategyLabels,
                            selectedIndex: _selectedStrategy,
                            onChanged: (index) =>
                                setState(() => _selectedStrategy = index),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                // ── 4. App version footer ────────────────
                const _AppVersionFooter(),

                const SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── LFT Segmented Control ─────────────────────────────────────
class _LftSegmentedControl extends StatelessWidget {
  final List<String> labels;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const _LftSegmentedControl({
    required this.labels,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      decoration: BoxDecoration(
        color: AppColors.midnightDark,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.borderSubtle),
      ),
      child: Row(
        children: List.generate(labels.length, (index) {
          final isSelected = index == selectedIndex;
          return Expanded(
            child: GestureDetector(
              onTap: () => onChanged(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
                margin: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.oxfordGold
                      : AppColors.transparent,
                  borderRadius: BorderRadius.circular(6),
                ),
                alignment: Alignment.center,
                child: Text(
                  labels[index],
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: isSelected
                        ? FontWeight.w600
                        : FontWeight.w400,
                    color: isSelected
                        ? AppColors.midnightDark
                        : AppColors.slateGray,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

// ── App version footer ────────────────────────────────────────
class _AppVersionFooter extends StatelessWidget {
  const _AppVersionFooter();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Aequo wordmark
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'A',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.oxfordGold,
                  letterSpacing: -0.5,
                ),
              ),
              TextSpan(
                text: 'equo',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  color: AppColors.slateGray,
                  letterSpacing: -0.5,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 6),

        // Version
        const Text(
          'Versión 1.0.0',
          style: TextStyle(
            fontSize: 11,
            color: AppColors.slateGray,
          ),
        ),

        const SizedBox(height: 4),

        // Legal note
        const Text(
          'Cálculos basados en la Ley Federal del Trabajo vigente.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 10,
            color: AppColors.slateGray,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}