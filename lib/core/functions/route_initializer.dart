import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constants.dart';
import '../utils/routes/route_name.dart';

@injectable
class RouteInitializer {
  final SharedPreferences sharedPreferences;

  RouteInitializer({required this.sharedPreferences});

  String? computeInitialRoute() {
    var isWelcomed = sharedPreferences.getBool(Constants.isWelcomed);
    if (isWelcomed != null && isWelcomed) {
      return RouteName.detailsRoute;
    } else {
      return RouteName.welcomeRoute;
    }
  }
}
