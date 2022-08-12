import 'package:flutter/material.dart';

import '../../../http.dart';
import '../../../theme.dart';
import '../../../router.dart';
import '../../../models/location.dart';

import '../../../shared/popular_locations_card.dart';
import 'title_and_button.dart';

class PopularLocations extends StatelessWidget {
  final List<LocationCard> _locationCardList = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: TitleAndButton(
            title: 'Popular locations',
            function: () {
              router.navigateTo(context, Routes.popularLocationsScreen, null);
            },
          ),
        ),
        FutureBuilder(
          future: http.getPopularLocations(),
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
            List<Location> locations = snapshot.data;
            for (var location in locations) {
              _locationCardList.add(LocationCard(
                  location: Location(
                      id: location.id,
                      locationName: location.locationName,
                      imageUrl: location.imageUrl,
                      properties: location.properties)));
            }
            return GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              crossAxisCount: 2,
              children: _locationCardList,
            );
          },
        ),
      ],
    );
  }
}
