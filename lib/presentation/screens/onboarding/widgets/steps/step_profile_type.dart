import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../domain/entities/profile_type.dart';

/// Step 1 — Profile type selection.
/// Shows two large clickable cards: Individual and Business.
class StepProfileType extends StatelessWidget {
  /// Currently selected type — null if nothing selected yet.
  final ProfileType? selectedType;

  /// Called when the user taps a card.
  final ValueChanged<ProfileType> onTypeSelected;

  const StepProfileType({
    super.key,
    required this.selectedType,
    required this.onTypeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),

          // ── Title ───────────────────────────────────────
          const Text(
            '¿Cómo desea\nidentificarse?',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: AppColors.cloudWhite,
              height: 1.2,
              letterSpacing: -0.5,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'Esto determinará la información que aparecerá en sus documentos.',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w300,
              color: AppColors.slateGray,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 40),

          // ── Individual card ──────────────────────────────
          _ProfileTypeCard(
            title: 'Persona Física',
            subtitle: 'Abogado independiente\no profesionista individual.',
            icon: Icons.person_outline_rounded,
            type: ProfileType.individual,
            isSelected: selectedType == ProfileType.individual,
            onTap: () => onTypeSelected(ProfileType.individual),
          ),

          const SizedBox(height: 16),

          // ── Business card ────────────────────────────────
          _ProfileTypeCard(
            title: 'Persona Moral',
            subtitle: 'Despacho jurídico\no empresa.',
            icon: Icons.business_outlined,
            type: ProfileType.business,
            isSelected: selectedType == ProfileType.business,
            onTap: () => onTypeSelected(ProfileType.business),
          ),
        ],
      ),
    );
  }
}

// ── Card individual ───────────────────────────────────────────
class _ProfileTypeCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final ProfileType type;
  final bool isSelected;
  final VoidCallback onTap;

  const _ProfileTypeCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.type,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.oxfordGold.withValues(alpha: 0.08)
              : AppColors.midnightLight,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? AppColors.oxfordGold
                : AppColors.borderSubtle,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            // Ícono con fondo circular
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.oxfordGold.withValues(alpha: 0.15)
                    : AppColors.midnightDark,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: isSelected
                    ? AppColors.oxfordGold
                    : AppColors.slateGray,
                size: 22,
              ),
            ),

            const SizedBox(width: 16),

            // Texto
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: isSelected
                          ? AppColors.oxfordGold
                          : AppColors.cloudWhite,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: AppColors.slateGray,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),

            // Checkmark cuando está seleccionado
            AnimatedOpacity(
              opacity: isSelected ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 200),
              child: const Icon(
                Icons.check_circle_rounded,
                color: AppColors.oxfordGold,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}