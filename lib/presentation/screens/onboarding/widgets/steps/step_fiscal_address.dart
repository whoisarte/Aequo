import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';

/// Step 3 — Fiscal address input (Business only).
class StepFiscalAddress extends StatelessWidget {
  final TextEditingController controller;

  const StepFiscalAddress({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),

          // ── Title ──────────────────────────────────────
          const Text(
            '¿Cuál es su\ndomicilio fiscal?',
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
            'Se incluirá en el encabezado del documento como domicilio del despacho.',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w300,
              color: AppColors.slateGray,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 40),

          // ── Text field ─────────────────────────────────
          TextField(
            controller: controller,
            autofocus: true,
            textCapitalization: TextCapitalization.sentences,
            maxLines: 3,
            style: const TextStyle(
              color: AppColors.cloudWhite,
              fontSize: 15,
            ),
            decoration: const InputDecoration(
              hintText: 'Ej. Av. Insurgentes Sur 1234, Col. Del Valle, CDMX',
              prefixIcon: Icon(Icons.location_on_outlined),
              alignLabelWithHint: true,
            ),
          ),
        ],
      ),
    );
  }
}