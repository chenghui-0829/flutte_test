import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'locale_util.dart';

class Translations {
  Translations(Locale locale) {
    this.locale = locale;
    _localizedValues = null;
  }

  Locale locale;
  static Map<dynamic, dynamic> _localizedValues;
  static Map<dynamic, dynamic> _localizedValuesDefault;

  static Translations of(BuildContext context) {
    return Localizations.of<Translations>(context, Translations);
  }

  String text(String key) {
    try {
      String value = _localizedValues[key];
      if (value == null || value.isEmpty) {
        return _defaultText(key);
      } else {
        return value;
      }
    } catch (e) {
      return _defaultText(key);
    }
  }

  String _defaultText(String key) {
    return _localizedValuesDefault[key] ?? '** $key not found';
  }

  static Future<Translations> load(Locale locale) async {
    Translations translations = new Translations(locale);
    String jsonContent =
        await rootBundle.loadString("locale/i18n_${locale.languageCode}.json");
    _localizedValues = json.decode(jsonContent);

    String enJsonContent = await rootBundle.loadString("locale/i18n_en.json");
    _localizedValuesDefault = json.decode(enJsonContent);
    return translations;
  }

  get currentLanguage => locale.languageCode;
}

/// 自定义的localization代表，它的作用是在验证支持的语言前，初始化我们的自定义Translations类
class TranslationsDelegate extends LocalizationsDelegate<Translations> {
  const TranslationsDelegate();

  @override
  bool isSupported(Locale locale) {
    localeUtil.languageCode = locale.languageCode;
    return localeUtil.supportedLanguages.contains(locale.languageCode);
  }

  @override
  Future<Translations> load(Locale locale) => Translations.load(locale);

  @override
  bool shouldReload(TranslationsDelegate old) => false;
}

/// Delegate类的实现，每次选择一种新的语言时，强制初始化一个新的Translations类
class SpecificLocalizationDelegate extends LocalizationsDelegate<Translations> {
  final Locale overriddenLocale;

  const SpecificLocalizationDelegate(this.overriddenLocale);

  @override
  bool isSupported(Locale locale) => overriddenLocale != null;

  @override
  Future<Translations> load(Locale locale) =>
      Translations.load(overriddenLocale);

  @override
  bool shouldReload(LocalizationsDelegate<Translations> old) => true;
}
