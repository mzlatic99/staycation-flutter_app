import 'package:devcademy_flutter/models/accommodation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../assets.dart';
import '../../theme.dart';
import '../../router.dart';
import '../../http.dart';
import '../../providers/accommodations_provider.dart';

import '../../shared/top_navbar.dart';

class AddNewPlaceScreen extends StatefulWidget {
  const AddNewPlaceScreen({Key? key}) : super(key: key);

  @override
  State<AddNewPlaceScreen> createState() => _AddNewPlaceScreenState();
}

class _AddNewPlaceScreenState extends State<AddNewPlaceScreen> {
  final _formKey = GlobalKey<FormState>();
  final _switchKey = GlobalKey<FormFieldState>();
  String _categoryValue = 'Accommodation type';
  bool _freeCancelation = false;
  Map<String, dynamic> accommodation = {
    'id': null,
    'imageUrl': null,
    'title': null,
    'location': null,
    'price': null,
    'categorization': null,
    'shortDescription': null,
    'longDescription': null,
    'postalCode': null,
    'capacity': null,
    'accommodationType': null,
    'freeCancelation': null,
  };

  Accommodation? _editedAccommodation;

  void _saveForm(bool edit) async {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
      edit
          ? await http.editPlace(int.parse(accommodation['id']), accommodation)
          : await http.addNewPlace(accommodation);
      await router.navigateTo(context, Routes.myPlacesScreen, null);
    }
  }

  @override
  Widget build(BuildContext context) {
    final accommodationData =
        Provider.of<Accommodations>(context, listen: false);
    final accommodationReceiver = ModalRoute.of(context)!.settings.arguments;
    if (accommodationReceiver != null) {
      _editedAccommodation = accommodationReceiver as Accommodation;
      _freeCancelation = _editedAccommodation!.freeCancelation!;
    }

    return Scaffold(
      appBar: TopNavBar(
        title: 'Add new place',
        leading: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              router.goBack(context);
            },
            child: SvgPicture.asset(
              Assets.icons.close,
              color: ThemeColors.teal800,
            )),
        actionIcons: [
          GestureDetector(
            onTap: () {
              accommodationReceiver == null
                  ? _saveForm(false)
                  : _saveForm(true);
            },
            child: Center(
              child: Text(
                'SAVE',
                style: textTheme.button,
              ),
            ),
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            height: 900,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(
                  initialValue: accommodationReceiver == null
                      ? null
                      : _editedAccommodation!.title,
                  decoration: const InputDecoration(
                    labelText: 'Listing name',
                  ),
                  onSaved: (v) {
                    accommodation['title'] = v;
                    accommodationReceiver == null
                        ? accommodation['id'] = (int.parse(
                                    accommodationData.accommodations.last.id) +
                                1)
                            .toString()
                        : accommodation['id'] = _editedAccommodation!.id;
                  },
                  textInputAction: TextInputAction.next,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'Please enter a title.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  initialValue: accommodationReceiver == null
                      ? null
                      : _editedAccommodation!.shortDescription,
                  decoration:
                      const InputDecoration(labelText: 'Short description'),
                  onSaved: (v) => accommodation['shortDescription'] = v,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'Please enter a description.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  initialValue: accommodationReceiver == null
                      ? null
                      : _editedAccommodation!.longDescription,
                  decoration: const InputDecoration(
                      labelText: 'Long description', alignLabelWithHint: true),
                  onSaved: (v) => accommodation['longDescription'] = v,
                  maxLines: 4,
                  keyboardType: TextInputType.multiline,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'Please enter a description.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  initialValue: accommodationReceiver == null
                      ? null
                      : _editedAccommodation!.categorization.toString(),
                  decoration: const InputDecoration(
                      labelText: 'Categorization (Number of stars)'),
                  keyboardType: TextInputType.number,
                  onSaved: (v) =>
                      accommodation['categorization'] = int.parse(v as String),
                  textInputAction: TextInputAction.next,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'Please provide a value.';
                    }
                    if (v.contains(RegExp(r'[A-Z]')) ||
                        v.contains(RegExp(r'[a-z]'))) {
                      return 'Please enter a number.';
                    }
                    if (int.parse(v) < 1 || int.parse(v) > 5) {
                      return 'Please enter a value between 1 and 5.';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField(
                  style: textTheme.labelMedium!
                      .copyWith(color: ThemeColors.grey500),
                  items: <String>[
                    'Accommodation type',
                    'Room',
                    'Apartment',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  value: accommodationReceiver == null
                      ? _categoryValue
                      : _editedAccommodation!.accommodationType,
                  onChanged: (String? newValue) {
                    setState(() {
                      _categoryValue = newValue!;
                    });
                  },
                  onSaved: (v) => accommodation['accommodationType'] = v,
                  validator: (v) {
                    if (v == 'Accommodation type') {
                      return 'Please choose correct type.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  initialValue: accommodationReceiver == null
                      ? null
                      : _editedAccommodation!.capacity.toString(),
                  decoration: const InputDecoration(labelText: 'Capacity'),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  onSaved: (v) =>
                      accommodation['capacity'] = int.parse(v as String),
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'Please provide a value.';
                    }
                    if (v.contains(RegExp(r'[A-Z]')) ||
                        v.contains(RegExp(r'[a-z]'))) {
                      return 'Please enter a number.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  initialValue: accommodationReceiver == null
                      ? null
                      : _editedAccommodation!.price.toString(),
                  decoration: const InputDecoration(labelText: 'Price'),
                  textInputAction: TextInputAction.next,
                  onSaved: (v) =>
                      accommodation['price'] = int.parse(v as String),
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'Please provide a value.';
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
                        initialValue: accommodationReceiver == null
                            ? null
                            : _editedAccommodation!.location,
                        decoration:
                            const InputDecoration(labelText: 'Location'),
                        textInputAction: TextInputAction.next,
                        onSaved: (v) => accommodation['location'] = v,
                        validator: (v) {
                          if (v!.isEmpty) {
                            return 'Please enter a location.';
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
                        initialValue: accommodationReceiver == null
                            ? null
                            : _editedAccommodation!.postalCode,
                        decoration:
                            const InputDecoration(labelText: 'Postal code'),
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        onSaved: (v) => accommodation['postalCode'] = v,
                        validator: (v) {
                          if (v!.isEmpty) {
                            return 'Please enter a number.';
                          }
                          return null;
                        },
                      ),
                    )
                  ],
                ),
                TextFormField(
                  initialValue: accommodationReceiver == null
                      ? null
                      : _editedAccommodation!.imageUrl,
                  decoration:
                      const InputDecoration(labelText: 'Listing image URL'),
                  keyboardType: TextInputType.url,
                  textInputAction: TextInputAction.next,
                  onSaved: (v) => accommodation['imageUrl'] = v,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'Please enter a image URL.';
                    }
                    if (!v.startsWith('http')) {
                      return 'Please enter a valid URL.';
                    }
                    return null;
                  },
                ),
                FormField(
                  key: _switchKey,
                  initialValue: _freeCancelation,
                  validator: (v) {
                    return null;
                  },
                  onSaved: (v) => accommodation['freeCancelation'] =
                      _switchKey.currentState!.value,
                  builder: (FormFieldState<bool> field) {
                    return SwitchListTile(
                      visualDensity: VisualDensity.compact,
                      title: Text(
                        "Free cancelation available",
                        style: textTheme.bodyText1!
                            .copyWith(color: ThemeColors.teal800),
                      ),
                      value: field.value!,
                      onChanged: (v) {
                        field.didChange(v);
                      },
                      activeColor: ThemeColors.mint500,
                      activeTrackColor: ThemeColors.mint200,
                      inactiveThumbColor: ThemeColors.white,
                      inactiveTrackColor: ThemeColors.grey200,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
