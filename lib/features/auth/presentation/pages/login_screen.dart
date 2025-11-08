import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _pinController = TextEditingController();
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          state.maybeWhen(
            authenticated: (_) {
              Navigator.pushReplacementNamed(context, '/home');
            },
            error: (msg) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(msg)));
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Habit Wallet Lite',
                    style: TextStyle(fontSize: 22),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                  ),
                  TextField(
                    controller: _pinController,
                    decoration: const InputDecoration(labelText: 'PIN'),
                    obscureText: true,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: _rememberMe,
                        onChanged: (v) => setState(() => _rememberMe = v!),
                      ),
                      const Text('Remember me'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<AuthCubit>().login(
                        _emailController.text,
                        _pinController.text,
                        _rememberMe,
                      );
                    },
                    child: const Text('Login'),
                  ),
                  state.maybeWhen(
                    loading: () => const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(),
                    ),
                    orElse: () => const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
