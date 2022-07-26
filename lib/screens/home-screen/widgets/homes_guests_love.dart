import 'package:flutter/material.dart';
import '../../../theme.dart';

class HomesGuestsLoveCard extends StatelessWidget {
  final String image;
  final String name;
  final String location;
  final String cost;
  final int rating;

  HomesGuestsLoveCard(
      {required this.image,
      required this.name,
      required this.location,
      required this.cost,
      required this.rating});

  final List<Widget> _starsRating = [];

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < rating; i++) {
      _starsRating.add(Icon(
        Icons.star,
        color: ThemeColors.coral400,
      ));
    }

    return GestureDetector(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width / 1.7,
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              name,
              style: textTheme.bodyText1!
                  .merge(TextStyle(color: ThemeColors.black)),
            ),
            Text(
              location,
              style: textTheme.bodyText2!
                  .merge(TextStyle(color: ThemeColors.grey300)),
            ),
            Text(
              cost,
              style: textTheme.bodyText1!.merge(TextStyle(
                  color: ThemeColors.teal800, fontWeight: FontWeight.w400)),
            ),
            Row(
              children: _starsRating,
            )
          ],
        ),
      ),
    );
  }
}
