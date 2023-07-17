import 'package:beamer/beamer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pikachat/common/domain/providers/base_route_provider.dart';

import 'main/app_environment.dart';

Future<void> mainCommon(AppEnvironment environment) async {
  WidgetsFlutterBinding.ensureInitialized();
  EnvInfo.initialize(environment);
  Beamer.setPathUrlStrategy();
  await Firebase.initializeApp();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {

  @override
  Widget build(BuildContext context) {
    final baseRouter = ref.watch(baseRouteProvider);
    return BeamerProvider(
      routerDelegate: baseRouter,
      child: MaterialApp.router(
        title: 'Pikachat',
        routerDelegate: baseRouter,
        routeInformationParser: BeamerParser(),
        builder: (context, child) => Material(
          type: MaterialType.transparency,
          child: child ?? const SizedBox(),
        ),
      ),
    );
  }
}
