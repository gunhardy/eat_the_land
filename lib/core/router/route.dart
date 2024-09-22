import 'package:circle_land/core/router/page.dart';
import 'package:circle_land/modules/map/map_v.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../modules/play/play_v.dart';
import '../../modules/login/login_v.dart';
import '../../modules/rank/rank_v.dart';
import '../../modules/setting/setting_v.dart';

part 'route.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  final routerKey = GlobalKey<NavigatorState>(debugLabel: PAGE.getDebugLabel());

  final router = GoRouter(
    navigatorKey: routerKey,
    initialLocation: PAGE.getInitialLocation(),
    routes: [
      GoRoute(
        path: PAGE.PLAY.path,
        name: PAGE.PLAY.name,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const PlayView(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return _buildTransition(context, animation, secondaryAnimation, child);
            },
          );
        },
      ),
      GoRoute(
        path: PAGE.MAP.path,
        name: PAGE.MAP.name,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const MapView(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return _buildTransition(context, animation, secondaryAnimation, child);
            },
          );
        },
      ),
      GoRoute(
        path: PAGE.LOGIN.path,
        name: PAGE.LOGIN.name,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const LoginView(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return _buildTransition(context, animation, secondaryAnimation, child);
            },
          );
        },
      ),
      GoRoute(
        path: PAGE.RANK.path,
        name: PAGE.RANK.name,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const RankView(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return _buildTransition(context, animation, secondaryAnimation, child);
            },
          );
        },
      ),
      GoRoute(
        path: PAGE.SETTING.path,
        name: PAGE.SETTING.name,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const SettingView(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return _buildTransition(context, animation, secondaryAnimation, child);
            },
          );
        },
      ),
    ],
  );

  ref.onDispose(router.dispose);

  return router;
}

SlideTransition _buildTransition(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
  const begin = Offset.zero;
  const end = Offset.zero;
  const curve = Curves.ease;

  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
  return SlideTransition(
    position: animation.drive(tween),
    child: child,
  );
}
