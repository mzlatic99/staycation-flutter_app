import 'package:devcademy_flutter/models/reservation.dart';
import 'package:devcademy_flutter/screens/my_bookings-screen/widgets/my_bookings_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../assets.dart';
import '../../theme.dart';
import '../../http.dart';
import '../../models/reservation.dart';

import '../../shared/top_navbar.dart';
import '../../shared/bottom_navbar.dart';
import '../../shared/homes_guests_love_card.dart';
import './widgets/my_bookings_card.dart';

class MyBookingsScreen extends StatelessWidget {
  final List<MyBookingsCard> _myReservationsList = [];
  @override
  Widget build(BuildContext context) {
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
                for (var reservation in reservations) {
                  _myReservationsList.add(MyBookingsCard(
                      checkIn: reservation.checkIn,
                      checkOut: reservation.checkOut,
                      image:
                          'https://cf.bstatic.com/xdata/images/hotel/max1024x768/72282092.jpg?k=5eeba7eb191652ce0c0988b4c7c042f1165b7064d865b096bb48b8c48bf191b9&o=&hp=1',
                      location: 'Split',
                      title: 'Neki title',
                      categorization: 4));
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
