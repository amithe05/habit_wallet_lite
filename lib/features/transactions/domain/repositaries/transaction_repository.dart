import 'package:habbit_wallet_lite/features/transactions/domain/entities/transaction.dart';

abstract class TransactionRepository {
  Future<List<TransactionEntity>> getTransactions();
  Future<void> saveTransaction(TransactionEntity entity);
}
