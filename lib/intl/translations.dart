import 'dart:async';
import 'package:flutter/material.dart';

class Translations {
  Translations(Locale locale) {
    this.locale = locale;
    _localizedValues = null;
  }

  Locale locale;
  static Map<dynamic, dynamic> _localizedValues;

  static Translations of(BuildContext context) {
    return Localizations.of<Translations>(context, Translations);
  }

  String text(String key) {
    return _localizedValues[key] ?? '** $key not found';
  }

  static Future<Translations> load(Locale locale) async {
    Translations translations = new Translations(locale);
    _localizedValues = _setLanguage(locale.languageCode);
    // _localizedValues = json.decode(jsonContent);
    return translations;
  }

  get currentLanguage => locale.languageCode;

  static Map _setLanguage(String code) {
    Map<String, Map> language = {
      'zh': {
        "title": "国际化",
        "first": "第一",
        "second": "第二",
        "third": "第三",
        "fourth": "第四",
        "fifth": "第五"
      },
      'en': {
        "title": "Internationalization",
        "first": "first",
        "second": "second",
        "third": "third",
        "fourth": "fourth",
        "fifth": "fifth"
      }
    };
    return language[code];
  }
}

class TranslationsDelegate extends LocalizationsDelegate<Translations> {
  const TranslationsDelegate();

  /// 改这里是为了不硬编码支持的语言
  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

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
