import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'settings_controller.dart';
import 'settings_model.dart';
import 'app_theme.dart';
void main() {

  final settingsModel = Settings();
  final settingsController = SettingsController(settingsModel);

  runApp(MyApp(settingsController: settingsController));
}

class MyApp extends StatelessWidget {
  final SettingsController settingsController;

  MyApp({required this.settingsController});

  @override
  Widget build(BuildContext context) {

    final theme = AppTheme.getThemeByName(settingsController.settings.colorTheme);

    return MaterialApp(
      title: 'Подбор варианта на экзамен',
      theme: theme,
      home: HomeScreen(settingsController: settingsController),
    );
  }
}
