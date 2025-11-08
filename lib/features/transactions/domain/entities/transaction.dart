class TransactionEntity {
  final String id;
  final double amount;
  final String category;
  final DateTime date;
  final String type;
  final String narration;
  final bool? editedLocally;

  TransactionEntity({
    required this.id,
    required this.amount,
    required this.category,
    required this.date,
    required this.type,
    required this.narration,
    required this.editedLocally,
  });
}
