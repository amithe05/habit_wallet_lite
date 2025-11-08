import 'package:flutter/material.dart';
import 'package:habbit_wallet_lite/features/transactions/domain/entities/transaction.dart';
import 'package:uuid/uuid.dart';

class AddTransactionPage extends StatefulWidget {
  final TransactionEntity? existingTx;

  const AddTransactionPage({super.key, this.existingTx});

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _categoryController = TextEditingController();
  final _narrationController = TextEditingController();
  String _type = 'Expense';
  late bool _isEdit;

  @override
  void initState() {
    super.initState();
    _isEdit = widget.existingTx != null;

    if (_isEdit) {
      final tx = widget.existingTx!;
      _amountController.text = tx.amount.toString();
      _categoryController.text = tx.category;
      _narrationController.text = tx.narration;
      _type = tx.type;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEdit ? 'Edit Transaction' : 'Add Transaction'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _amountController,
                decoration: const InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                validator: (v) =>
                    v == null || v.isEmpty ? 'Enter amount' : null,
              ),
              TextFormField(
                controller: _categoryController,
                decoration: const InputDecoration(labelText: 'Category'),
                validator: (v) =>
                    v == null || v.isEmpty ? 'Enter category' : null,
              ),
              TextFormField(
                controller: _narrationController,
                decoration: const InputDecoration(labelText: 'Narration'),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _type,
                decoration: const InputDecoration(labelText: 'Type'),
                items: ['Expense', 'Income']
                    .map((t) => DropdownMenuItem(value: t, child: Text(t)))
                    .toList(),
                onChanged: (v) => setState(() => _type = v!),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final tx = TransactionEntity(
                      id: _isEdit ? widget.existingTx!.id : const Uuid().v4(),
                      amount: double.parse(_amountController.text),
                      category: _categoryController.text,
                      date: _isEdit ? widget.existingTx!.date : DateTime.now(),
                      type: _type,
                      narration: _narrationController.text,
                      editedLocally: true,
                    );

                    Navigator.pop(context, tx);
                  }
                },
                child: Text(_isEdit ? 'Save Changes' : 'Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
