import 'package:beamer/beamer.dart';
import 'package:pikachat/features/chat/presentation/pages/chat_page.dart';
import 'package:pikachat/features/contacts/presentation/pages/contacts_page.dart';

import '../chat/chat_location.dart';
import '../contacts/contacts_location.dart';

List<BeamerDelegate> listOfBeamerDelegates() => [
      BeamerDelegate(
          initialPath: ChatPage.routeName,
          transitionDelegate: const NoAnimationTransitionDelegate(),
          locationBuilder: BeamerLocationBuilder(beamLocations: [
            ChatLocation(),
          ])),
      BeamerDelegate(
          initialPath: ContactsPage.routeName,
          transitionDelegate: const NoAnimationTransitionDelegate(),
          locationBuilder:
              BeamerLocationBuilder(beamLocations: [ContactsLocation()])),
    ];