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
    final receivedData = ModalRoute.of(context)!.settings.arguments;
    if (receivedData is String) {
      final locationFilter =
          ModalRoute.of(context)!.settings.arguments as String;
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
    }
    if (receivedData is Map) {
      final mapFilter =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      for (var i = 0; i < accommodationData.accommodations.length; i++) {
        if (mapFilter['searchValue'] != '' &&
            mapFilter['numberOfGuests'] != '' &&
            mapFilter['accommodationType'] != '') {
          if (accommodationData.accommodations[i]
                  .toString()
                  .contains(mapFilter['searchValue']) &&
              accommodationData.accommodations[i].capacity! >=
                  mapFilter['numberOfGuests'] &&
              mapFilter['accommodationType'].toLowerCase() ==
                  accommodationData.accommodations[i].accommodationType) {
            _homesGuestsLoveList.add(
              HomesGuestsLoveCard(
                isHorizontalList: false,
                accommodation: accommodationData.accommodations[i],
              ),
            );
          }
        } else if (mapFilter['searchValue'] != '' &&
            mapFilter['numberOfGuests'] != '') {
          if (accommodationData.accommodations[i]
                  .toString()
                  .contains(mapFilter['searchValue']) &&
              accommodationData.accommodations[i].capacity! >=
                  mapFilter['numberOfGuests']) {
            _homesGuestsLoveList.add(
              HomesGuestsLoveCard(
                isHorizontalList: false,
                accommodation: accommodationData.accommodations[i],
              ),
            );
          }
        } else if (mapFilter['searchValue'] != '' &&
            mapFilter['accommodationType'] != '') {
          if (accommodationData.accommodations[i]
                  .toString()
                  .contains(mapFilter['searchValue']) &&
              mapFilter['accommodationType'].toLowerCase() ==
                  accommodationData.accommodations[i].accommodationType) {
            _homesGuestsLoveList.add(
              HomesGuestsLoveCard(
                isHorizontalList: false,
                accommodation: accommodationData.accommodations[i],
              ),
            );
          }
        } else if (mapFilter['numberOfGuests'] != '' &&
            mapFilter['accommodationType'] != '') {
          if (accommodationData.accommodations[i].capacity! >=
                  mapFilter['numberOfGuests'] &&
              mapFilter['accommodationType'].toLowerCase() ==
                  accommodationData.accommodations[i].accommodationType) {
            _homesGuestsLoveList.add(
              HomesGuestsLoveCard(
                isHorizontalList: false,
                accommodation: accommodationData.accommodations[i],
              ),
            );
          }
        } else if (mapFilter['searchValue'] != '') {
          if (accommodationData.accommodations[i]
              .toString()
              .contains(mapFilter['searchValue'])) {
            _homesGuestsLoveList.add(
              HomesGuestsLoveCard(
                isHorizontalList: false,
                accommodation: accommodationData.accommodations[i],
              ),
            );
          }
        } else if (mapFilter['numberOfGuests'] != '') {
          if (accommodationData.accommodations[i].capacity! >=
              mapFilter['numberOfGuests']) {
            _homesGuestsLoveList.add(
              HomesGuestsLoveCard(
                isHorizontalList: false,
                accommodation: accommodationData.accommodations[i],
              ),
            );
          }
        } else if (mapFilter['accommodationType'] != '') {
          if (mapFilter['accommodationType'].toLowerCase() ==
              accommodationData.accommodations[i].accommodationType) {
            _homesGuestsLoveList.add(
              HomesGuestsLoveCard(
                isHorizontalList: false,
                accommodation: accommodationData.accommodations[i],
              ),
            );
          }
        }
      }
      if (_homesGuestsLoveList.isEmpty) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              elevation: 0,
              behavior: SnackBarBehavior.floating,
              margin: const EdgeInsets.all(20),
              backgroundColor: ThemeColors.grey800,
              content: Text(
                'No results found.',
                style: textTheme.bodyText2!.copyWith(color: ThemeColors.white),
              ),
              duration: const Duration(milliseconds: 1500),
            ),
          );
        });
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
            onTap: () => router.navigateTo(context, Routes.searchScreen, null),
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
