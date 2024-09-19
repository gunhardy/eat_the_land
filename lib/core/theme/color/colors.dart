import 'dart:ui';

class Colors extends Color {
  // Basic Colors
  static const Color white = Color.fromARGB(255, 255, 255, 255);
  static const Color extraLightGrey = Color.fromARGB(255, 203, 203, 203);
  static const Color lightGrey = Color.fromARGB(255, 152, 152, 152);
  static const Color mediumGrey = Color.fromARGB(255, 102, 102, 102);
  static const Color darkGrey = Color.fromARGB(255, 54, 54, 54);
  static const Color black = Color.fromARGB(255, 0, 0, 0);

  // etc.
  static const Color error = Color.fromARGB(255, 255, 0, 0);
  static const Color transparent = Color.fromARGB(0, 0, 0, 0);

  Colors(super.value);
}
