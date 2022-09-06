import 'package:devcademy_flutter/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../assets.dart';
import '../../theme.dart';
import '../../models/accommodation.dart';

import '../../shared/stars_list.dart';
import '../../shared/top_navbar.dart';
import '../../shared/book_stay_button.dart';

class AccommodationDetailsScreen extends StatefulWidget {
  const AccommodationDetailsScreen({Key? key}) : super(key: key);

  @override
  State<AccommodationDetailsScreen> createState() =>
      _AccommodationDetailsScreenState();
}

class _AccommodationDetailsScreenState
    extends State<AccommodationDetailsScreen> {
  var _isSheetFullScreen = false;

  @override
  Widget build(BuildContext context) {
    final accommodation =
        ModalRoute.of(context)!.settings.arguments as Accommodation;
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BookStayButton(
          title: 'BOOK YOUR STAY',
          function: () {
            router.navigateTo(context, Routes.bookStayScreen, accommodation);
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        left: false,
        right: false,
        child: Stack(
          children: [
            Image.network(
              accommodation.imageUrl,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
              fit: BoxFit.cover,
            ),
            NotificationListener<DraggableScrollableNotification>(
              onNotification: (notification) {
                final dragRatio =
                    (notification.extent - notification.minExtent) /
                        (notification.maxExtent - notification.minExtent);
                if (dragRatio == 1.0) {
                  setState(() {
                    _isSheetFullScreen = true;
                  });
                } else {
                  setState(() {
                    _isSheetFullScreen = false;
                  });
                }
                return _isSheetFullScreen;
              },
              child: DraggableScrollableSheet(
                minChildSize: 0.7,
                maxChildSize: 1.0,
                initialChildSize: 0.7,
                builder: ((context, scrollController) => SingleChildScrollView(
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
                            _isSheetFullScreen
                                ? const SizedBox.shrink()
                                : Text(
                                    accommodation.title,
                                    style: textTheme.headline6,
                                  ),
                            StarsList(
                                categorization: accommodation.categorization),
                            Text(accommodation.shortDescription!,
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
                                    accommodation.freeCancelation!
                                        ? 'Free cancellation available'
                                        : 'Free cancellation unavailable',
                                    style: textTheme.bodyText2!.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: ThemeColors.teal800)),
                              ],
                            ),
                            Text(accommodation.longDescription!,
                                style: textTheme.bodyText1!
                                    .copyWith(color: ThemeColors.teal800)),
                            Text('Property info:',
                                style: textTheme.bodyText1!
                                    .copyWith(fontWeight: FontWeight.w600)),
                            Text(
                              '${accommodation.capacity} guest${accommodation.capacity! == 1 ? '' : 's'}',
                              style: textTheme.bodyText2!
                                  .copyWith(color: ThemeColors.teal800),
                            ),
                            Text(
                              '${accommodation.accommodationType![0].toUpperCase()}${accommodation.accommodationType!.substring(1)}',
                              style: textTheme.bodyText2!
                                  .copyWith(color: ThemeColors.teal800),
                            ),
                            Text(
                              'EUR ${accommodation.price} per night',
                              style: textTheme.bodyText2!
                                  .copyWith(color: ThemeColors.teal800),
                            ),
                            Text(
                              accommodation.location,
                              style: textTheme.bodyText2!
                                  .copyWith(color: ThemeColors.teal800),
                            ),
                            Text(
                              accommodation.postalCode!,
                              style: textTheme.bodyText2!
                                  .copyWith(color: ThemeColors.teal800),
                            ),
                          ],
                        ),
                      ),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 28),
              child: GestureDetector(
                onTap: () => router.goBack(context),
                child: SvgPicture.asset(
                  Assets.icons.back,
                  width: 18,
                  color: ThemeColors.teal800,
                ),
              ),
            ),
            _isSheetFullScreen
                ? Positioned(
                    top: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: TopNavBar(
                      title: accommodation.title,
                      leading: GestureDetector(
                        onTap: () => router.goBack(context),
                        child: SvgPicture.asset(
                          Assets.icons.back,
                          width: 18,
                          color: ThemeColors.teal800,
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
