import 'package:flutter/material.dart';

import '../models/accommodation.dart';
import '../../../theme.dart';

class HomeGuestsLoveCard extends StatelessWidget {
  final Accommodation accommodation;
  final bool isHorizontalList;
  HomeGuestsLoveCard({
    required this.accommodation,
    required this.isHorizontalList,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> starsRating = [];
    for (int i = 0; i < accommodation.categorization; i++) {
      starsRating.add(Icon(
        Icons.star,
        color: ThemeColors.coral400,
      ));
    }

    return GestureDetector(
      onTap: () {},
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
                    Row(
                      children: starsRating,
                    )
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
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.4),
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
                              'EUR ${accommodation.price}',
                              style: textTheme.bodyText1!.merge(TextStyle(
                                  color: ThemeColors.teal800,
                                  fontWeight: FontWeight.w400)),
                            ),
                            Row(
                              children: starsRating,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )),
    );
  }
}
