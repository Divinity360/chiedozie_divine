
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Text title;
  final AppBar appBar;
  final Color color;
  final List<Widget> widgets;

  const BaseAppBar({Key key, this.title, this.appBar, this.widgets, this.color = const Color(0xff2A2E43)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: title,
      leading: IconButton(
        icon: Icon(
          MaterialCommunityIcons.chevron_left,
          color: color,
          size: 28,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      actions: widgets,
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}