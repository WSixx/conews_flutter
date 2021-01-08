import 'package:conews_flutter/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor;
  final String title;
  final AppBar appBar;
  final IconData icone;

  const MyAppBar(
      {Key key, this.title, this.appBar, this.icone, this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      //titleSpacing: 10.0,
      elevation: 10.0,
      leading: Icon(
        icone,
        color: Colors.green,
        size: 40.0,
      ),
      title: Text(
        title,
        textAlign: TextAlign.center,
      ),
      centerTitle: false,
      backgroundColor: backgroundColor,
      actions: <Widget>[
        Icon(FontAwesomeIcons.lightbulb),
        Consumer<ThemeNotifier>(
          builder: (context, notifier, child) => Switch(
            onChanged: (val) {
              notifier.toggleTheme();
            },
            value: notifier.darkTheme,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
