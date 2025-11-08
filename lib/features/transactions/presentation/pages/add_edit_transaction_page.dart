import 'package:flutter/material.dart';
import 'package:habbit_wallet_lite/features/transactions/domain/entities/transaction.dart';
import 'package:uuid/uuid.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({super.key});

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _categoryController = TextEditingController();
  final _narrationController = TextEditingController();
  String _type = 'Expense';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Transaction')),
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
                    final id = const Uuid().v4();
                    final tx = TransactionEntity(
                      id: id,
                      amount: double.parse(_amountController.text),
                      category: _categoryController.text,
                      date: DateTime.now(),
                      type: _type,
                      narration: _narrationController.text,
                      editedLocally: true,
                    );
                    Navigator.pop(context, tx);
                  }
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
