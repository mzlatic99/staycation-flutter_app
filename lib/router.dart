import 'package:flutter/widgets.dart';

class Routes {
  static String authenticationScreen = '/';
  static String homeScreen = '/homeScreen';
  static String accommodationDetailsScreen = '/accommodationDetailsScreen';
  static String homesGuestsLoveScreen = '/homesGuestsLoveScreen';
  static String myBookingsScreen = '/myBookingsScreen';
  static String popularLocationsScreen = '/popularLocationsScreen';
  static String myPlacesScreen = '/myPlacesScreen';
  static String addNewPlaceScreen = '/addNewPlaceScreen';
  static String searchScreen = '/searchScreen';
  static String bookStayScreen = '/bookStayScreen';
}

class Router {
  void goBack(BuildContext context) {
    return Navigator.pop(context);
  }

  Future<void> navigateTo(
      BuildContext context, String route, Object? arguments) {
    return Navigator.pushNamed(context, route, arguments: arguments);
  }
}

Router router = Router();
