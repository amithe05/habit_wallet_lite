import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habbit_wallet_lite/core/theme/theme_cubit.dart';
import 'package:habbit_wallet_lite/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:habbit_wallet_lite/features/auth/presentation/pages/login_screen.dart';
import 'package:habbit_wallet_lite/features/transactions/presentation/bloc/transactional_cubit.dart';
import 'package:habbit_wallet_lite/features/transactions/presentation/bloc/transactional_state.dart';
import 'package:habbit_wallet_lite/features/transactions/presentation/pages/add_edit_transaction_page.dart';
import 'package:habbit_wallet_lite/features/transactions/presentation/widgets/category_pie_chat.dart';
import 'package:habbit_wallet_lite/features/transactions/presentation/widgets/tansaction_widget.dart';
import 'package:habbit_wallet_lite/features/transactions/presentation/widgets/transactional_chart.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Theme.of(context).brightness == Brightness.dark
                  ? Icons.wb_sunny_outlined
                  : Icons.dark_mode_outlined,
            ),
            tooltip: 'Toggle theme',
            onPressed: () => context.read<ThemeCubit>().toggleTheme(),
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () {
              context.read<AuthCubit>().logout();
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/login',
                (route) => false,
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newTx = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddTransactionPage()),
          );

          if (newTx != null && context.mounted) {
            context.read<TransactionCubit>().addTransaction(newTx);
          }
        },
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<TransactionCubit, TransactionState>(
        builder: (context, state) {
          if (state is TransactionLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is TransactionError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: ${state.message}'),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      context.read<TransactionCubit>().loadTransactions();
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (state is TransactionLoaded) {
            final transactions = state.transactions;

            if (transactions.isEmpty) {
              return const Center(child: Text('No transactions available.'));
            }

            return RefreshIndicator(
              onRefresh: () async {
                await context.read<TransactionCubit>().loadTransactions();
              },
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  TransactionChart(transactions: transactions),

                  const Divider(height: 24),

                  CategoryPieChart(transactions: transactions),

                  const Divider(height: 24),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Recent Transactions',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),

                  ...transactions
                      .map((tx) => TransactionWidget(tx: tx))
                      .toList(),
                  const SizedBox(height: 16),
                ],
              ),
            );
          }

          return const Center(child: Text('No transactions to display.'));
        },
      ),
    );
  }
}
