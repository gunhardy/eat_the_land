import 'package:flutter/material.dart' hide Colors;

import '../color/abs_colors.dart';
import 'abs_texts.dart';

TextTheme textTheme(
  AbsColors absColors,
  AbsTexts absTexts,
) {
  return TextTheme(
    /// Title
    titleLarge: TextStyle(
      color: absColors.whiteColor,
      letterSpacing: absTexts.letterSpacing,
      fontSize: absTexts.titleLargeSize,
      fontWeight: absTexts.bold,
    ),
    titleMedium: TextStyle(
      color: absColors.whiteColor,
      letterSpacing: absTexts.letterSpacing,
      fontSize: absTexts.titleMediumSize,
      fontWeight: absTexts.bold,
    ),
    titleSmall: TextStyle(
      color: absColors.whiteColor,
      letterSpacing: absTexts.letterSpacing,
      fontSize: absTexts.titleSmallSize,
      fontWeight: absTexts.bold,
    ),

    /// Body
    bodyLarge: TextStyle(
      color: absColors.whiteColor,
      letterSpacing: absTexts.letterSpacing,
      fontSize: absTexts.bodyLargeSize,
      fontWeight: absTexts.bold,
    ),
    bodyMedium: TextStyle(
      color: absColors.whiteColor,
      letterSpacing: absTexts.letterSpacing,
      fontSize: absTexts.bodyMediumSize,
      fontWeight: absTexts.medium,
    ),
    bodySmall: TextStyle(
      color: absColors.whiteColor,
      letterSpacing: absTexts.letterSpacing,
      fontSize: absTexts.bodySmallSize,
      fontWeight: absTexts.light,
    ),
  );
}
