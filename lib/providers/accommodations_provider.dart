import 'package:flutter/material.dart';
import '../models/accommodation.dart';

class Accommodations with ChangeNotifier {
  List<Accommodation> _accommodations = [];

  List<Accommodation> get accommodations {
    return [..._accommodations];
  }

  void addAccommodation() {
    notifyListeners();
  }
}
