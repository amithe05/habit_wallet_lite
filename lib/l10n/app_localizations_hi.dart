// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'हैबिट वॉलेट लाइट';

  @override
  String get transactions => 'लेन-देन';

  @override
  String get addTransaction => 'लेन-देन जोड़ें';

  @override
  String get logout => 'लॉगआउट';

  @override
  String get sync => 'सिंक करें';

  @override
  String get editedLocally => 'स्थानीय रूप से संपादित';

  @override
  String get themeToggle => 'थीम बदलें';

  @override
  String get login => 'लॉगिन करें';

  @override
  String get email => 'ईमेल';

  @override
  String get pin => 'पिन';

  @override
  String get rememberMe => 'मुझे याद रखें';

  @override
  String todayCount(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'आज $count प्रविष्टियाँ',
      one: 'आज 1 प्रविष्टि',
      zero: 'आज कोई प्रविष्टि नहीं',
    );
    return '$_temp0';
  }
}
