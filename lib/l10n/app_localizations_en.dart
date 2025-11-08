// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Habit Wallet Lite';

  @override
  String get transactions => 'Transactions';

  @override
  String get addTransaction => 'Add transaction';

  @override
  String get logout => 'Logout';

  @override
  String get sync => 'Sync';

  @override
  String get editedLocally => 'Edited locally';

  @override
  String get themeToggle => 'Toggle theme';

  @override
  String get login => 'Login';

  @override
  String get email => 'Email';

  @override
  String get pin => 'PIN';

  @override
  String get rememberMe => 'Remember me';

  @override
  String todayCount(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count entries today',
      one: '1 entry today',
      zero: 'No entries today',
    );
    return '$_temp0';
  }
}
