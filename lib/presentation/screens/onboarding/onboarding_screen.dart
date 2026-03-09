import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../domain/entities/brand_profile.dart';
import '../../../domain/entities/profile_type.dart';
import '../../../domain/usecases/save_brand_profile.dart';
import '../../../data/repositories_impl/brand_profile_repository_impl.dart';
import '../../widgets/common/step_progress_bar.dart';
import 'widgets/steps/step_profile_type.dart';
import 'widgets/steps/step_display_name.dart';
import 'widgets/steps/step_fiscal_address.dart';
import 'widgets/steps/step_logo_picker.dart';
import '../../../core/coordinator/app_coordinator.dart';

/// OnboardingScreen — Initial setup flow.
///
/// Steps vary based on selected profile type:
///   Individual: [ProfileType] → [DisplayName]
///   Business:   [ProfileType] → [DisplayName] → [FiscalAddress] → [LogoPicker]
///
/// PageView uses a fixed 4-page list to avoid rebuilds during transitions.
/// Steps 2 & 3 are always in the PageView but only reachable for Business.
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  // ── State ─────────────────────────────────────────────────
  ProfileType? _selectedType;
  final TextEditingController _nameController    = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  String? _logoPath;
  int _currentStep = 0;

  final PageController _pageController = PageController();

  // ── Use case ──────────────────────────────────────────────
  final _saveBrandProfile = SaveBrandProfile(BrandProfileRepositoryImpl());

  // ── Steps count ───────────────────────────────────────────
  /// Total steps based on profile type.
  /// PageView always has 4 pages — totalSteps controls the progress bar.
  int get _totalSteps =>
      _selectedType == ProfileType.business ? 4 : 2;

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  // ── Validation ────────────────────────────────────────────
  bool get _canAdvance => switch (_currentStep) {
    0 => _selectedType != null,
    1 => _nameController.text.trim().isNotEmpty,
    _ => true,
  };

  // ── Navigation ────────────────────────────────────────────
  void _nextStep() {
    if (!_canAdvance) {
      _showValidationHint();
      return;
    }

    if (_currentStep < _totalSteps - 1) {
      setState(() => _currentStep++);
      _pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOutCubic,
      );
    } else {
      _finishOnboarding();
    }
  }

  Future<void> _finishOnboarding() async {
    final profile = BrandProfile(
      type:          _selectedType!,
      displayName:   _nameController.text.trim(),
      fiscalAddress: _addressController.text.trim().isEmpty
          ? null
          : _addressController.text.trim(),
      logoPath: _logoPath,
    );

    final saved = await _saveBrandProfile(profile);
    if (!mounted) return;

    if (saved) {
      AppCoordinator.instance.onboardingCompleted();
    } else {
      _showValidationHint();
    }
  }

  void _showValidationHint() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Por favor complete los campos requeridos.'),
      ),
    );
  }

  // ── Build ─────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.midnightDark,
      body: SafeArea(
        child: Column(
          children: [
            // ── Progress bar ────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
              child: StepProgressBar(
                totalSteps:  _totalSteps,
                currentStep: _currentStep,
              ),
            ),

            // ── Steps ────────────────────────────────────
            Expanded(
              child: PageView(
                controller: _pageController,
                // Disabled — advances only via button
                physics: const NeverScrollableScrollPhysics(),
                // Fixed 4 pages — avoids PageView rebuild on type change
                children: [
                  // Step 0 — profile type selection
                  StepProfileType(
                    selectedType:   _selectedType,
                    onTypeSelected: (type) => setState(() {
                      _selectedType = type;
                    }),
                  ),

                  // Step 1 — display name
                  StepDisplayName(
                    profileType: _selectedType ?? ProfileType.individual,
                    controller:  _nameController,
                  ),

                  // Step 2 — fiscal address (business only, always in tree)
                  StepFiscalAddress(controller: _addressController),

                  // Step 3 — logo picker (business only, always in tree)
                  StepLogoPicker(
                    selectedLogoPath: _logoPath,
                    onLogoPicked: (path) => setState(() => _logoPath = path),
                    onSkip: _nextStep,
                  ),
                ],
              ),
            ),

            // ── Next button ──────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: _nextStep,
                  child: Text(
                    _currentStep == _totalSteps - 1
                        ? 'Finalizar'
                        : 'Continuar',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}