import 'package:hive_flutter/hive_flutter.dart';
import '../models/transaction_model.dart';

abstract class TransactionLocalDataSource {
  Future<void> saveTransactions(List<TransactionModel> transactions);
  Future<List<TransactionModel>> getCachedTransactions();
  Future<void> saveTransaction(TransactionModel tx);
}

class TransactionLocalDataSourceImpl implements TransactionLocalDataSource {
  static const _boxName = 'transactions_box';

  @override
  Future<void> saveTransactions(List<TransactionModel> transactions) async {
    final box = await Hive.openBox(_boxName);
    final data = transactions.map((tx) => tx.toJson()).toList();
    await box.put('transactions', data);
  }

  @override
  Future<List<TransactionModel>> getCachedTransactions() async {
    final box = await Hive.openBox(_boxName);
    final cachedData = box.get('transactions') as List?;
    if (cachedData == null) return [];
    return cachedData
        .map((e) => TransactionModel.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }

  Future<void> saveTransaction(TransactionModel tx) async {
    final box = await Hive.openBox<TransactionModel>('transactions');
    await box.put(tx.id, tx);
  }
}

Future<void> deleteTransaction(String id) async {
  final box = await Hive.openBox<TransactionModel>('transactions');
  await box.delete(id);
}
