import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:habbit_wallet_lite/core/theme/theme_cubit.dart';
import 'package:habbit_wallet_lite/features/auth/data/auth_repositary.dart';
import 'package:habbit_wallet_lite/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:habbit_wallet_lite/features/auth/presentation/pages/login_screen.dart';
import 'package:habbit_wallet_lite/features/transactions/data/datasources/transaction_local_source.dart';
import 'package:habbit_wallet_lite/features/transactions/data/models/transaction_model.dart';
import 'package:habbit_wallet_lite/features/transactions/presentation/bloc/transactional_cubit.dart';
import 'package:habbit_wallet_lite/l10n/app_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'features/transactions/data/datasources/mock_transaction_api.dart';
import 'features/transactions/data/respositaries/transaction_repo_impl.dart';
import 'features/transactions/presentation/pages/transaction_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TransactionModelAdapter());

  final repo = TransactionRepositoryImpl(
    MockTransactionApi(),
    TransactionLocalDataSourceImpl(),
  );

  final authRepo = AuthRepository();
  final authCubit = AuthCubit(authRepo);
  await authCubit.checkLoginStatus();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => authCubit),
        BlocProvider(create: (_) => TransactionCubit(repo)..loadTransactions()),
        BlocProvider(create: (_) => ThemeCubit()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return MaterialApp(
          title: 'Habit Wallet Lite',
          themeMode: themeMode,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('en'), Locale('ta'), Locale('hi')],
          theme: ThemeData(
            brightness: Brightness.light,
            colorSchemeSeed: Colors.green,
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            colorSchemeSeed: Colors.teal,
            useMaterial3: true,
          ),
          initialRoute: '/login',
          routes: {
            '/login': (_) => const LoginPage(),
            '/home': (_) => const TransactionPage(),
          },
        );
      },
    );
  }
}
