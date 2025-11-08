import 'package:flutter/material.dart';
import '../../domain/entities/transaction.dart';

class TransactionWidget extends StatelessWidget {
  final TransactionEntity tx;
  const TransactionWidget({super.key, required this.tx});

  @override
  Widget build(BuildContext context) {
    final color = tx.amount < 0 ? Colors.red : Colors.green;
    final amountText =
        '${tx.amount < 0 ? '-' : '+'} ₹${tx.amount.abs().toStringAsFixed(2)}';

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.1),
          child: Icon(
            tx.amount < 0 ? Icons.arrow_downward : Icons.arrow_upward,
            color: color,
          ),
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                tx.category,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),

            if (tx.editedLocally == true)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'Edited locally',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.orange,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
          ],
        ),
        subtitle: Text(
          tx.narration.isNotEmpty
              ? tx.narration
              : tx.date.toIso8601String().split('T').first,
        ),
        trailing: Text(
          amountText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: color,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
