import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme.dart';

class TopNavBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final List<GestureDetector>? actionIcons;
  final GestureDetector? leading;

  TopNavBar({required this.title, this.actionIcons, this.leading});

  List<Widget> newActionIcons = [];
  void addActionIcons() {
    for (int i = 0; i < actionIcons!.length; i++) {
      newActionIcons.add(
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: actionIcons![i],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (actionIcons != null) {
      addActionIcons();
    }
    return AppBar(
      automaticallyImplyLeading: false,
      title: leading != null
          ? Row(
              children: [
                leading!,
                const SizedBox(
                  width: 32,
                ),
                Text(
                  title,
                  style: textTheme.headline6!.copyWith(
                    color: ThemeColors.teal800,
                  ),
                ),
              ],
            )
          : Text(title, style: textTheme.headline6),
      // leading: leading,
      actions: newActionIcons,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
