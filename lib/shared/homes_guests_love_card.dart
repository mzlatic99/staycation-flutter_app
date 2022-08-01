import 'package:flutter/material.dart';
import '../../../theme.dart';

class HomeGuestsLoveCard extends StatelessWidget {
  final bool isHorizontalList;
  final String id;
  final String imageUrl;
  final String title;
  // final String shortDescription;
  // final String longDescription;
  final String location;
  // final String postalCode;
  final int price;
  final int categorization;
  // final int capacity;
  // final String accommodationType;
  // final bool freeCancelation;

  HomeGuestsLoveCard({
    required this.isHorizontalList,
    required this.id,
    required this.imageUrl,
    required this.title,
    // required this.shortDescription,
    // required this.longDescription,
    required this.location,
    // required this.postalCode,
    required this.price,
    required this.categorization,
    // required this.capacity,
    // required this.accommodationType,
    // required this.freeCancelation,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> starsRating = [];
    for (int i = 0; i < categorization; i++) {
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
                        imageUrl,
                        width: 187,
                        height: 154,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      title,
                      style: textTheme.bodyText1!
                          .merge(TextStyle(color: ThemeColors.black)),
                    ),
                    Text(
                      location,
                      style: textTheme.bodyText2!
                          .merge(TextStyle(color: ThemeColors.grey300)),
                    ),
                    Text(
                      'EUR $price',
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
                          imageUrl,
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
                                title,
                                style: textTheme.bodyText1!
                                    .merge(TextStyle(color: ThemeColors.black)),
                              ),
                            ),
                            Text(
                              location,
                              style: textTheme.bodyText2!
                                  .merge(TextStyle(color: ThemeColors.grey300)),
                            ),
                            Text(
                              'EUR $price',
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
