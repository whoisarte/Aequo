import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

/// VaultExpeditionCell — Single row in the vault list.
///
/// Displays:
///   - File icon on the left
///   - Worker name as primary label
///   - Calculation date as secondary label
///   - Chevron on the right
///
/// Equivalent to a UITableViewCell in UIKit.
class VaultExpeditionCell extends StatelessWidget {
  final String workerName;
  final String companyName;
  final DateTime calculatedAt;
  final VoidCallback? onTap;

  const VaultExpeditionCell({
    super.key,
    required this.workerName,
    required this.companyName,
    required this.calculatedAt,
    this.onTap,
  });

  /// Formats the date as "DD MMM YYYY" — e.g. "12 Ene 2024"
  String get _formattedDate {
    const months = [
      'Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun',
      'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic',
    ];
    return '${calculatedAt.day} ${months[calculatedAt.month - 1]} ${calculatedAt.year}';
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            // ── File icon ─────────────────────────────
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: AppColors.oxfordGold.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.borderSubtle),
              ),
              child: const Icon(
                Icons.description_outlined,
                color: AppColors.oxfordGold,
                size: 20,
              ),
            ),

            const SizedBox(width: 14),

            // ── Labels ────────────────────────────────
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Worker name — primary
                  Text(
                    workerName,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.cloudWhite,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 3),

                  // Company + date — secondary
                  Text(
                    '$companyName · $_formattedDate',
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppColors.slateGray,
                      height: 1.3,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}