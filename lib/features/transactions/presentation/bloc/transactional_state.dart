import 'package:equatable/equatable.dart';
import 'package:habbit_wallet_lite/features/transactions/domain/entities/transaction.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object?> get props => [];
}

class TransactionInitial extends TransactionState {}

class TransactionLoading extends TransactionState {}

class TransactionLoaded extends TransactionState {
  final List<TransactionEntity> transactions;
  final bool justAdded;

  const TransactionLoaded(this.transactions, {this.justAdded = false});

  @override
  List<Object?> get props => [transactions, justAdded];
}

class TransactionError extends TransactionState {
  final String message;

  const TransactionError(this.message);

  @override
  List<Object?> get props => [message];
}
