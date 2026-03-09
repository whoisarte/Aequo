import 'dart:io';
import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';

/// Step 4 — Logo picker (Business only).
/// Allows selecting an image from the gallery.
/// Requires image_picker package in pubspec.yaml.
class StepLogoPicker extends StatelessWidget {
  /// Path of the selected image — null if none selected yet.
  final String? selectedLogoPath;

  /// Called with the selected file path after picking.
  final ValueChanged<String> onLogoPicked;

  /// Called when the user skips this step.
  final VoidCallback onSkip;

  const StepLogoPicker({
    super.key,
    required this.selectedLogoPath,
    required this.onLogoPicked,
    required this.onSkip,
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
            'Agregue el logo\nde su despacho.',
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
            'Aparecerá en el encabezado de cada documento generado.',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w300,
              color: AppColors.slateGray,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 40),

          // ── Logo preview / picker ──────────────────────
          Center(
            child: GestureDetector(
              onTap: () => _pickImage(context),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  color: AppColors.midnightLight,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: selectedLogoPath != null
                        ? AppColors.oxfordGold
                        : AppColors.borderSubtle,
                    width: selectedLogoPath != null ? 1.5 : 1,
                  ),
                ),
                child: selectedLogoPath != null
                    // Preview de la imagen seleccionada
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Image.file(
                          File(selectedLogoPath!),
                          fit: BoxFit.cover,
                        ),
                      )
                    // Placeholder con ícono de cámara
                    : const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_photo_alternate_outlined,
                            color: AppColors.slateGray,
                            size: 36,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Seleccionar logo',
                            style: TextStyle(
                              fontSize: 11,
                              color: AppColors.slateGray,
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),

          const SizedBox(height: 24),

          // ── Skip option ────────────────────────────────
          Center(
            child: TextButton(
              onPressed: onSkip,
              child: const Text(
                'Omitir por ahora',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.slateGray,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Opens the image gallery using image_picker.
  /// Calls onLogoPicked with the selected file path.
  Future<void> _pickImage(BuildContext context) async {
    // image_picker se integrará cuando se agregue al pubspec.yaml
    // Por ahora imprime en consola
    debugPrint('→ Abrir galería');
  }
}