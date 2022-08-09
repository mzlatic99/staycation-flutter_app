import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/reservation.dart';
import '../../../theme.dart';
import '../../../shared/stars_list.dart';

class MyBookingsCard extends StatelessWidget {
  final DateTime checkIn;
  final DateTime checkOut;
  final String image;
  final String title;
  final String location;
  final int categorization;
  MyBookingsCard(
      {required this.checkIn,
      required this.checkOut,
      required this.image,
      required this.location,
      required this.title,
      required this.categorization});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        constraints: const BoxConstraints(maxHeight: 154),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                image,
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
                    '${DateFormat('dd MMM').format(checkIn)} - ${DateFormat('dd MMM yyyy').format(checkOut)}',
                    style: textTheme.bodyText2!.merge(TextStyle(
                        color: ThemeColors.teal800,
                        fontWeight: FontWeight.w600)),
                  ),
                  StarsList(categorization: categorization),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
