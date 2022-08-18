import 'package:flutter/material.dart';
import '../models/accommodation.dart';

class Accommodations with ChangeNotifier {
  List<Accommodation> _accommodations = [];

  List<Accommodation> get accommodations {
    return [..._accommodations];
  }

  List<Accommodation> _myAccommodations = [];

  List<Accommodation> get myAccommodations {
    return [..._myAccommodations];
  }

  void addAccommodation(accommodation) {
    _accommodations.add(accommodation);
  }

  void clearAccommodation() {
    _accommodations.clear();
  }

  void addMyAccommodation(accommodation) {
    _myAccommodations.add(accommodation);
  }

  void clearMyAccommodation() {
    _myAccommodations.clear();
  }
}
