import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/coordinator/app_coordinator.dart';
import '../../widgets/common/aequo_icon.dart';

/// WelcomeScreen — Primera pantalla que ve el usuario.
///
/// La navegación ocurre aquí usando su propio context,
/// que sí es descendiente del Navigator creado por MaterialApp.
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {

  late final AnimationController _controller;

  late final Animation<double> _fadeGreeting;
  late final Animation<Offset> _slideGreeting;
  late final Animation<double> _fadeLogo;
  late final Animation<double> _scaleLogo;
  late final Animation<double> _fadeAppName;
  late final Animation<Offset> _slideAppName;
  late final Animation<double> _fadeButtons;
  late final Animation<Offset> _slideButtons;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );

    // Greeting — aparece primero (0% → 40%)
    _fadeGreeting = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.4, curve: Curves.easeOut),
    );
    _slideGreeting = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.4, curve: Curves.easeOut),
    ));

    // App name — aparece segundo (15% → 55%)
    _fadeAppName = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.15, 0.55, curve: Curves.easeOut),
    );
    _slideAppName = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.15, 0.55, curve: Curves.easeOut),
    ));

    // Icon — aparece tercero con escala (30% → 75%)
    _fadeLogo = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.30, 0.75, curve: Curves.easeOut),
    );
    _scaleLogo = Tween<double>(begin: 0.7, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.30, 0.75, curve: Curves.elasticOut),
      ),
    );

    // Buttons — aparecen al final (55% → 100%)
    _fadeButtons = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.55, 1.0, curve: Curves.easeOut),
    );
    _slideButtons = Tween<Offset>(
      begin: const Offset(0, 0.4),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.55, 1.0, curve: Curves.easeOut),
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Navegación usando el context de este widget —
  // que sí es descendiente del Navigator del MaterialApp
  void _onGetStarted() {
    AppCoordinator.instance.goToOnboarding();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: AppColors.midnightDark,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              const Spacer(flex: 2),

              // 1. Texto de bienvenida
              FadeTransition(
                opacity: _fadeGreeting,
                child: SlideTransition(
                  position: _slideGreeting,
                  child: Column(
                    children: [
                      Container(
                        width: 40,
                        height: 2,
                        decoration: BoxDecoration(
                          color: AppColors.oxfordGold,
                          borderRadius: BorderRadius.circular(1),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Su despacho,\nen cada negociación.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: AppColors.slateLight,
                          letterSpacing: 0.3,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // 2. Nombre de la app
              FadeTransition(
                opacity: _fadeAppName,
                child: SlideTransition(
                  position: _slideAppName,
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'A',
                          style: TextStyle(
                            fontSize: 52,
                            fontWeight: FontWeight.w700,
                            color: AppColors.oxfordGold,
                            letterSpacing: -1.5,
                            height: 1,
                          ),
                        ),
                        TextSpan(
                          text: 'equo',
                          style: TextStyle(
                            fontSize: 52,
                            fontWeight: FontWeight.w300,
                            color: AppColors.cloudWhite,
                            letterSpacing: -1.5,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // 3. Ícono de la app
              FadeTransition(
                opacity: _fadeLogo,
                child: ScaleTransition(
                  scale: _scaleLogo,
                  child: const AequoIcon(),
                ),
              ),

              const Spacer(flex: 3),

              // 4. Botones
              FadeTransition(
                opacity: _fadeButtons,
                child: SlideTransition(
                  position: _slideButtons,
                  child: _WelcomeButtons(
                    onGetStarted: _onGetStarted,
                  ),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class _WelcomeButtons extends StatelessWidget {
  final VoidCallback onGetStarted;

  const _WelcomeButtons({required this.onGetStarted});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton(
            onPressed: onGetStarted,
            child: const Text('Comenzar'),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Cálculos basados en la Ley Federal del Trabajo vigente.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 10,
            color: AppColors.slateGray,
            letterSpacing: 0.2,
          ),
        ),
      ],
    );
  }
}