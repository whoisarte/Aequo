import 'dart:io';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../domain/entities/brand_profile.dart';
import '../../../../domain/entities/profile_type.dart';

/// SettingsProfileHeader — Logo + name header at the top of Settings.
///
/// Shows the firm logo (or initials placeholder), display name,
/// profile type badge, and fiscal address if available.
class SettingsProfileHeader extends StatelessWidget {
  final BrandProfile profile;

  const SettingsProfileHeader({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
      child: Row(
        children: [
          // ── Logo / initials ───────────────────────────
          _LogoWidget(
            logoPath:    profile.logoPath,
            displayName: profile.displayName,
          ),

          const SizedBox(width: 16),

          // ── Name + type + address ─────────────────────
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile type badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.oxfordGold.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    profile.type == ProfileType.business
                        ? 'Persona Moral'
                        : 'Persona Física',
                    style: const TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w600,
                      color: AppColors.oxfordGold,
                      letterSpacing: 1,
                    ),
                  ),
                ),

                const SizedBox(height: 6),

                // Display name
                Text(
                  profile.displayName,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: AppColors.cloudWhite,
                    height: 1.2,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                // Fiscal address — business only
                if (profile.fiscalAddress != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    profile.fiscalAddress!,
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppColors.slateGray,
                      height: 1.4,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Logo widget ───────────────────────────────────────────────
class _LogoWidget extends StatelessWidget {
  final String? logoPath;
  final String displayName;

  const _LogoWidget({
    required this.logoPath,
    required this.displayName,
  });

  /// Returns the first letter of the display name as fallback.
  String get _initial => displayName.isNotEmpty
      ? displayName[0].toUpperCase()
      : '?';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        color: AppColors.midnightLight,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.borderStrong, width: 1.5),
      ),
      child: logoPath != null
          // Firm logo from file system
          ? ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.file(
                File(logoPath!),
                fit: BoxFit.cover,
              ),
            )
          // Initials fallback
          : Center(
              child: Text(
                _initial,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.oxfordGold,
                ),
              ),
            ),
    );
  }
}