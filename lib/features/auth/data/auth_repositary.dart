import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthRepository {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  static const _keyEmail = 'email';
  static const _keyPin = 'pin';
  static const _keyRememberMe = 'remember_me';

  Future<bool> login(String email, String pin, bool rememberMe) async {
    // Mock login validation
    if (email != "amith@gmail.com" || pin != "1234") return false;

    if (rememberMe) {
      await _storage.write(key: _keyEmail, value: email);
      await _storage.write(key: _keyPin, value: pin);
      await _storage.write(key: _keyRememberMe, value: 'true');
    } else {
      await logout();
    }
    return true;
  }

  Future<bool> isLoggedIn() async {
    final remember = await _storage.read(key: _keyRememberMe);
    return remember == 'true';
  }

  Future<void> logout() async {
    await _storage.deleteAll();
  }

  Future<String?> getEmail() => _storage.read(key: _keyEmail);
}
