import 'package:flutter/material.dart';
import '../../shared/top_navbar.dart';
import '../../assets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../theme.dart';
import '../../models/accommodation.dart';
import '../../http.dart';
import '../../shared/homes_guests_love_card.dart';

class HomesGuestsLoveScreen extends StatelessWidget {
  final List<HomeGuestsLoveCard> _homesGuestsLoveList = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: TopNavBar(
            title: 'Homes guests love',
            leading: SvgPicture.asset(
              Assets.icons.back,
              width: 18,
              color: ThemeColors.teal800,
            ),
            actionIcons: [
              SvgPicture.asset(
                Assets.icons.search,
                width: 18,
                color: ThemeColors.teal800,
              )
            ],
          ),
          body: SafeArea(
            child: Column(
              children: [
                FutureBuilder(
                  future: http.getAllHomes(),
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
                    List<Accommodation> accommodations = snapshot.data;
                    for (var accommodation in accommodations) {
                      _homesGuestsLoveList.add(
                        HomeGuestsLoveCard(
                          isHorizontalList: false,
                          accommodation: Accommodation(
                            id: accommodation.id,
                            imageUrl: accommodation.imageUrl,
                            title: accommodation.title,
                            location: accommodation.location,
                            price: accommodation.price,
                            categorization: accommodation.categorization,
                          ),
                        ),
                      );
                    }
                    return Expanded(
                      child: ListView(
                        padding: const EdgeInsets.only(top: 24),
                        children: _homesGuestsLoveList,
                      ),
                    );
                  },
                ),
              ],
            ),
          )),
    );
  }
}
