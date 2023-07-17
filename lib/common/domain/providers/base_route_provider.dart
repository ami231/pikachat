import 'package:beamer/beamer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pikachat/common/domain/router/router_delegate.dart';

final baseRouteProvider = Provider<BeamerDelegate>((ref) => routerDelegate,);