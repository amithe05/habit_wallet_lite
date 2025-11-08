// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get appTitle => 'ஹாபிட் வாலெட் லைட்';

  @override
  String get transactions => 'பரிவர்த்தனைகள்';

  @override
  String get addTransaction => 'பரிவர்த்தனை சேர்க்க';

  @override
  String get logout => 'வெளியேறு';

  @override
  String get sync => 'ஒத்திசை';

  @override
  String get editedLocally => 'உள்ளூரில் திருத்தப்பட்டது';

  @override
  String get themeToggle => 'தீம் மாற்று';

  @override
  String get login => 'உள்நுழை';

  @override
  String get email => 'மின்னஞ்சல்';

  @override
  String get pin => 'பின்';

  @override
  String get rememberMe => 'என்னை நினைவில் வை';

  @override
  String todayCount(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'இன்று $count பதிவுகள்',
      one: 'இன்று 1 பதிவு',
      zero: 'இன்று பதிவில்லை',
    );
    return '$_temp0';
  }
}
