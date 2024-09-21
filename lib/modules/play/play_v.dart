import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core/router/route.dart';
import '../../core/router/page.dart';

class PlayView extends ConsumerStatefulWidget {
  const PlayView({super.key});

  @override
  ConsumerState<PlayView> createState() => _PlayViewState();
}

class _PlayViewState extends ConsumerState<PlayView> {

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colors.primary,
      child: SafeArea(
        child: GestureDetector(
          onHorizontalDragEnd: (details) {
            if (details.primaryVelocity == null) return;
            if (details.primaryVelocity! > 0) ref.read(routerProvider).pushReplacementNamed(PAGE.RANK.name);
            if (details.primaryVelocity! < 0) ref.read(routerProvider).pushReplacementNamed(PAGE.SETTING.name);
          },
          child: 'PLAY_VIEW'.text.make().p(20),
        ),
      ),
    );
  }
}
