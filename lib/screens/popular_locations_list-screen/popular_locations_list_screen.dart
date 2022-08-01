import '../../assets.dart';
import 'package:flutter/material.dart';
import '../../shared/top_navbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../theme.dart';
import '../../http.dart';
import '../../models/location.dart';
import '../../shared/popular_locations_card.dart';

class PopularLocationsListScreen extends StatelessWidget {
  final List<LocationCard> _locationCardList = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: TopNavBar(
            title: 'Popular locations',
            leading: SvgPicture.asset(
              Assets.icons.back,
              width: 18,
              color: ThemeColors.teal800,
            ),
          ),
          body: FutureBuilder(
            future: http.getAllLocations(),
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
              List<Location> locations = snapshot.data;
              for (var location in locations) {
                _locationCardList.add(LocationCard(
                    id: location.id,
                    locationImage: location.imageUrl,
                    locationName: location.locationName,
                    locationProperties: location.properties));
              }
              return GridView.count(
                shrinkWrap: true,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                padding: const EdgeInsets.all(20),
                crossAxisCount: 2,
                children: _locationCardList,
              );
            },
          )),
    );
  }
}
