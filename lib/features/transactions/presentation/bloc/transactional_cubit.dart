import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habbit_wallet_lite/features/transactions/data/respositaries/transaction_repo_impl.dart';
import 'package:habbit_wallet_lite/features/transactions/domain/entities/transaction.dart';
import 'package:habbit_wallet_lite/features/transactions/presentation/bloc/transactional_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  final TransactionRepositoryImpl repository;

  TransactionCubit(this.repository) : super(TransactionInitial());

  Future<void> loadTransactions() async {
    emit(TransactionLoading());
    try {
      final transactions = await repository.getTransactions();
      emit(TransactionLoaded(transactions));
    } catch (e) {
      emit(TransactionError(e.toString()));
    }
  }

  void addOrUpdateTransaction(TransactionEntity transaction) async {
    try {
      await repository.saveTransaction(transaction); // implement in repo
      await loadTransactions();
    } catch (e) {
      emit(TransactionError('Failed to save transaction: $e'));
    }
  }

  void addTransaction(TransactionEntity tx) async {
    try {
      await repository.saveTransaction(tx);

      if (state is TransactionLoaded) {
        final currentState = state as TransactionLoaded;
        final updatedList = List<TransactionEntity>.from(
          currentState.transactions,
        )..add(tx);
        emit(TransactionLoaded(updatedList));
      } else {
        emit(TransactionLoaded([tx]));
      }
    } catch (e) {
      emit(TransactionError('Failed to add transaction: $e'));
    }
  }
}
