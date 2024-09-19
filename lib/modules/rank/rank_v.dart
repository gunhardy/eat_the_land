import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core/router/route.dart';
import '../../core/router/page.dart';

class RankView extends ConsumerStatefulWidget {
  const RankView({super.key});

  @override
  ConsumerState<RankView> createState() => _RankViewState();
}

class _RankViewState extends ConsumerState<RankView> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colors.primary,
      child: SafeArea(
        child: GestureDetector(
          onHorizontalDragEnd: (details) {
            if (details.primaryVelocity! < 0) ref.read(routerProvider).pushReplacementNamed(PAGE.PLAY.name);
          },
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: 'RANK_VIEW'.text.make()
          ),
        ),
      ),
    );
  }
}
