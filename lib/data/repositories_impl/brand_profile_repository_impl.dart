import '../../domain/entities/brand_profile.dart';
import '../../domain/entities/profile_type.dart';
import '../../domain/repositories/brand_profile_repository.dart';

/// Temporary in-memory implementation of BrandProfileRepository.
/// Will be replaced with SQLite + BrandDao in Sprint 3.
class BrandProfileRepositoryImpl implements BrandProfileRepository {

  // In-memory store — resets on app restart until SQLite is wired
  BrandProfile? _stored;

  @override
  Future<bool> save(BrandProfile profile) async {
    _stored = profile;
    return true;
  }

  @override
  Future<BrandProfile?> get() async => _stored;

  @override
  Future<bool> delete() async {
    _stored = null;
    return true;
  }
}