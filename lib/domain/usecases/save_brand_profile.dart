import '../entities/brand_profile.dart';
import '../repositories/brand_profile_repository.dart';

/// UC: persists a BrandProfile after onboarding is completed.
/// Validates that the profile is complete before saving.
class SaveBrandProfile {
  final BrandProfileRepository _repository;

  const SaveBrandProfile(this._repository);

  /// Returns true if saved successfully.
  /// Returns false if the profile is incomplete or save failed.
  Future<bool> call(BrandProfile profile) async {
    if (!profile.isComplete) return false;
    return _repository.save(profile);
  }
}