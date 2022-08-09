import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../theme.dart';
import '../../assets.dart';

import '../../shared/top_navbar.dart';
import '../../shared/bottom_navbar.dart';
import 'widgets/homes_guests_love.dart';
import 'widgets/popular_locations.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: TopNavBar(
        title: 'Staycation',
        actionIcons: [
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(
              Assets.icons.search,
              width: 18,
              color: ThemeColors.teal800,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(
              Assets.icons.more,
              color: ThemeColors.teal800,
              height: 18,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PopularLocations(),
            HomesGuestsLove(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(index: 0),
    );
  }
}
