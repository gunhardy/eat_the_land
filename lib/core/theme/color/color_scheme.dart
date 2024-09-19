import 'package:flutter/material.dart' hide Colors;

import 'abs_colors.dart';

ColorScheme colorScheme(AbsColors absColors) {
  return ColorScheme(
    brightness: Brightness.light,
    primary: absColors.primaryColor,
    secondary: absColors.subColor,
    error: absColors.errorColor,
    surface: absColors.surfaceColor,
    onPrimary: absColors.whiteColor,
    onSecondary: absColors.whiteColor,
    onError: absColors.whiteColor,
    onSurface: absColors.blackColor,
  );
}
