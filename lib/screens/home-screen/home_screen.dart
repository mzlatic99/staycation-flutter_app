import '../../shared/homes_guests_love_card.dart';
import 'package:flutter/material.dart';
import '../../assets.dart';
import '../../shared/popular_locations_card.dart';
import '../../shared/top_navbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../theme.dart';
import '../../shared/bottom_navbar.dart';
import 'widgets/homes_guests_love.dart';
import 'widgets/popular_locations.dart';

class HomeScreen extends StatelessWidget {
  final List<LocationCard> _locationCardList = [];
  final List<HomeGuestsLoveCard> _homesGuestsLoveList = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: TopNavBar(
          title: 'Staycation',
          actionIcons: [
            SvgPicture.asset(
              Assets.icons.search,
              width: 18,
              color: ThemeColors.teal800,
            ),
            SvgPicture.asset(
              Assets.icons.more,
              color: ThemeColors.teal800,
              height: 18,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              PopularLocations(locationCardList: _locationCardList),
              HomesGuestsLove(homesGuestsLoveList: _homesGuestsLoveList)
            ],
          ),
        ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
