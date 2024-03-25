import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'settings_model.dart';

class SettingsController with ChangeNotifier {
  final Settings _settings;

  SettingsController(this._settings);

  Settings get settings => _settings;

  Future<void> loadSettings() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _settings.colorTheme = prefs.getString('colorTheme') ?? 'Розовый';
    _settings.resultDisplayOption = prefs.getString('resultDisplayOption') ?? 'Dialog';
    _settings.transitionOption = prefs.getString('transitionOption') ?? 'Справа налево';
    notifyListeners();
  }

  Future<void> updateColorTheme(String colorTheme) async {
    _settings.colorTheme = colorTheme;
    notifyListeners();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('colorTheme', colorTheme);
  }

  Future<void> updateResultDisplayOption(String resultDisplayOption) async {
    _settings.resultDisplayOption = resultDisplayOption;
    notifyListeners();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('resultDisplayOption', resultDisplayOption);
  }

  Future<void> updateTransitionOption(String transitionOption) async {
    _settings.transitionOption = transitionOption;
    notifyListeners();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('transitionOption', transitionOption);
  }
}
