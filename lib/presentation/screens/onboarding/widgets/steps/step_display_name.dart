import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../domain/entities/profile_type.dart';

/// Step 2 — Display name input.
/// Title and hint adapt based on the selected profile type.
class StepDisplayName extends StatelessWidget {
  final ProfileType profileType;
  final TextEditingController controller;

  const StepDisplayName({
    super.key,
    required this.profileType,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    // Labels adapt to profile type
    final title = profileType == ProfileType.business
        ? '¿Cuál es el nombre\nde su despacho?'
        : '¿Cuál es su\nnombre completo?';

    final hint = profileType == ProfileType.business
        ? 'Ej. Martínez & Asociados S.C.'
        : 'Ej. Lic. Carlos Martínez Ruiz';

    final subtitle = profileType == ProfileType.business
        ? 'Este nombre aparecerá en el encabezado de todos sus documentos.'
        : 'Su nombre aparecerá como firmante en los documentos generados.';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),

          // ── Title ──────────────────────────────────────
          Text(
            title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: AppColors.cloudWhite,
              height: 1.2,
              letterSpacing: -0.5,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w300,
              color: AppColors.slateGray,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 40),

          // ── Text field — inherits style from AppTheme ──
          TextField(
            controller: controller,
            autofocus: true,
            textCapitalization: TextCapitalization.words,
            style: const TextStyle(
              color: AppColors.cloudWhite,
              fontSize: 15,
            ),
            decoration: InputDecoration(
              hintText: hint,
              prefixIcon: Icon(
                profileType == ProfileType.business
                    ? Icons.business_outlined
                    : Icons.person_outline_rounded,
              ),
            ),
          ),
        ],
      ),
    );
  }
}