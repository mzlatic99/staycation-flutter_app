import 'package:devcademy_flutter/router.dart';
import 'package:devcademy_flutter/theme.dart';
import 'package:flutter/material.dart';

import 'screens/homes_guests_love-screen/homes_guests_love_screen.dart';
import 'screens/home-screen/home_screen.dart';
import 'screens/accommodation_details-screen/accommodation_details_screen.dart';
import 'screens/popular_locations_list-screen/popular_locations_list_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.homeScreen,
      routes: {
        Routes.homeScreen: (context) => HomeScreen(),
      },
    );
  }
}
