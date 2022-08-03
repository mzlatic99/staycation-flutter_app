import 'package:flutter/material.dart';
import 'package:devcademy_flutter/theme.dart';

import '../models/location.dart';

class LocationCard extends StatelessWidget {
  final Location location;

  LocationCard({required this.location});

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
              image: NetworkImage(location.imageUrl),
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
                location.locationName,
                style: textTheme.bodyText1!.copyWith(color: ThemeColors.white),
              ),
              Text(
                '${location.properties} properties',
                style: textTheme.bodyText2!.copyWith(color: ThemeColors.white),
              )
            ],
          ),
        )
      ],
    );
  }
}
