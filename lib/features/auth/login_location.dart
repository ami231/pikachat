import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:pikachat/features/auth/presentation/pages/login_page.dart';

class LoginLocation extends BeamLocation<BeamState> {
  LoginLocation() : super();

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('login'),
          title: 'Login',
          child: LoginPage(),
        ),
      ];

  @override
  List<String> get pathPatterns => ['/login'];
}
