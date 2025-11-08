import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habbit_wallet_lite/features/transactions/domain/entities/transaction.dart';
import 'package:hive/hive.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

@freezed
@HiveType(typeId: 0)
class TransactionModel with _$TransactionModel {
  const factory TransactionModel({
    @HiveField(0) required String id,
    @HiveField(1) required double amount,
    @HiveField(2) required String category,
    @HiveField(3) required DateTime date,
    @HiveField(4) required String type,
    @HiveField(5) required String narration,

    @Default(false)
    @HiveField(6)
    @JsonKey(defaultValue: false)
    @Default(false)
    bool editedLocally,
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);

  factory TransactionModel.fromEntity(TransactionEntity e) => TransactionModel(
    id: e.id,
    amount: e.amount,
    category: e.category,
    date: e.date,
    type: e.type,
    narration: e.narration,
    editedLocally: e.editedLocally ?? false,
  );
}

extension TransactionModelMapper on TransactionModel {
  TransactionEntity toEntity() => TransactionEntity(
    id: id,
    amount: amount,
    category: category,
    date: date,
    type: type,
    narration: narration,
    editedLocally: editedLocally,
  );
}
