import 'package:devcademy_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme.dart';
import '../assets.dart';

class BottomNavBar extends StatelessWidget {
  //bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
