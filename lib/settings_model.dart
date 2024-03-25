class Settings {
  String colorTheme;
  String resultDisplayOption;
  String transitionOption;

  Settings({
    this.colorTheme = 'Розовый',
    this.resultDisplayOption = 'Dialog',
    this.transitionOption = 'Справа налево',
  });

  void updateColorTheme(String newColorTheme) {
    colorTheme = newColorTheme;
  }

  void updateResultDisplayOption(String newResultDisplayOption) {
    resultDisplayOption = newResultDisplayOption;
  }

  void updateTransitionOption(String newTransitionOption) {
    transitionOption = newTransitionOption;
  }
}
