import 'package:conews_flutter/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget rowOutlineButton(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Icon(
        FontAwesomeIcons.circleNotch,
        color: Colors.lightBlueAccent,
      ),
      SizedBox(
        width: 10.0,
      ),
      Text(
        languages.update(context),
        style: TextStyle(fontSize: 20.0),
      ),
    ],
  );
}
