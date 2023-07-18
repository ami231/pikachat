import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import 'presentation/pages/register_page.dart';

class RegisterLocation extends BeamLocation<BeamState> {
  RegisterLocation() : super();

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('register'),
          title: 'Register',
          child: RegisterPage(),
        ),
      ];

  @override
  List<String> get pathPatterns => ['/register'];
}