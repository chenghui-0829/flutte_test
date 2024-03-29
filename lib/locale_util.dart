import 'package:flutter/material.dart';

typedef void LocaleChangeCallback(Locale locale);

class LocaleUtil {
  // Support languages list
  final List<String> supportedLanguages = ['en', 'zh', 'ja'];

  // Support Locales list
  Iterable<Locale> supportedLocales() =>
      supportedLanguages.map<Locale>((lang) => new Locale(lang, ''));

  // Callback for manual locale changed
  LocaleChangeCallback onLocaleChanged;

  Locale locale;
  String languageCode;

  static final LocaleUtil _localeUtil = new LocaleUtil._internal();

  factory LocaleUtil() {
    return _localeUtil;
  }

  LocaleUtil._internal();

  /// 获取当前系统语言
  String getLanguageCode() {
    print("==========getLanguageCode===========" + languageCode.toString());

    if (languageCode == null) {
      return "en";
    }
    return languageCode;
  }
}

LocaleUtil localeUtil = new LocaleUtil();
