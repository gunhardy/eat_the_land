import 'package:flutter/material.dart';

enum PAGE {
  PLAY('/', 'play'),
  MAP('/map', 'map'),
  LOGIN('/login', 'login'),
  RANK('/rank', 'rank'),
  SETTING('/setting', 'setting');

  final String path;
  final String name;

  const PAGE(this.path, this.name);

  static String getDebugLabel() => 'routerKey';
  static String getInitialLocation() => '/';
}
