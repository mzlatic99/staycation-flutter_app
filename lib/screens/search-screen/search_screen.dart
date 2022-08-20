import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../assets.dart';
import '../../router.dart';
import '../../theme.dart';

import '../../shared/top_navbar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();
  final _checkInController = TextEditingController();
  final _checkOutController = TextEditingController();
  Map<String, dynamic> _searchConditionsMap = {
    'searchValue': null,
    'checkIn': null,
    'checkOut': null,
    'numberOfGuests': null,
    'accommodationType': null
  };
  int _numberOfGuests = 1;
  String _pickedAccommodationType = '';

  void _datePicker(TextEditingController controller) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 2),
    ).then((selectedDate) {
      if (selectedDate != null) {
        controller.text = (DateFormat.yMMMd().format(selectedDate)).toString();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _checkInController.dispose();
    _checkOutController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopNavBar(
        title: '',
        leading: GestureDetector(
          onTap: () => router.goBack(context),
          child: SvgPicture.asset(
            Assets.icons.close,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Search places',
              style: textTheme.headline6!.copyWith(
                color: ThemeColors.teal800,
              ),
            ),
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SvgPicture.asset(
                    Assets.icons.search,
                    color: ThemeColors.grey500,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _checkInController,
                    onTap: () => _datePicker(_checkInController),
                    keyboardType: TextInputType.none,
                    decoration: InputDecoration(
                      labelText: 'Check in',
                      suffixIcon: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 17),
                        child: SvgPicture.asset(
                          Assets.icons.calendar,
                          color: ThemeColors.grey300,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: TextField(
                    controller: _checkOutController,
                    onTap: () => _datePicker(_checkOutController),
                    keyboardType: TextInputType.none,
                    decoration: InputDecoration(
                      labelText: 'Check out',
                      suffixIcon: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 17),
                        child: SvgPicture.asset(
                          Assets.icons.calendar,
                          color: ThemeColors.grey300,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Number of guests',
                  style: textTheme.bodyText1,
                ),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: MaterialButton(
                        onPressed: () {
                          if (_numberOfGuests > 1) {
                            setState(() {
                              _numberOfGuests--;
                            });
                          }
                        },
                        shape: CircleBorder(
                            side: BorderSide(color: ThemeColors.grey300)),
                        child: SvgPicture.asset(
                          Assets.icons.remove,
                          fit: BoxFit.fill,
                          color: ThemeColors.grey300,
                          width: 10,
                        ),
                      ),
                    ),
                    Text(
                      '$_numberOfGuests',
                      style: textTheme.bodyText1,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            _numberOfGuests++;
                          });
                        },
                        shape: CircleBorder(
                            side: BorderSide(color: ThemeColors.grey300)),
                        child: SvgPicture.asset(
                          Assets.icons.add,
                          fit: BoxFit.fill,
                          color: ThemeColors.grey300,
                          width: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Accommodation type',
                style: textTheme.bodyText1,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: MaterialButton(
                    color: _pickedAccommodationType == 'Apartment'
                        ? ThemeColors.grey100
                        : null,
                    onPressed: () {
                      setState(() {
                        _pickedAccommodationType = 'Apartment';
                      });
                    },
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: ThemeColors.grey300),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Apartment',
                      style: textTheme.bodyText2!
                          .copyWith(color: ThemeColors.grey300),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: MaterialButton(
                    color: _pickedAccommodationType == 'Room'
                        ? ThemeColors.grey100
                        : null,
                    onPressed: () {
                      setState(() {
                        _pickedAccommodationType = 'Room';
                      });
                    },
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: ThemeColors.grey300),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Room',
                      style: textTheme.bodyText2!
                          .copyWith(color: ThemeColors.grey300),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: MaterialButton(
                    color: _pickedAccommodationType == 'Mobile home'
                        ? ThemeColors.grey100
                        : null,
                    onPressed: () {
                      setState(() {
                        _pickedAccommodationType = 'Mobile home';
                      });
                    },
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: ThemeColors.grey300),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Mobile home',
                      style: textTheme.bodyText2!
                          .copyWith(color: ThemeColors.grey300),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _searchConditionsMap['searchValue'] = _searchController.text;
                  _searchConditionsMap['checkIn'] = _checkInController.text;
                  _searchConditionsMap['checkOut'] = _checkOutController.text;
                  _searchConditionsMap['numberOfGuests'] = _numberOfGuests;
                  _searchConditionsMap['accommodationType'] =
                      _pickedAccommodationType;
                  FocusScope.of(context).unfocus();
                  router.navigateTo(context, Routes.homesGuestsLoveScreen,
                      _searchConditionsMap);
                },
                child: Text(
                  'SEARCH',
                  style: textTheme.button!.copyWith(
                    color: ThemeColors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
