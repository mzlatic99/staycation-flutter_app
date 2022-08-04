import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../assets.dart';
import '../../theme.dart';

import '../../shared/stars_list.dart';
import '../../shared/top_navbar.dart';

class AccommodationDetailsScreen extends StatefulWidget {
  @override
  State<AccommodationDetailsScreen> createState() =>
      _AccommodationDetailsScreenState();
}

class _AccommodationDetailsScreenState
    extends State<AccommodationDetailsScreen> {
  var isSheetFullScreen = false;
  //pass data from previous screen
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        floatingActionButton: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              'BOOK YOUR STAY',
              style: textTheme.button!.copyWith(color: ThemeColors.white),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          left: false,
          right: false,
          child: Stack(
            children: [
              Image.asset(
                Assets.images.barcelona,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 28),
                child: SvgPicture.asset(
                  Assets.icons.back,
                  width: 18,
                  color: ThemeColors.teal800,
                ),
              ),
              NotificationListener<DraggableScrollableNotification>(
                onNotification: (notification) {
                  final dragRatio =
                      (notification.extent - notification.minExtent) /
                          (notification.maxExtent - notification.minExtent);
                  if (dragRatio == 1.0) {
                    setState(() {
                      isSheetFullScreen = true;
                    });
                  } else {
                    setState(() {
                      isSheetFullScreen = false;
                    });
                  }
                  return isSheetFullScreen;
                },
                child: DraggableScrollableSheet(
                  minChildSize: 0.7,
                  maxChildSize: 1.0,
                  initialChildSize: 0.7,
                  builder: ((context, scrollController) =>
                      SingleChildScrollView(
                        controller: scrollController,
                        child: Container(
                          constraints: BoxConstraints(
                              maxHeight:
                                  MediaQuery.of(context).size.height * 1.0),
                          padding: const EdgeInsets.fromLTRB(20, 24, 20, 100),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12)),
                            color: ThemeColors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: SizedBox(
                                  width: 28,
                                  child: Divider(
                                    thickness: 3,
                                    color: ThemeColors.grey200,
                                  ),
                                ),
                              ),
                              isSheetFullScreen
                                  ? const SizedBox.shrink()
                                  : Text(
                                      'Split house',
                                      style: textTheme.headline6,
                                    ),
                              StarsList(categorization: 4),
                              Text(
                                  'This property is 3 minutes walk from the beach. Set in a traditional stone house with wooden ceiling beams, Apartment Natalia Old Town offers accommodation in Split, 400 m from Cathedral of St. Domnius and 500 m from Diocletian\'s Palace . Free private parking and free WiFi access are offered.',
                                  style: textTheme.bodyText2!
                                      .copyWith(color: ThemeColors.grey500)),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    Assets.icons.calendar,
                                    color: ThemeColors.coral500,
                                  ),
                                  const SizedBox(width: 20),
                                  Text(
                                      true
                                          ? 'Free cancellation available'
                                          : 'Free cancellation unavailable',
                                      style: textTheme.bodyText2!.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: ThemeColors.teal800)),
                                ],
                              ),
                              Text(
                                  'This property is 1 minute walk from the beach.25 m away from the town\'s sandy beaches. It has a sun terrace and offers air-conditioned apartments with balconies and views of the Adriatic Sea.Apartments feature a living area with a flat-screen TV and satellite channels. They are bright and come equipped with free Wi-Fi and a modern kitchen with a dining area.The villa is a 5-minute walk from bars and restaurants offering fresh seafood. Historical monuments are only 3 km away.',
                                  style: textTheme.bodyText1!
                                      .copyWith(color: ThemeColors.teal800)),
                              Text('Property info:',
                                  style: textTheme.bodyText1!
                                      .copyWith(fontWeight: FontWeight.w600)),
                              Text(
                                '4 guests',
                                style: textTheme.bodyText2!
                                    .copyWith(color: ThemeColors.teal800),
                              ),
                              Text(
                                'Apartment',
                                style: textTheme.bodyText2!
                                    .copyWith(color: ThemeColors.teal800),
                              ),
                              Text(
                                'EUR 200 per night',
                                style: textTheme.bodyText2!
                                    .copyWith(color: ThemeColors.teal800),
                              ),
                              Text(
                                'Split',
                                style: textTheme.bodyText2!
                                    .copyWith(color: ThemeColors.teal800),
                              ),
                              Text(
                                '21000',
                                style: textTheme.bodyText2!
                                    .copyWith(color: ThemeColors.teal800),
                              ),
                            ],
                          ),
                        ),
                      )),
                ),
              ),
              isSheetFullScreen
                  ? Positioned(
                      top: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: TopNavBar(
                        title: 'Split House',
                        leading: SvgPicture.asset(
                          Assets.icons.back,
                          width: 18,
                          color: ThemeColors.teal800,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
