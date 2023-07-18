import 'package:beamer/beamer.dart';
import 'package:pikachat/features/auth/login_location.dart';
import 'package:pikachat/features/auth/register_location.dart';
import 'package:pikachat/features/chat/chat_location.dart';

import '../../../features/auth/splash_location.dart';

final routerDelegate = BeamerDelegate(
  initialPath: '/splash',
  locationBuilder: (routeInformation, _) {
    if (routeInformation.location!.contains('splash')) {
      return SplashLocation();
    } else if (routeInformation.location!.contains('login')) {
      return LoginLocation();
    } else if (routeInformation.location!.contains('chat')) {
      return ChatLocation();
    } else if (routeInformation.location!.contains('register')) {
      return RegisterLocation();
    } else if (routeInformation.location!.contains('chats')) {
      //TODO: implement chats location
      return NotFound();
    }else {
      return NotFound();
    }
  }
);
