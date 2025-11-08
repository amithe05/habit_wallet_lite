import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/transaction_model.dart';

class MockTransactionApi {
  Future<List<TransactionModel>> fetchTransactions() async {
    
    final data = await rootBundle.loadString('assets/mock/transactions.json');
    final parsed = json.decode(data);

    
    final transactionsNode =
        parsed['BARB0KIMXXX'][0]['decrypted_data']['Account']['Transactions']['Transaction'];

    
    final txList = transactionsNode is List
        ? transactionsNode
        : [transactionsNode];

    print('✅ Found ${txList.length} transactions in JSON');

    
    return txList.map<TransactionModel>((e) {
      final type = e['type'] ?? '';
      final narration = e['narration'] ?? '';
      final date =
          DateTime.tryParse(e['transactionTimestamp'] ?? '') ?? DateTime.now();
      final amount = double.tryParse(e['amount'].toString()) ?? 0.0;
      final category = _inferCategory(narration);

      return TransactionModel(
        id: e['txnId']?.toString().isNotEmpty == true
            ? e['txnId'].toString()
            : date.millisecondsSinceEpoch.toString(),
        amount: amount,
        category: category,
        date: date,
        type: type,
        narration: narration,
      );
    }).toList();
  }

  String _inferCategory(String narration) {
    final n = narration.toUpperCase();
    if (n.contains('SALARY')) return 'Salary';
    if (n.contains('RENT')) return 'Rent';
    if (n.contains('POLICYBAZAAR')) return 'Insurance';
    if (n.contains('PETROLEUM')) return 'Fuel';
    if (n.contains('ELECTRICITY') || n.contains('MSEB')) return 'Bills';
    if (n.contains('AMAZON') || n.contains('MYNTRA')) return 'Shopping';
    if (n.contains('MUTUALFUNDS') || n.contains('INVESTMENT'))
      return 'Investment';
    if (n.contains('ATM')) return 'Withdrawal';
    if (n.contains('TUTION')) return 'Education';
    if (n.contains('DIVIDEND')) return 'Dividend';
    return 'Other';
  }
}
