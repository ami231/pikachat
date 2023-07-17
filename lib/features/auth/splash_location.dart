import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:pikachat/features/auth/presentation/pages/splash_page.dart';

class SplashLocation extends BeamLocation<BeamState> {
  SplashLocation() : super();

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('splash'),
          title: 'Splash',
          child: SplashPage(),
        ),
      ];

  @override
  List<String> get pathPatterns => ['/splash'];
}