import 'package:flutter/material.dart';

import '../../../theme.dart';
import '../../../models/accommodation.dart';

import '../../../shared/stars_list.dart';

class MyPlaceCard extends StatelessWidget {
  final Accommodation accommodation;
  MyPlaceCard({required this.accommodation});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      constraints: const BoxConstraints(maxHeight: 154),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              accommodation.imageUrl,
              width: 187,
              height: 154,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.4),
                  child: Text(
                    accommodation.title,
                    style: textTheme.bodyText1!
                        .merge(TextStyle(color: ThemeColors.black)),
                  ),
                ),
                Text(
                  accommodation.location,
                  style: textTheme.bodyText2!
                      .merge(TextStyle(color: ThemeColors.grey300)),
                ),
                Text(
                  'Renting an entire unit',
                  style: textTheme.bodyText2!.merge(TextStyle(
                      color: ThemeColors.teal800, fontWeight: FontWeight.w600)),
                ),
                StarsList(categorization: accommodation.categorization),
              ],
            ),
          )
        ],
      ),
    );
  }
}
