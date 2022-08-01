import 'package:devcademy_flutter/shared/top_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../assets.dart';
import '../../models/accommodation.dart';
import '../../http.dart';
import '../../theme.dart';

class AccommodationDetailsScreen extends StatelessWidget {
  const AccommodationDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: theme,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
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
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
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
                      final List<Widget> starsRating = [];
                      for (int i = 0; i < 4; i++) {
                        starsRating.add(Icon(
                          Icons.star,
                          color: ThemeColors.coral400,
                        ));
                      }
                      return DraggableScrollableSheet(
                        minChildSize: 0.7,
                        maxChildSize: 1.0,
                        initialChildSize: 0.7,
                        builder: ((context, scrollController) =>
                            SingleChildScrollView(
                              controller: scrollController,
                              child: Container(
                                constraints: BoxConstraints(
                                    maxHeight:
                                        MediaQuery.of(context).size.height *
                                            1.0),
                                padding:
                                    const EdgeInsets.fromLTRB(20, 24, 20, 100),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12)),
                                  color: ThemeColors.white,
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                    Text(
                                      accommodations[1].title,
                                      style: textTheme.headline6,
                                    ),
                                    Row(children: starsRating),
                                    Text(accommodations[1].shortDescription,
                                        style: textTheme.bodyText2!.copyWith(
                                            color: ThemeColors.grey500)),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          Assets.icons.calendar,
                                          color: ThemeColors.coral500,
                                        ),
                                        const SizedBox(width: 20),
                                        Text(
                                            accommodations[1].freeCancelation
                                                ? 'Free cancellation available'
                                                : 'Free cancellation unavailable',
                                            style: textTheme.bodyText2!
                                                .copyWith(
                                                    fontWeight: FontWeight.w600,
                                                    color:
                                                        ThemeColors.teal800)),
                                      ],
                                    ),
                                    Text(accommodations[1].longDescription,
                                        style: textTheme.bodyText1!.copyWith(
                                            color: ThemeColors.teal800)),
                                    Text('Property info:',
                                        style: textTheme.bodyText1!.copyWith(
                                            fontWeight: FontWeight.w600)),
                                    Text(
                                      '${accommodations[1].capacity} guest${accommodations[1].capacity != 1 ? 's' : ''}',
                                      style: textTheme.bodyText2!
                                          .copyWith(color: ThemeColors.teal800),
                                    ),
                                    Text(
                                      accommodations[1].accommodationType,
                                      style: textTheme.bodyText2!
                                          .copyWith(color: ThemeColors.teal800),
                                    ),
                                    Text(
                                      'EUR ${accommodations[1].price} per night',
                                      style: textTheme.bodyText2!
                                          .copyWith(color: ThemeColors.teal800),
                                    ),
                                    Text(
                                      accommodations[1].location,
                                      style: textTheme.bodyText2!
                                          .copyWith(color: ThemeColors.teal800),
                                    ),
                                    Text(
                                      accommodations[1].postalCode,
                                      style: textTheme.bodyText2!
                                          .copyWith(color: ThemeColors.teal800),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      );
                    },
                  ),
                ],
              )),
        ));
  }
}
