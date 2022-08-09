import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../assets.dart';
import '../../theme.dart';
import '../../http.dart';
import '../../models/accommodation.dart';

import '../../shared/top_navbar.dart';
import '../../shared/bottom_navbar.dart';
import '../../shared/homes_guests_love_card.dart';

class MyPlacesScreen extends StatelessWidget {
  final List<HomesGuestsLoveCard> _myPlacesList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: ThemeColors.mint400,
        child: SvgPicture.asset(
          Assets.icons.add,
          color: ThemeColors.white,
        ),
        onPressed: () {},
      ),
      appBar: TopNavBar(
        title: 'My Places',
        actionIcons: [
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(Assets.icons.more),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(index: 2),
      body: SafeArea(
        child: Column(
          children: [
            FutureBuilder(
              future: http.getMyPlaces(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) {
                  return const Center(child: Text('error'));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: CircularProgressIndicator(
                    color: ThemeColors.mint500,
                  ));
                }
                List<Accommodation> accommodations = snapshot.data;
                for (var accommodation in accommodations) {
                  _myPlacesList.add(
                    HomesGuestsLoveCard(
                        accommodation: Accommodation(
                          id: accommodation.id,
                          imageUrl: accommodation.imageUrl,
                          title: accommodation.title,
                          location: accommodation.location,
                          price: accommodation.price,
                          categorization: accommodation.categorization,
                          shortDescription: accommodation.shortDescription,
                          longDescription: accommodation.longDescription,
                          postalCode: accommodation.postalCode,
                          capacity: accommodation.capacity,
                          accommodationType: accommodation.accommodationType,
                          freeCancelation: accommodation.freeCancelation,
                        ),
                        isHorizontalList: false),
                  );
                }
                return Expanded(
                  child: ListView(
                    padding: const EdgeInsets.only(top: 24),
                    children: _myPlacesList,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
