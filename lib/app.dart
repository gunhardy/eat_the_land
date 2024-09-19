import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/theme/circle_land_theme.dart';
import 'core/router/route.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  Widget build(BuildContext context) {
    final routerConfig = ref.watch(routerProvider);

    return MaterialApp.router(
      builder: (context, child) => child!,
      theme: CircleLandTheme.themeData,
      routerConfig: routerConfig,
    );
  }
}
