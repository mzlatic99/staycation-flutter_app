import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/accommodation.dart';
import '../theme.dart';
import '../router.dart';

import 'stars_list.dart';

class HomesGuestsLoveCard extends StatelessWidget {
  final Accommodation accommodation;
  final bool isHorizontalList;
  final DateTime? checkIn;
  final DateTime? checkOut;
  HomesGuestsLoveCard({
    required this.accommodation,
    required this.isHorizontalList,
    this.checkIn,
    this.checkOut,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        router.navigateTo(
            context, Routes.accommodationDetailsScreen, accommodation);
      },
      child: Container(
        width: isHorizontalList
            ? MediaQuery.of(context).size.width * 0.5
            : double.infinity,
        padding: isHorizontalList
            ? const EdgeInsets.only(left: 20)
            : const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: isHorizontalList
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  Text(
                    accommodation.title,
                    style: textTheme.bodyText1!
                        .merge(TextStyle(color: ThemeColors.black)),
                  ),
                  Text(
                    accommodation.location,
                    style: textTheme.bodyText2!
                        .merge(TextStyle(color: ThemeColors.grey300)),
                  ),
                  Text(
                    'EUR ${accommodation.price}',
                    style: textTheme.bodyText1!.merge(TextStyle(
                        color: ThemeColors.teal800,
                        fontWeight: FontWeight.w400)),
                  ),
                  StarsList(categorization: accommodation.categorization)
                ],
              )
            : Container(
                constraints: const BoxConstraints(maxHeight: 154),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        accommodation.imageUrl,
                        width: MediaQuery.of(context).size.width * 0.5 - 20,
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
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.5 -
                                        40),
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
                          checkIn == null && checkOut == null
                              ? Text(
                                  'EUR ${accommodation.price}',
                                  style: textTheme.bodyText1!.merge(TextStyle(
                                      color: ThemeColors.teal800,
                                      fontWeight: FontWeight.w400)),
                                )
                              : Text(
                                  '${DateFormat('dd MMM').format(checkIn!)} - ${DateFormat('dd MMM yyyy').format(checkOut!)}',
                                  style: textTheme.bodyText2!.merge(TextStyle(
                                      color: ThemeColors.teal800,
                                      fontWeight: FontWeight.w600)),
                                ),
                          StarsList(
                              categorization: accommodation.categorization),
                        ],
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
