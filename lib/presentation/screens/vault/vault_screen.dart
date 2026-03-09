import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import 'widgets/vault_expedition_cell.dart';

/// VaultScreen — Saved expeditions library.
///
/// Shows a vertical list of all generated calculations,
/// grouped by month. Each cell shows worker name, company
/// and calculation date.
///
/// Data is dummy for now — will be replaced with
/// GetCalculationHistory use case in Sprint 3.
class VaultScreen extends StatefulWidget {
  const VaultScreen({super.key});

  @override
  State<VaultScreen> createState() => _VaultScreenState();
}

class _VaultScreenState extends State<VaultScreen> {

  // ── Search ────────────────────────────────────────────────
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  // ── Dummy data — replace with GetCalculationHistory ───────
  final List<_ExpeditionItem> _expeditions = [
    _ExpeditionItem(
      workerName:     'Juan Carlos Mendoza Ríos',
      companyName:    'Grupo Industrial del Norte S.A.',
      calculatedAt:   DateTime(2024, 3, 15),
    ),
    _ExpeditionItem(
      workerName:     'María Fernanda López Cruz',
      companyName:    'Comercializadora Omega S.C.',
      calculatedAt:   DateTime(2024, 3, 10),
    ),
    _ExpeditionItem(
      workerName:     'Roberto Sánchez Vega',
      companyName:    'Constructora Pedregal S.A. de C.V.',
      calculatedAt:   DateTime(2024, 2, 28),
    ),
    _ExpeditionItem(
      workerName:     'Ana Patricia Torres Díaz',
      companyName:    'Servicios Corporativos MTY',
      calculatedAt:   DateTime(2024, 2, 14),
    ),
    _ExpeditionItem(
      workerName:     'Luis Alejandro Herrera Mora',
      companyName:    'Grupo Industrial del Norte S.A.',
      calculatedAt:   DateTime(2024, 1, 22),
    ),
  ];

  // ── Filtered list based on search query ───────────────────
  List<_ExpeditionItem> get _filtered {
    if (_searchQuery.isEmpty) return _expeditions;
    final q = _searchQuery.toLowerCase();
    return _expeditions.where((e) =>
      e.workerName.toLowerCase().contains(q) ||
      e.companyName.toLowerCase().contains(q),
    ).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.midnightDark,

      // ── App bar ─────────────────────────────────────────
      appBar: AppBar(
        title: const Text('Bóveda'),
        automaticallyImplyLeading: false,
      ),

      body: Column(
        children: [
          // ── Search bar ──────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: TextField(
              controller: _searchController,
              onChanged: (value) => setState(() => _searchQuery = value),
              style: const TextStyle(
                color: AppColors.cloudWhite,
                fontSize: 14,
              ),
              decoration: const InputDecoration(
                hintText: 'Buscar por trabajador o empresa...',
                prefixIcon: Icon(Icons.search_rounded),
              ),
            ),
          ),

          // ── List ────────────────────────────────────────
          Expanded(
            child: _filtered.isEmpty
                ? _EmptyState(isSearching: _searchQuery.isNotEmpty)
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
                    itemCount: _filtered.length,
                    separatorBuilder: (_, __) => const Divider(
                      height: 1,
                      indent: 74, // aligns with text, after icon
                    ),
                    itemBuilder: (context, index) {
                      final item = _filtered[index];
                      return VaultExpeditionCell(
                        workerName:   item.workerName,
                        companyName:  item.companyName,
                        calculatedAt: item.calculatedAt,
                        onTap: () => debugPrint(
                          '→ Abrir expediente: ${item.workerName}',
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

// ── Empty state ───────────────────────────────────────────────
class _EmptyState extends StatelessWidget {
  final bool isSearching;

  const _EmptyState({required this.isSearching});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isSearching
                ? Icons.search_off_rounded
                : Icons.folder_open_outlined,
            color: AppColors.slateGray,
            size: 48,
          ),
          const SizedBox(height: 16),
          Text(
            isSearching
                ? 'Sin resultados para\n"${""}"'
                : 'Sin expedientes guardados.',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.slateGray,
              height: 1.5,
            ),
          ),
          if (!isSearching) ...[
            const SizedBox(height: 8),
            const Text(
              'Sus cálculos guardados aparecerán aquí.',
              style: TextStyle(
                fontSize: 12,
                color: AppColors.slateGray,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// ── Local data model — temporary ──────────────────────────────
class _ExpeditionItem {
  final String workerName;
  final String companyName;
  final DateTime calculatedAt;

  const _ExpeditionItem({
    required this.workerName,
    required this.companyName,
    required this.calculatedAt,
  });
}