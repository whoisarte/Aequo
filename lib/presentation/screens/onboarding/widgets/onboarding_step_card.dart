import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

/// OnboardingStepCard — Contenedor de cada paso del onboarding.
///
/// Equivalente a una cell de UITableView en UIKit.
/// Ocupa todo el ancho del PageView y muestra un botón central
/// que imprime el siguiente step en consola.
///
/// Más adelante cada step tendrá su propio contenido —
/// por ahora solo muestra el número de paso y el botón.
class OnboardingStepCard extends StatelessWidget {
  /// Índice de este paso (0-based).
  final int stepIndex;

  /// Total de pasos — para calcular cuál es el siguiente.
  final int totalSteps;

  /// Llamado al presionar el botón central.
  final VoidCallback onNext;

  const OnboardingStepCard({
    super.key,
    required this.stepIndex,
    required this.totalSteps,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final isLastStep = stepIndex == totalSteps - 1;

    return Container(
      // Fondo midnightBlue — un nivel más claro que el scaffold
      color: AppColors.midnightBlue,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Indicador del paso actual — texto discreto
            Text(
              'Paso ${stepIndex + 1} de $totalSteps',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: AppColors.slateGray,
                letterSpacing: 1.5,
              ),
            ),

            const SizedBox(height: 32),

            // Botón central — imprime el siguiente step en consola
            SizedBox(
              width: 200,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  // Imprime el siguiente step en consola
                  if (!isLastStep) {
                    debugPrint('→ Siguiente step: ${stepIndex + 2}');
                  } else {
                    debugPrint('→ Onboarding completado');
                  }
                  onNext();
                },
                child: Text(isLastStep ? 'Finalizar' : 'Siguiente'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}