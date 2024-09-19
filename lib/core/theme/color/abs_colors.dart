import 'dart:ui';

import 'colors.dart';

class AbsColors extends AbstractThemeColors {
  const AbsColors();
}

abstract class AbstractThemeColors {
  const AbstractThemeColors();

  Color get primaryColor => Colors.darkGrey;
  Color get subColor => Colors.mediumGrey;
  Color get errorColor => Colors.error;
  Color get backgroundColor => Colors.white;
  Color get surfaceColor => Colors.lightGrey;

  Color get whiteColor => Colors.white;
  Color get blackColor => Colors.black;
}
