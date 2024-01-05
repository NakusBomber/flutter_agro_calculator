import 'package:agro_calculator/pages/calculators/norm_seeding_grain_page.dart';
import 'package:agro_calculator/pages/history_page.dart';
import 'package:agro_calculator/pages/info_page.dart';
import 'package:agro_calculator/pages/start_page.dart';
import 'package:flutter/material.dart';
import 'pages/main_page.dart';
import 'package:go_router/go_router.dart';


class AgroApp extends StatelessWidget {
  const AgroApp({super.key, this.isFirstLaunch = false});

  final bool isFirstLaunch;

  @override
  Widget build(BuildContext context) {
    String loc = isFirstLaunch ? '/start' : '/';
    final GoRouter router = GoRouter(
      initialLocation: loc,
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return const MainPage();
          },
          routes: <RouteBase>[
            GoRoute(
                path: 'norm_seeding_grain',
                builder: (BuildContext context, GoRouterState state) {
                  return const NormSeedingGrainPage();
                }
            ),
            GoRoute(
              path: 'info',
              builder: (BuildContext context, GoRouterState state) {
                return const InfoPage();
              }
            ),
            GoRoute(
              path: 'start',
              builder: (BuildContext context, GoRouterState state) {
                return const StartPage();
              },
            ),
            GoRoute(
                path: 'history',
                builder: (BuildContext context, GoRouterState state) {
                  return const HistoryPage();
                }
            )
          ],
        ),
      ],
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Agro Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}