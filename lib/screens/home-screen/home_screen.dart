import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../../theme.dart';
import '../../assets.dart';
import '../../router.dart';

import '../../shared/top_navbar.dart';
import '../../shared/bottom_navbar.dart';
import 'widgets/homes_guests_love.dart';
import 'widgets/popular_locations.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;

  void getCurrentUser() async {
    try {
      final User? user = _auth.currentUser;

      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: TopNavBar(
        title: 'Staycation',
        actionIcons: [
          GestureDetector(
            onTap: () => router.navigateTo(context, Routes.searchScreen, null),
            child: SvgPicture.asset(
              Assets.icons.search,
              width: 18,
              color: ThemeColors.teal800,
            ),
          ),
          Container(
            width: 25,
            padding: const EdgeInsets.only(right: 10),
            child: DropdownButtonHideUnderline(
              child: DropdownButton2(
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  isExpanded: true,
                  scrollbarAlwaysShow: false,
                  dropdownWidth: 153,
                  icon: SvgPicture.asset(
                    Assets.icons.more,
                    color: ThemeColors.teal800,
                    height: 18,
                  ),
                  items: [
                    DropdownMenuItem(
                      value: 'logout',
                      child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Logout',
                              style: textTheme.bodyText2!.copyWith(
                                color: ThemeColors.teal800,
                              ),
                            ),
                            SvgPicture.asset(
                              Assets.icons.logout,
                              color: ThemeColors.teal800,
                            ),
                          ]),
                    ),
                  ],
                  onChanged: (item) {
                    _auth.signOut();
                    router.navigateTo(
                        context, Routes.authenticationScreen, null);
                  }),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PopularLocations(),
            HomesGuestsLove(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(index: 0),
    );
  }
}
