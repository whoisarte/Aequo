import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

/// SettingsSection — A labeled group of settings rows.
///
/// Wraps its children in a rounded card with a section title above.
class SettingsSection extends StatelessWidget {
  /// Optional section label shown above the card.
  final String? title;

  final List<Widget> children;

  const SettingsSection({
    super.key,
    this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Section title ──────────────────────────────
        if (title != null) ...[
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 8),
            child: Text(
              title!.toUpperCase(),
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: AppColors.slateGray,
                letterSpacing: 1.5,
              ),
            ),
          ),
        ],

        // ── Rows card ──────────────────────────────────
        Container(
          decoration: BoxDecoration(
            color: AppColors.midnightLight,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.borderSubtle),
          ),
          child: Column(
            children: [
              for (int i = 0; i < children.length; i++) ...[
                children[i],
                // Divider between rows — not after the last one
                if (i < children.length - 1)
                  const Divider(
                    height: 1,
                    indent: 50,
                    endIndent: 0,
                  ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}