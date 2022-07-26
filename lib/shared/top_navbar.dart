import 'package:devcademy_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../theme.dart';

class TopNavBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final List<SvgPicture>? actionIcons;
  final SvgPicture? leading;

  TopNavBar({required this.title, this.actionIcons, this.leading});

  List<Widget> newActionIcons = [];

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < actionIcons!.length; i++) {
      newActionIcons.add(
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: () {},
            child: actionIcons![i],
          ),
        ),
      );
    }
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        title,
        style: textTheme.headline6!.merge(
          TextStyle(
            color: ThemeColors.teal800,
          ),
        ),
      ),
      leading: leading,
      actions: newActionIcons,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
