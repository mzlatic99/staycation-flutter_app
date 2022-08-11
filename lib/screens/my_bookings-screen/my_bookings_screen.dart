import 'package:devcademy_flutter/models/reservation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../assets.dart';
import '../../theme.dart';
import '../../http.dart';
import '../../models/reservation.dart';
import '../../models/accommodation.dart';
import '../../providers/accommodations_provider.dart';

import '../../shared/top_navbar.dart';
import '../../shared/bottom_navbar.dart';
import '../../shared/homes_guests_love_card.dart';

class MyBookingsScreen extends StatelessWidget {
  final List<HomesGuestsLoveCard> _myReservationsList = [];
  @override
  Widget build(BuildContext context) {
    final accommodationData =
        Provider.of<Accommodations>(context, listen: false);
    return Scaffold(
      appBar: TopNavBar(
        title: 'My Bookings',
        actionIcons: [
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(Assets.icons.more),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(index: 1),
      body: SafeArea(
        child: Column(
          children: [
            FutureBuilder(
              future: http.getReservations(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) {
                  return const Center(child: Text('error'));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: CircularProgressIndicator(
                    color: ThemeColors.mint500,
                  ));
                }
                List<Reservation> reservations = snapshot.data;
                List<Accommodation> accommodations =
                    accommodationData.accommodations;

                for (var reservation in reservations) {
                  var hallId = int.parse(reservation.homesAllId);
                  var accommodation = accommodations
                      .firstWhere((e) => int.parse(e.id) == hallId);

                  _myReservationsList.add(
                    HomesGuestsLoveCard(
                        checkIn: reservation.checkIn,
                        checkOut: reservation.checkOut,
                        accommodation: Accommodation(
                          id: accommodation.id,
                          imageUrl: accommodation.imageUrl,
                          title: accommodation.title,
                          location: accommodation.location,
                          price: accommodation.price,
                          categorization: accommodation.categorization,
                          shortDescription: accommodation.shortDescription,
                          longDescription: accommodation.longDescription,
                          postalCode: accommodation.postalCode,
                          capacity: accommodation.capacity,
                          accommodationType: accommodation.accommodationType,
                          freeCancelation: accommodation.freeCancelation,
                        ),
                        isHorizontalList: false),
                  );
                }

                return Expanded(
                  child: ListView(
                    padding: const EdgeInsets.only(top: 24),
                    children: _myReservationsList,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
