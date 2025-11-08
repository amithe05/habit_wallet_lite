import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:habbit_wallet_lite/features/transactions/domain/entities/transaction.dart';

class CategoryPieChart extends StatelessWidget {
  final List<TransactionEntity> transactions;

  const CategoryPieChart({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    final totals = <String, double>{};
    for (final tx in transactions) {
      if (tx.type.toLowerCase() == 'debit') {
        totals[tx.category] = (totals[tx.category] ?? 0) + tx.amount.abs();
      }
    }

    if (totals.isEmpty) {
      return const Center(child: Text('No transaction data available.'));
    }

    final totalAmount = totals.values.fold(0.0, (a, b) => a + b);

    final categoryColors = _generateCategoryColors(totals.keys.toList());

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Category Breakdown',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),

          SizedBox(
            height: 220,
            child: PieChart(
              PieChartData(
                sectionsSpace: 2,
                centerSpaceRadius: 60,
                sections: totals.entries.map((entry) {
                  final color = categoryColors[entry.key]!;
                  final percent = (entry.value / totalAmount * 100)
                      .toStringAsFixed(1);
                  return PieChartSectionData(
                    color: color,
                    value: entry.value,
                    radius: 60,
                    title: '',
                    showTitle: false,
                  );
                }).toList(),
              ),
            ),
          ),

          const SizedBox(height: 25),

          Wrap(
            alignment: WrapAlignment.center,
            spacing: 12,
            runSpacing: 8,
            children: totals.entries.map((entry) {
              final color = categoryColors[entry.key]!;
              final percent = (entry.value / totalAmount * 100).toStringAsFixed(
                1,
              );
              return _LegendItem(
                color: color,
                label: '${entry.key} ($percent%)',
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Map<String, Color> _generateCategoryColors(List<String> categories) {
    final colors = [
      Colors.blueAccent,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.redAccent,
      Colors.teal,
      Colors.pink,
      Colors.amber,
      Colors.indigo,
    ];
    final Map<String, Color> map = {};
    for (int i = 0; i < categories.length; i++) {
      map[categories[i]] = colors[i % colors.length];
    }
    return map;
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendItem({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(width: 12, height: 12, color: color),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
