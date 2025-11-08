import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:habbit_wallet_lite/features/transactions/domain/entities/transaction.dart';
import 'package:intl/intl.dart';

class TransactionChart extends StatelessWidget {
  final List<TransactionEntity> transactions;

  const TransactionChart({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    if (transactions.isEmpty) {
      return const Center(child: Text('No transactions to display.'));
    }

    final monthlyTotals = <String, double>{};
    for (final tx in transactions) {
      if (tx.type.toLowerCase() == 'debit') {
        final month = DateFormat('MMM yyyy').format(tx.date);
        monthlyTotals[month] = (monthlyTotals[month] ?? 0) + tx.amount.abs();
      }
    }

    final sortedEntries = monthlyTotals.entries.toList()
      ..sort((a, b) {
        final aDate = DateFormat('MMM yyyy').parse(a.key);
        final bDate = DateFormat('MMM yyyy').parse(b.key);
        return aDate.compareTo(bDate);
      });

    final barGroups = sortedEntries
        .asMap()
        .entries
        .map(
          (e) => BarChartGroupData(
            x: e.key,
            barRods: [
              BarChartRodData(
                toY: e.value.value,
                width: 14,
                borderRadius: BorderRadius.circular(4),
              ),
            ],
          ),
        )
        .toList();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Monthly Spending',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          AspectRatio(
            aspectRatio: 1.7,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                gridData: const FlGridData(show: false),
                borderData: FlBorderData(show: false),
                titlesData: FlTitlesData(
                  leftTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 36,
                      getTitlesWidget: (double value, TitleMeta meta) {
                        final index = value.toInt();
                        if (index < 0 || index >= sortedEntries.length) {
                          return const SizedBox.shrink();
                        }
                        final label = sortedEntries[index].key.split(' ')[0];
                        return SideTitleWidget(
                          meta: meta,
                          child: Text(
                            label,
                            style: const TextStyle(fontSize: 10),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                barGroups: barGroups,
                barTouchData: BarTouchData(
                  enabled: true,
                  touchTooltipData: BarTouchTooltipData(
                    getTooltipItem: (group, _, rod, __) {
                      final label = sortedEntries[group.x.toInt()].key;
                      final value = rod.toY.toStringAsFixed(2);
                      return BarTooltipItem(
                        '$label\n₹$value',
                        const TextStyle(color: Colors.white),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
