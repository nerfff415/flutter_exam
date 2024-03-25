import 'package:flutter/material.dart';
import 'settings_controller.dart';

class ResultDisplayChoice extends StatelessWidget {
  final SettingsController settingsController;

  ResultDisplayChoice({Key? key, required this.settingsController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        for (var option in ['Dialog', 'Snackbar'])
          ChoiceChip(
            label: Text(option),
            selected: settingsController.settings.resultDisplayOption == option,
            onSelected: (selected) {
              if (selected) {
                settingsController.updateResultDisplayOption(option);
              }
            },
          ),
      ],
    );
  }
}
