import '../entities/brand_profile.dart';
import '../repositories/brand_profile_repository.dart';

/// UC: retrieves the stored BrandProfile.
/// Used by the PDF generator and Settings screen.
class GetBrandProfile {
  final BrandProfileRepository _repository;

  const GetBrandProfile(this._repository);

  /// Returns null if no profile has been saved yet.
  Future<BrandProfile?> call() => _repository.get();
}