import 'package:flutter/material.dart';
import 'constants.dart';
import 'settings_controller.dart';
import 'criteria_screen.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  final SettingsController settingsController;

  HomeScreen({Key? key, required this.settingsController}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showResultButton = false;
  String? _selectedColor;
  String? _selectedResultOption;
  String? _selectedTransition;

  void _checkAllOptionsSelected() {

    if (_selectedColor != null &&
        _selectedResultOption != null &&
        _selectedTransition != null) {

      setState(() {
        _showResultButton = true;
      });
    } else {
      setState(() {
        _showResultButton = false;
      });
    }
  }
  Widget _buildSettingsBlock(String title, List<String> options,
      String? selectedOption, Function(String) onSelect) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title, style: Theme.of(context).textTheme.headline6),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: options.map((option) {
            return ChoiceChip(
              label: Text(option),
              selected: selectedOption == option,
              onSelected: (selected) {
                if (selected) {
                  onSelect(option);
                }
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Route _createRightToLeftRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.settingsController,
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text(AppStrings.appBarTitle),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildSettingsBlock(
                  AppStrings.mainColorTitle,
                  [
                    'Розовый',
                    'Жёлтый',
                    'Зелёный'
                  ],
                  _selectedColor,
                      (newColor) {
                    setState(() {
                      _selectedColor = newColor;
                      _checkAllOptionsSelected();
                    });
                  },
                ),
                _buildSettingsBlock(
                  AppStrings.resultDisplayTitle,
                  ['Dialog', 'Snackbar'],
                  _selectedResultOption,
                      (newOption) {
                    setState(() {
                      _selectedResultOption = newOption;
                      _checkAllOptionsSelected();
                    });
                  },
                ),
                _buildSettingsBlock(
                  AppStrings.transitionTitle,
                  ['Снизу вверх', 'Сверху вниз', 'Справа налево'],
                  _selectedTransition,
                      (newOption) {
                    setState(() {
                      _selectedTransition = newOption;
                      _checkAllOptionsSelected();
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(_createRightToLeftRoute(CriteriaScreen()));
                            },
                            child: Text(AppStrings.openCriteriaButton),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              foregroundColor: Colors.white,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              final random = Random();

                              final colors = ['Розовый', 'Жёлтый', 'Зелёный'];
                              final resultOptions = ['Dialog', 'Snackbar'];
                              final transitions = ['Снизу вверх', 'Сверху вниз', 'Справа налево'];

                              final chosenColor = colors[random.nextInt(colors.length)];
                              final chosenResultOption = resultOptions[random.nextInt(resultOptions.length)];
                              final chosenTransition = transitions[random.nextInt(transitions.length)];

                              setState(() {
                                _selectedColor = chosenColor;
                                _selectedResultOption = chosenResultOption;
                                _selectedTransition = chosenTransition;
                                _checkAllOptionsSelected();
                              });
                            },
                            child: const Text('Подобрать варианты'),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      if (_showResultButton)
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Результат'),
                                  content: Text('Основной цвет: $_selectedColor\n'
                                      'Показ результата: $_selectedResultOption\n'
                                      'Переход между экранами: $_selectedTransition'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => Navigator.of(context).pop(),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: const Text('Показать результат'),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Theme.of(context).primaryColor,
                          ),
                        ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        );
      },
    );
  }
}
