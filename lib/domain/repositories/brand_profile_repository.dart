import '../entities/brand_profile.dart';

/// Contract — defines what operations are available for BrandProfile.
/// The data layer implements this, the domain layer only knows this interface.
abstract interface class BrandProfileRepository {

  /// Persists the brand profile locally.
  /// Returns true if the operation succeeded.
  Future<bool> save(BrandProfile profile);

  /// Retrieves the stored brand profile.
  /// Returns null if no profile has been saved yet.
  Future<BrandProfile?> get();

  /// Removes the stored brand profile.
  /// Used when resetting the app from Settings.
  Future<bool> delete();
}