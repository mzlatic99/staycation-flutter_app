import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../theme.dart';
import '../../../models/accommodation.dart';
import '../../../assets.dart';
import '../../../http.dart';
import '../../../router.dart';

import '../../../shared/stars_list.dart';

class MyPlaceCard extends StatelessWidget {
  final Accommodation accommodation;
  MyPlaceCard({required this.accommodation});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(accommodation.id),
      background: Container(
        color: ThemeColors.red500,
        child: Padding(
          padding: const EdgeInsets.all(60),
          child: SvgPicture.asset(
            Assets.icons.delete,
            alignment: Alignment.centerRight,
            color: ThemeColors.white,
          ),
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (DismissDirection direction) async {
        return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                'Delete listing?',
                style: textTheme.headline5,
              ),
              content: Text(
                'Are you sure you want to delete this listing?'
                '\nThis action cannot be reversed.',
                style: textTheme.bodyText2!.copyWith(
                    color: ThemeColors.teal800,
                    height: 1.2,
                    letterSpacing: 0.25),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text(
                    'CANCEL',
                    style:
                        textTheme.button!.copyWith(color: ThemeColors.mint500),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text(
                    'DELETE',
                    style:
                        textTheme.button!.copyWith(color: ThemeColors.mint500),
                  ),
                ),
              ],
            );
          },
        );
      },
      onDismissed: (DismissDirection direction) {
        http.deletePlace(int.parse(accommodation.id));
      },
      child: GestureDetector(
        onTap: () =>
            router.navigateTo(context, Routes.addNewPlaceScreen, accommodation),
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
                  accommodation.imageUrl,
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
                        accommodation.title,
                        style: textTheme.bodyText1!
                            .copyWith(color: ThemeColors.black),
                      ),
                    ),
                    Text(
                      accommodation.location,
                      style: textTheme.bodyText2!
                          .copyWith(color: ThemeColors.grey300),
                    ),
                    Text(
                      'Renting an entire unit',
                      style: textTheme.bodyText2!.copyWith(
                          color: ThemeColors.teal800,
                          fontWeight: FontWeight.w600),
                    ),
                    StarsList(categorization: accommodation.categorization),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
