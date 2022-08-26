import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../assets.dart';
import '../../router.dart';
import '../../theme.dart';
import '../../models/accommodation.dart';
import '../../http.dart';

import '../../shared/top_navbar.dart';
import '../../shared/book_stay_button.dart';
import '../../shared/stars_list.dart';

class BookStayScreen extends StatefulWidget {
  @override
  State<BookStayScreen> createState() => _BookStayScreenState();
}

class _BookStayScreenState extends State<BookStayScreen> {
  final _formKey = GlobalKey<FormState>();
  final _checkInController = TextEditingController();
  final _checkOutController = TextEditingController();
  late String checkIn;
  late String checkOut;
  Map<String, dynamic> reservation = {
    'id': null,
    'fullName': null,
    'email': null,
    'numberOfGuests': null,
    'checkIn': null,
    'checkOut': null,
    'homes-allId': null,
  };

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  void _datePicker(TextEditingController controller, String inOrOut) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 2),
    ).then((selectedDate) {
      if (selectedDate != null) {
        if (inOrOut == 'checkIn') {
          checkIn = '${selectedDate.toIso8601String()}Z';
        } else {
          checkOut = '${selectedDate.toIso8601String()}Z';
        }
        reservation[inOrOut] = controller.text =
            (DateFormat.yMMMd().format(selectedDate)).toString();
      }
    });
  }

  void _saveForm(Accommodation accommodation) async {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
      reservation['id'] = accommodation.id.toString();
      reservation['homes-allId'] = accommodation.id.toString();
      final difference =
          daysBetween(reservation['checkIn'], reservation['checkOut']);
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(
            'Confirm booking',
            style: textTheme.headline5,
          ),
          contentTextStyle: textTheme.bodyText2!.copyWith(
            color: ThemeColors.teal800,
          ),
          titlePadding: const EdgeInsets.all(20),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          insetPadding: EdgeInsets.zero,
          actionsPadding: const EdgeInsets.fromLTRB(32, 10, 20, 10),
          content: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  accommodation.title,
                ),
                Text(
                  '${reservation['numberOfGuests']} guests',
                ),
                Text(
                  '${DateFormat.yMMMd().format(reservation['checkIn'])} - ${DateFormat.yMMMd().format(reservation['checkOut'])}',
                ),
                Text(
                  '${accommodation.accommodationType![0].toUpperCase()}${accommodation.accommodationType!.substring(1)}',
                ),
                Text(
                  accommodation.location,
                ),
                Text(
                  'EUR ${difference * reservation['numberOfGuests'] * accommodation.price}',
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                router.goBack(context);
              },
              child: Text(
                'CANCEL',
                style: textTheme.button!.copyWith(color: ThemeColors.mint500),
              ),
            ),
            TextButton(
              onPressed: () async {
                reservation['checkIn'] = checkIn;
                reservation['checkOut'] = checkOut;
                await http.bookPlace(reservation);
                await router.navigateTo(context, Routes.myBookingsScreen, null);
              },
              child: Text(
                'CONFIRM',
                style: textTheme.button!.copyWith(color: ThemeColors.mint500),
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  void dispose() {
    _checkInController.dispose();
    _checkOutController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final accommodation =
        ModalRoute.of(context)!.settings.arguments as Accommodation;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: TopNavBar(
        title: 'Book your stay',
        leading: GestureDetector(
          onTap: () => router.goBack(context),
          child: SvgPicture.asset(
            Assets.icons.back,
            color: ThemeColors.teal800,
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BookStayButton(
          title: 'BOOK YOUR STAY',
          function: () {
            FocusScope.of(context).unfocus();
            _saveForm(accommodation);
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.zero,
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: ThemeColors.grey100, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                constraints: const BoxConstraints(maxHeight: 156),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.network(
                        accommodation.imageUrl,
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: 156,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.5),
                            child: Text(
                              accommodation.title,
                              style: textTheme.bodyText1!.copyWith(
                                color: ThemeColors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          StarsList(
                              categorization: accommodation.categorization),
                          Text(
                            '${accommodation.accommodationType![0].toUpperCase()}${accommodation.accommodationType!.substring(1)}',
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
                          Text(
                            'EUR ${accommodation.price} per night',
                            style: textTheme.bodyText2!.copyWith(
                              color: ThemeColors.teal800,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Full Name',
                        ),
                        onSaved: (v) {
                          reservation['fullName'] = v;
                        },
                        textInputAction: TextInputAction.next,
                        validator: (v) {
                          if (v!.isEmpty) {
                            return 'Please enter Your name.';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Email address',
                        ),
                        onSaved: (v) {
                          reservation['email'] = v;
                        },
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        validator: (v) {
                          if (v!.isEmpty) {
                            return 'Please enter a e-mail.';
                          }
                          if (!v.contains('@')) {
                            return 'Please enter a valid e-mail.';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Number of guests',
                        ),
                        onSaved: (v) {
                          reservation['numberOfGuests'] = int.parse(v!);
                        },
                        keyboardType: TextInputType.number,
                        validator: (v) {
                          if (v!.isEmpty) {
                            return 'Please enter a value.';
                          }
                          if (v.contains(RegExp(r'[A-Z]')) ||
                              v.contains(RegExp(r'[a-z]'))) {
                            return 'Please enter a number.';
                          }
                          return null;
                        },
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: TextFormField(
                              onTap: () =>
                                  _datePicker(_checkInController, 'checkIn'),
                              controller: _checkInController,
                              keyboardType: TextInputType.none,
                              decoration: InputDecoration(
                                labelText: 'Check in',
                                suffixIcon: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 17),
                                  child: SvgPicture.asset(
                                    Assets.icons.calendar,
                                    color: ThemeColors.grey300,
                                  ),
                                ),
                              ),
                              onSaved: (v) => reservation['checkIn'] =
                                  DateFormat('MMM d, yyyy').parse(v!),
                              validator: (v) {
                                if (v!.isEmpty) {
                                  return 'Please enter a date.';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: TextFormField(
                              onTap: () =>
                                  _datePicker(_checkOutController, 'checkOut'),
                              controller: _checkOutController,
                              keyboardType: TextInputType.none,
                              decoration: InputDecoration(
                                labelText: 'Check out',
                                suffixIcon: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 17),
                                  child: SvgPicture.asset(
                                    Assets.icons.calendar,
                                    color: ThemeColors.grey300,
                                  ),
                                ),
                              ),
                              onSaved: (v) => reservation['checkOut'] =
                                  DateFormat('MMM d, yyyy').parse(v!),
                              validator: (v) {
                                if (v!.isEmpty) {
                                  return 'Please enter a date.';
                                }
                                return null;
                              },
                            ),
                          )
                        ],
                      ),
                    ],
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
