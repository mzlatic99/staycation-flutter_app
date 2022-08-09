import 'package:devcademy_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme.dart';
import '../assets.dart';
import '../router.dart';

class BottomNavBar extends StatelessWidget {
  final int index;
  BottomNavBar({required this.index});
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (int curr) {
        if (index == curr)
          ;
        else {
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
        // if (index == 0) router.navigateTo(context, Routes.homeScreen);
        // if (index == 1) router.navigateTo(context, Routes.myBookingsScreen);
        // if (index == 2) router.navigateTo(context, Routes.myPlacesScreen);
      },
      currentIndex: index,
      items: [
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.icons.home,
              color: ThemeColors.grey500,
            ),
            activeIcon: SvgPicture.asset(
              Assets.icons.home,
              color: ThemeColors.mint500,
            ),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.icons.list,
              color: ThemeColors.grey500,
            ),
            activeIcon: SvgPicture.asset(
              Assets.icons.list,
              color: ThemeColors.mint500,
            ),
            label: 'My Bookings'),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.icons.places,
              color: ThemeColors.grey500,
            ),
            activeIcon: SvgPicture.asset(
              Assets.icons.places,
              color: ThemeColors.mint500,
            ),
            label: 'My Places')
      ],
    );
  }
}
