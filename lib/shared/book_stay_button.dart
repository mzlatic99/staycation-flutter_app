import 'package:flutter/material.dart';

import '../theme.dart';

class BookStayButton extends StatelessWidget {
  final Function function;
  final String title;
  BookStayButton({required this.function, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => function(),
        child: Text(
          title,
          style: textTheme.button!.copyWith(color: ThemeColors.white),
        ),
      ),
    );
  }
}
