import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core/router/route.dart';
import '../../core/router/page.dart';

class SettingView extends ConsumerStatefulWidget {
  const SettingView({super.key});

  @override
  ConsumerState<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends ConsumerState<SettingView> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colors.primary,
      child: SafeArea(
        child: GestureDetector(
          onHorizontalDragEnd: (details) {
            if (details.primaryVelocity! > 0) ref.read(routerProvider).pushReplacementNamed(PAGE.MAP.name);
          },
          child: 'SETTING_VIEW'.text.make().p(20),
        ),
      ),
    );
  }
}
