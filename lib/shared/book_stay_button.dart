import 'package:flutter/material.dart';

import '../theme.dart';

class BookStayButton extends StatelessWidget {
  final Function function;
  BookStayButton({required this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => function(),
        child: Text(
          'BOOK YOUR STAY',
          style: textTheme.button!.copyWith(color: ThemeColors.white),
        ),
      ),
    );
  }
}
