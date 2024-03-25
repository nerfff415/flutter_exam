import 'package:flutter/material.dart';
import 'settings_controller.dart';

class TransitionChoice extends StatelessWidget {
  final SettingsController settingsController;

  TransitionChoice({Key? key, required this.settingsController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        for (var transition in ['Снизу вверх', 'Сверху вниз', 'Справа налево'])
          ChoiceChip(
            label: Text(transition),
            selected:
                settingsController.settings.transitionOption == transition,
            onSelected: (selected) {
              if (selected) {
                settingsController.updateTransitionOption(transition);
              }
            },
          ),
      ],
    );
  }
}
