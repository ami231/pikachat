import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import 'bottom_nav_bar.dart';

class BottomNavbarLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
        key: ValueKey('main'),
        title: 'Chat',
        child: BottomNavbar(),
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/chat',  '/contacts'];
}