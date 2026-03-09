import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

/// StepProgressBar — Barra de progreso por pasos estilo stories.
///
/// Muestra [totalSteps] segmentos horizontales separados por gaps.
/// El segmento activo se llena con oxfordGold, los completados
/// con oxfordGoldDim, y los pendientes con borderSubtle.
///
/// No tiene temporización — avanza por interacción del usuario.
///
/// Uso:
///   StepProgressBar(totalSteps: 3, currentStep: 0) // primer paso
///   StepProgressBar(totalSteps: 3, currentStep: 1) // segundo paso
///   StepProgressBar(totalSteps: 3, currentStep: 2) // tercer paso
class StepProgressBar extends StatelessWidget {
  /// Número total de pasos del flujo.
  final int totalSteps;

  /// Índice del paso activo (0-based).
  final int currentStep;

  /// Altura de cada segmento. Default: 3.
  final double height;

  /// Espacio entre segmentos. Default: 4.
  final double gap;

  /// Color del segmento completado. Default: oxfordGoldDim.
  final Color? completedColor;

  /// Color del segmento activo. Default: oxfordGold.
  final Color? activeColor;

  /// Color del segmento pendiente. Default: borderSubtle.
  final Color? pendingColor;

  const StepProgressBar({
    super.key,
    required this.totalSteps,
    required this.currentStep,
    this.height = 3,
    this.gap = 4,
    this.completedColor,
    this.activeColor,
    this.pendingColor,
  }) : assert(totalSteps > 0, 'totalSteps debe ser mayor a 0'),
       assert(currentStep >= 0, 'currentStep debe ser >= 0'),
       assert(currentStep < totalSteps, 'currentStep debe ser < totalSteps');

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(totalSteps, (index) {
        return Expanded(
          child: Padding(
            // Gap entre segmentos — solo a la derecha excepto el último
            padding: EdgeInsets.only(right: index < totalSteps - 1 ? gap : 0),
            child: _Segment(
              state: _stateFor(index),
              height: height,
              completedColor: completedColor ?? AppColors.oxfordGoldDim,
              activeColor: activeColor ?? AppColors.oxfordGold,
              pendingColor: pendingColor ?? AppColors.borderSubtle,
            ),
          ),
        );
      }),
    );
  }

  /// Determina el estado de cada segmento según el paso actual.
  _SegmentState _stateFor(int index) {
    if (index < currentStep) return _SegmentState.completed;
    if (index == currentStep) return _SegmentState.active;
    return _SegmentState.pending;
  }
}

// ── Estado de cada segmento ───────────────────────────────────
enum _SegmentState { completed, active, pending }

// ── Segmento individual ───────────────────────────────────────
class _Segment extends StatelessWidget {
  final _SegmentState state;
  final double height;
  final Color completedColor;
  final Color activeColor;
  final Color pendingColor;

  const _Segment({
    required this.state,
    required this.height,
    required this.completedColor,
    required this.activeColor,
    required this.pendingColor,
  });

  Color get _color => switch (state) {
    _SegmentState.completed => completedColor,
    _SegmentState.active    => activeColor,
    _SegmentState.pending   => pendingColor,
  };

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      // Transición suave al cambiar de estado
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      height: height,
      decoration: BoxDecoration(
        color: _color,
        borderRadius: BorderRadius.circular(height / 2),
      ),
    );
  }
}