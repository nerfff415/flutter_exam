import 'package:flutter/material.dart';

class AppColors {
  static const Color pink = Colors.pink;
  static const Color yellow = Colors.yellow;
  static const Color green = Colors.green;
}

class AppStrings {
  static const String appBarTitle = 'Подбор варианта на экзамен';
  static const String mainColorTitle = 'Основной цвет';
  static const String resultDisplayTitle = 'Показ результата';
  static const String transitionTitle = 'Переход между экранами';

  static const String chooseOptionButton = 'Подобрать вариант';
  static const String openCriteriaButton = 'Открыть критерии';
  static const String openResultButton =
      'Открыть Dialog/SnackBar';
}

class AppTransitions {
  static const String fromBottomToTop = 'Снизу вверх';
  static const String fromTopToBottom = 'Сверху вниз';
  static const String fromRightToLeft = 'Справа налево';
}
