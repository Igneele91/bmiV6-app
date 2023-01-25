
// Erkläre mir das Applocalizations

// Path: lib\app_localizations.dart
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }



  Map<String, String> _localizedStrings = <String, String>{};

  Future<bool> load() async {
    String jsonString =
    await rootBundle.loadString('assets/locale/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map(
          (key, value) => MapEntry(key, value.toString()),
    );

    return true;
  }

  String translate(String key) {
    return _localizedStrings[key] ?? '[$key]';
  }

  // Add your localization methods here
  String get settingsUserTextActiveUser => translate('settings_user_text_active_user');
  String get settingsUserBtnAddUser => translate('settings_user_btn_add_user');
  String get settingsUserBtnCancel => translate('settings_user_btn_cancel');
  String get settingsUserBtnOK => translate('settings_user_btn_ok');
  String get settingsUserTextInputName => translate('settings_user_text_input_name');
}