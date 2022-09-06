import 'package:devcademy_flutter/theme.dart';
import 'package:flutter/material.dart';

import '../theme.dart';
import '../router.dart';

class BottomNavBar extends StatelessWidget {
  final int index;
  const BottomNavBar({Key? key, required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (int curr) {
        if (index == curr) {
          return;
        } else {
          switch (curr) {
            case 0:
              router.navigateTo(context, Routes.homeScreen, null);
              break;
            case 1:
              router.navigateTo(context, Routes.myBookingsScreen, null);
              break;
            case 2:
              router.navigateTo(context, Routes.myPlacesScreen, null);
              break;
            default:
              break;
          }
        }
      },
      currentIndex: index,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home, color: ThemeColors.grey500),
            activeIcon: Icon(Icons.home, color: ThemeColors.mint500),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.list, color: ThemeColors.grey500),
            activeIcon: Icon(Icons.list, color: ThemeColors.mint500),
            label: 'My Bookings'),
        BottomNavigationBarItem(
            icon: Icon(Icons.location_city, color: ThemeColors.grey500),
            activeIcon: Icon(Icons.location_city, color: ThemeColors.mint500),
            label: 'My Places')
      ],
    );
  }
}
