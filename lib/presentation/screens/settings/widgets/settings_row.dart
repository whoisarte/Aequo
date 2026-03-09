import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

/// SettingsRow — A single tappable row inside a settings section.
///
/// Reusable for any action row: edit profile, legal notes, etc.
class SettingsRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;

  /// If true, renders the title in terracottaRed — used for destructive actions.
  final bool isDestructive;

  /// Trailing widget override — defaults to chevron if onTap is set.
  final Widget? trailing;

  const SettingsRow({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.onTap,
    this.isDestructive = false,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final titleColor = isDestructive
        ? AppColors.terracottaRed
        : AppColors.cloudWhite;

    final iconColor = isDestructive
        ? AppColors.terracottaRed
        : AppColors.slateGray;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            // ── Icon ──────────────────────────────────
            Icon(icon, color: iconColor, size: 20),

            const SizedBox(width: 14),

            // ── Labels ────────────────────────────────
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: titleColor,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      subtitle!,
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.slateGray,
                        height: 1.4,
                      ),
                    ),
                  ],
                ],
              ),
            ),

            // ── Trailing ──────────────────────────────
            trailing ??
                (onTap != null
                    ? const Icon(
                        Icons.chevron_right_rounded,
                        color: AppColors.slateGray,
                        size: 18,
                      )
                    : const SizedBox.shrink()),
          ],
        ),
      ),
    );
  }
}