import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

/// AequoIcon — Ícono de la app reutilizable.
///
/// Muestra una balanza estilizada sobre fondo midnightLight
/// con resplandor dorado. Acepta [size] para escalar en
/// cualquier contexto (welcome, splash, about, PDF header, etc.)
///
/// Uso:
///   AequoIcon()              // tamaño default 120
///   AequoIcon(size: 64)      // versión compacta
///   AequoIcon(size: 200)     // versión hero
class AequoIcon extends StatelessWidget {
  /// Tamaño del lado del ícono (ancho = alto). Default: 120.
  final double size;

  /// Radio de las esquinas redondeadas. Por defecto escala con [size].
  final double? borderRadius;

  const AequoIcon({
    super.key,
    this.size = 120,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    // Radio proporcional al tamaño si no se especifica
    final radius = borderRadius ?? size * 0.233;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.midnightLight,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          color: AppColors.borderStrong,
          width: 1.5,
        ),
        boxShadow: [
          // Resplandor dorado proporcional al tamaño
          BoxShadow(
            color: AppColors.oxfordGold.withValues(alpha: 0.15),
            blurRadius: size * 0.267,
            offset: Offset(0, size * 0.067),
          ),
        ],
      ),
      child: CustomPaint(
        painter: _ScalePainter(),
      ),
    );
  }
}

/// Pinta una balanza estilizada usando Canvas.
/// Las coordenadas son relativas al tamaño del widget (usa cx/cy).
class _ScalePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;

    // Factor de escala respecto al tamaño de diseño original (120px)
    final s = size.width / 120;

    // ── Pintura: líneas doradas ───────────────────────────
    final goldStroke = Paint()
      ..color = AppColors.oxfordGold
      ..strokeWidth = 2.0 * s
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // ── Pintura: fill translúcido de platillos ────────────
    final plateFill = Paint()
      ..color = AppColors.cloudWhite.withValues(alpha: 0.08)
      ..style = PaintingStyle.fill;

    final plateBorder = Paint()
      ..color = AppColors.cloudWhite.withValues(alpha: 0.5)
      ..strokeWidth = 1.5 * s
      ..style = PaintingStyle.stroke;

    // Mástil vertical central
    canvas.drawLine(
      Offset(cx, cy - 28 * s),
      Offset(cx, cy + 30 * s),
      goldStroke,
    );

    // Base horizontal del mástil
    canvas.drawLine(
      Offset(cx - 16 * s, cy + 30 * s),
      Offset(cx + 16 * s, cy + 30 * s),
      goldStroke,
    );

    // Viga horizontal (ligera inclinación para dinamismo)
    final leftEnd  = Offset(cx - 30 * s, cy - 18 * s);
    final rightEnd = Offset(cx + 30 * s, cy - 22 * s);
    canvas.drawLine(leftEnd, rightEnd, goldStroke);

    // Pivote central — círculo dorado relleno
    canvas.drawCircle(
      Offset(cx, cy - 20 * s),
      3 * s,
      goldStroke..style = PaintingStyle.fill,
    );
    goldStroke.style = PaintingStyle.stroke;

    // Cadena izquierda
    canvas.drawLine(leftEnd, Offset(cx - 30 * s, cy - 2 * s), goldStroke);

    // Cadena derecha
    canvas.drawLine(rightEnd, Offset(cx + 30 * s, cy - 6 * s), goldStroke);

    // Platillo izquierdo
    final leftPlate = Rect.fromCenter(
      center: Offset(cx - 30 * s, cy * 1.0),
      width:  28 * s,
      height: 8 * s,
    );
    canvas.drawOval(leftPlate, plateFill);
    canvas.drawOval(leftPlate, plateBorder);

    // Platillo derecho (ligeramente más alto)
    final rightPlate = Rect.fromCenter(
      center: Offset(cx + 30 * s, cy - 4 * s),
      width:  28 * s,
      height: 8 * s,
    );
    canvas.drawOval(rightPlate, plateFill);
    canvas.drawOval(rightPlate, plateBorder);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}