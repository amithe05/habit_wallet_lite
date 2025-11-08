import 'package:habbit_wallet_lite/features/transactions/data/datasources/transaction_local_source.dart';
import 'package:habbit_wallet_lite/features/transactions/domain/entities/transaction.dart';
import 'package:habbit_wallet_lite/features/transactions/domain/repositaries/transaction_repository.dart';
import 'package:hive/hive.dart';

import '../datasources/mock_transaction_api.dart';
import '../models/transaction_model.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final MockTransactionApi remoteDataSource;
  final TransactionLocalDataSource localDataSource;

  TransactionRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<List<TransactionEntity>> getTransactions() async {
    try {
      final remoteTransactions = await remoteDataSource.fetchTransactions();

      await localDataSource.saveTransactions(remoteTransactions);

      return remoteTransactions.map((e) => e.toEntity()).toList();
    } catch (e) {
      final cachedTransactions = await localDataSource.getCachedTransactions();

      return cachedTransactions.map((e) => e.toEntity()).toList();
    }
  }

  @override
  Future<void> saveTransaction(TransactionEntity entity) async {
    final model = TransactionModel.fromEntity(entity);
    await localDataSource.saveTransaction(model);
  }

  @override
  Future<void> updateTransaction(TransactionEntity entity) async {
    final model = TransactionModel.fromEntity(entity);
    await localDataSource.saveTransaction(model);
  }

  Future<void> deleteTransaction(String id) async {
    final box = await Hive.openBox<TransactionModel>('transactions');
    await box.delete(id);
  }
}
