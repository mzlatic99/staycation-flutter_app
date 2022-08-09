import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../assets.dart';
import '../../theme.dart';
import '../../http.dart';
import '../../router.dart';
import '../../models/accommodation.dart';
import '../../models/location.dart';

import '../../shared/top_navbar.dart';
import '../../shared/homes_guests_love_card.dart';

class HomesGuestsLoveScreen extends StatelessWidget {
  final List<HomesGuestsLoveCard> _homesGuestsLoveList = [];
  @override
  Widget build(BuildContext context) {
    final locationFilter = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: TopNavBar(
        title: 'Homes guests love',
        leading: GestureDetector(
          onTap: () => router.goBack(context),
          child: SvgPicture.asset(
            Assets.icons.back,
            width: 18,
            color: ThemeColors.teal800,
          ),
        ),
        actionIcons: [
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(
              Assets.icons.search,
              width: 18,
              color: ThemeColors.teal800,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            FutureBuilder(
              future: http.getAllHomes(),
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
                  if (accommodation.location == locationFilter) {
                    _homesGuestsLoveList.add(
                      HomesGuestsLoveCard(
                        isHorizontalList: false,
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
                      ),
                    );
                  }
                  if (locationFilter == 'all') {
                    _homesGuestsLoveList.add(
                      HomesGuestsLoveCard(
                        isHorizontalList: false,
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
                      ),
                    );
                  }
                }
                return Expanded(
                  child: ListView(
                    padding: const EdgeInsets.only(top: 24),
                    children: _homesGuestsLoveList,
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
