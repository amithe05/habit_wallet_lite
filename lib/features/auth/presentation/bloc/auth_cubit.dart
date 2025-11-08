import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habbit_wallet_lite/features/auth/data/auth_repositary.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository repo;
  AuthCubit(this.repo) : super(const AuthState.initial());

  Future<void> checkLoginStatus() async {
    final loggedIn = await repo.isLoggedIn();
    if (loggedIn) {
      final email = await repo.getEmail();
      emit(AuthState.authenticated(email ?? ''));
    } else {
      emit(const AuthState.unauthenticated());
    }
  }

  Future<void> login(String email, String pin, bool remember) async {
    emit(const AuthState.loading());
    final success = await repo.login(email, pin, remember);
    if (success) {
      emit(AuthState.authenticated(email));
    } else {
      emit(const AuthState.error('Invalid credentials'));
    }
  }

  Future<void> logout() async {
    await repo.logout();
    emit(const AuthState.unauthenticated());
  }
}
