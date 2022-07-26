import 'package:devcademy_flutter/theme.dart';
import 'package:flutter/material.dart';

class LocationCard extends StatelessWidget {
  final String locationImage;
  final String locationName;
  final int locationProperties;

  LocationCard(
      {required this.locationImage,
      required this.locationName,
      required this.locationProperties});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(locationImage),
              fit: BoxFit.cover,
            )),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  ThemeColors.black.withOpacity(0.3),
                  ThemeColors.white.withOpacity(0)
                ],
              )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                locationName,
                style: textTheme.bodyText1,
              ),
              Text(
                '$locationProperties properties',
                style: textTheme.bodyText2,
              )
            ],
          ),
        )
      ],
    );
  }
}
