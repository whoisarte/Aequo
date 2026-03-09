import 'profile_type.dart';
/// Represents the lawyer or firm identity used across the app.
/// Printed on every generated PDF document.
class BrandProfile {
  final ProfileType type;

  /// Always required — lawyer name or firm legal name.
  final String displayName;

  /// Only required when type == ProfileType.business.
  final String? fiscalAddress;

  /// Only required when type == ProfileType.business.
  /// Stored as a local file path after picking from gallery.
  final String? logoPath;

  /// Optional — shown on PDF footer.
  final String? barLicense;

  const BrandProfile({
    required this.type,
    required this.displayName,
    this.fiscalAddress,
    this.logoPath,
    this.barLicense,
  });

  /// Returns true when all required fields for the given type are filled.
  bool get isComplete => switch (type) {
    ProfileType.individual => displayName.isNotEmpty,
    ProfileType.business   => displayName.isNotEmpty &&
                              fiscalAddress != null &&
                              fiscalAddress!.isNotEmpty,
  };
}