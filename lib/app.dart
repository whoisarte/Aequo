import 'package:flutter/material.dart';
import 'core/coordinator/app_coordinator.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/coordinator/app_coordinator.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aequo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.dark,
      navigatorKey: AppCoordinator.navigatorKey,
      home: AppCoordinator.startScreen(),
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}