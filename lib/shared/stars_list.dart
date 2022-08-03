import 'package:flutter/material.dart';

import '../theme.dart';

class StarsList extends StatelessWidget {
  final int categorization;
  StarsList({required this.categorization});

  final List<Widget> _starsRating = [];

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < categorization; i++) {
      _starsRating.add(Icon(
        Icons.star,
        color: ThemeColors.coral400,
      ));
    }
    return Row(
      children: _starsRating,
    );
  }
}
