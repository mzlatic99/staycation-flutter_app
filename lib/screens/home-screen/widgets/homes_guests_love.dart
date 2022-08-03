import 'package:flutter/material.dart';

import '../../../http.dart';
import '../../../theme.dart';
import '../../../models/accommodation.dart';

import '../../../shared/homes_guests_love_card.dart';
import 'title_and_button.dart';

class HomesGuestsLove extends StatelessWidget {
  const HomesGuestsLove({
    Key? key,
    required List<HomeGuestsLoveCard> homesGuestsLoveList,
  })  : _homesGuestsLoveList = homesGuestsLoveList,
        super(key: key);

  final List<HomeGuestsLoveCard> _homesGuestsLoveList;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
          child: TitleAndButton(
            title: 'Homes guests love',
            function: () {},
          ),
        ),
        SizedBox(
          height: 316,
          child: FutureBuilder(
            future: http.getPopularHomes(),
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
                _homesGuestsLoveList.add(HomeGuestsLoveCard(
                    isHorizontalList: true,
                    id: accommodation.id,
                    imageUrl: accommodation.imageUrl,
                    title: accommodation.title,
                    location: accommodation.location,
                    price: accommodation.price,
                    categorization: accommodation.categorization));
              }
              return ListView(
                scrollDirection: Axis.horizontal,
                children: _homesGuestsLoveList,
              );
            },
          ),
        ),
      ],
    );
  }
}
