import 'package:conews_flutter/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget rowOutlineButton(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
     const  Icon(
        FontAwesomeIcons.circleNotch,
        color: Colors.lightBlueAccent,
      ),
      const SizedBox(
        width: 10.0,
      ),
      Text(
        languages.update(context),
        style: const TextStyle(fontSize: 20.0),
      ),
    ],
  );
}
