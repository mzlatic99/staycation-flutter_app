import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../assets.dart';
import '../../theme.dart';
import '../../router.dart';
import '../../providers/accommodations_provider.dart';

import '../../shared/top_navbar.dart';
import '../../shared/homes_guests_love_card.dart';

class HomesGuestsLoveScreen extends StatelessWidget {
  final List<HomesGuestsLoveCard> _homesGuestsLoveList = [];
  @override
  Widget build(BuildContext context) {
    final accommodationData =
        Provider.of<Accommodations>(context, listen: false);
    final locationFilter = ModalRoute.of(context)!.settings.arguments as String;
    for (var i = 0; i < accommodationData.accommodations.length; i++) {
      if (accommodationData.accommodations[i].location == locationFilter) {
        _homesGuestsLoveList.add(
          HomesGuestsLoveCard(
            isHorizontalList: false,
            accommodation: accommodationData.accommodations[i],
          ),
        );
      } else if (locationFilter == 'all') {
        _homesGuestsLoveList.add(
          HomesGuestsLoveCard(
            isHorizontalList: false,
            accommodation: accommodationData.accommodations[i],
          ),
        );
      } else {
        continue;
      }
    }
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
            Expanded(
                child: ListView(
              padding: const EdgeInsets.only(top: 24),
              children: _homesGuestsLoveList,
            ))
          ],
        ),
      ),
    );
  }
}
