import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../http.dart';
import '../../../theme.dart';
import '../../../router.dart';
import '../../../models/accommodation.dart';
import '../../../providers/accommodations_provider.dart';

import '../../../shared/homes_guests_love_card.dart';
import 'title_and_button.dart';

class HomesGuestsLove extends StatelessWidget {
  final List<HomesGuestsLoveCard> _accommodationList = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
          child: TitleAndButton(
            title: 'Homes guests love',
            function: () {
              router.navigateTo(context, Routes.homesGuestsLoveScreen, 'all');
            },
          ),
        ),
        SizedBox(
          height: 316,
          child: FutureBuilder(
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

              for (var i = 0; i < 4; i++) {
                _accommodationList.add(
                  HomesGuestsLoveCard(
                      accommodation: accommodations[i], isHorizontalList: true),
                );
              }
              final accommodationData =
                  Provider.of<Accommodations>(context, listen: false);
              accommodationData.clearAccommodation();
              for (var accommodation in accommodations) {
                accommodationData.addAccommodation(
                  Accommodation(
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
                );
              }

              return ListView(
                scrollDirection: Axis.horizontal,
                children: _accommodationList,
              );
            },
          ),
        ),
      ],
    );
  }
}
