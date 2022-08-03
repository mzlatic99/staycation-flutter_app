import 'package:flutter/material.dart';
import '../../../theme.dart';

class TitleAndButton extends StatelessWidget {
  TitleAndButton({required this.title, required this.function});
  final String title;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Homes guests love',
          style: textTheme.headline5,
        ),
        TextButton(
            onPressed: function,
            child: Text('VIEW MORE',
                style: textTheme.button!.merge(
                  TextStyle(
                    color: ThemeColors.mint400,
                  ),
                )))
      ],
    );
  }
}
