import 'dart:async';

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pikachat/common/utils/app_colors.dart';
import 'package:pikachat/features/auth/domain/notifiers/auth_notifier.dart';
import 'package:pikachat/features/auth/presentation/pages/login_page.dart';
import 'package:pikachat/features/chat/presentation/pages/chat_page.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<SplashPage> {

  @override
  void initState() {
    Timer(
      const Duration(seconds: 2),
      () => splashAction(),
    );
    super.initState();
  }

  void splashAction() {
    final usserLoggedIn = ref.read(authNotifierProvider.notifier).isUserLoggedIn();
    if (usserLoggedIn) {
      Beamer.of(context, root: true).beamToNamed(ChatPage.routeName);
    } else {
      Beamer.of(context, root: true).beamToNamed(LoginPage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primaryMainColor,
      body: Center(
        child: Text('SPLASH', style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
