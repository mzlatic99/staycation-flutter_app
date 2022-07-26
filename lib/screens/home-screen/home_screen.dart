import 'package:devcademy_flutter/screens/home-screen/widgets/homes_guests_love.dart';
import 'package:flutter/material.dart';
import '../../assets.dart';
import 'widgets/popular_locations.dart';
import '../../shared/top_navbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../theme.dart';
import '../../shared/bottom_navbar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: TopNavBar(
          title: 'Staycaution',
          actionIcons: [
            SvgPicture.asset(
              Assets.icons.search,
              width: 20,
            ),
            SvgPicture.asset(
              Assets.icons.more,
              height: 18,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Popular locations',
                          style: textTheme.headline5,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'VIEW MORE',
                              style: textTheme.button!.merge(
                                TextStyle(
                                  color: ThemeColors.mint400,
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                  GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    crossAxisCount: 2,
                    children: [
                      LocationCard(
                          locationImage: Assets.images.london,
                          locationName: 'London',
                          locationProperties: 5102),
                      LocationCard(
                          locationImage: Assets.images.tokyo,
                          locationName: 'Tokyo',
                          locationProperties: 11251),
                      LocationCard(
                          locationImage: Assets.images.barcelona,
                          locationName: 'Barcelona',
                          locationProperties: 21104),
                      LocationCard(
                          locationImage: Assets.images.newYork,
                          locationName: 'New York',
                          locationProperties: 1381),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Homes guests love',
                          style: textTheme.headline5,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text('VIEW MORE',
                                style: textTheme.button!.merge(
                                  TextStyle(
                                    color: ThemeColors.mint400,
                                  ),
                                )))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 316,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        HomesGuestsLoveCard(
                            image: Assets.images.barcelona,
                            name: 'Sugar & Spice Apartments',
                            location: 'Barcelona',
                            cost: 'EUR 35',
                            rating: 3),
                        HomesGuestsLoveCard(
                            image: Assets.images.london,
                            name: 'Sugar & Spice Apartments',
                            location: 'London',
                            cost: 'EUR 55',
                            rating: 4)
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
