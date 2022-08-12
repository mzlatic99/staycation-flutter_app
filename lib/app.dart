import 'package:devcademy_flutter/router.dart';
import 'package:devcademy_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/homes_guests_love-screen/homes_guests_love_screen.dart';
import 'screens/home-screen/home_screen.dart';
import 'screens/accommodation_details-screen/accommodation_details_screen.dart';
import 'screens/popular_locations_list-screen/popular_locations_list_screen.dart';
import 'screens/my_bookings-screen/my_bookings_screen.dart';
import 'screens/my_places-screen/my_places_screen.dart';
import './providers/accommodations_provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Accommodations(),
      child: MaterialApp(
        theme: theme,
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.homeScreen,
        routes: {
          Routes.homeScreen: (context) => HomeScreen(),
          Routes.accommodationDetailsScreen: (context) =>
              AccommodationDetailsScreen(),
          Routes.homesGuestsLoveScreen: (context) => HomesGuestsLoveScreen(),
          Routes.myBookingsScreen: (context) => MyBookingsScreen(),
          Routes.popularLocationsScreen: (context) => PopularLocationsScreen(),
          Routes.myPlacesScreen: (context) => MyPlacesScreen(),
        },
      ),
    );
  }
}
