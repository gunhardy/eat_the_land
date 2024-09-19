import 'dart:ui';

import 'texts.dart';

class AbsTexts extends AbstractThemeTexts {
  const AbsTexts();
}

abstract class AbstractThemeTexts {
  const AbstractThemeTexts();

  double get titleLargeSize => Texts.fontSize24;
  double get titleMediumSize => Texts.fontSize20;
  double get titleSmallSize => Texts.fontSize18;
  double get bodyLargeSize => Texts.fontSize15;
  double get bodyMediumSize => Texts.fontSize13;
  double get bodySmallSize => Texts.fontSize12;
  double get bodyExtraSmallSize => Texts.fontSize10;

  double get letterSpacing => Texts.letterSpacing;

  FontWeight get bold => Texts.fontWeightBold;
  FontWeight get medium => Texts.fontWeightMedium;
  FontWeight get light => Texts.fontWeightLight;
}
