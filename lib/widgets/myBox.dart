import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyBox extends StatelessWidget {
  final int totalPassado;
  final IconData icone;
  final String title;
  final Color color;

  const MyBox({this.totalPassado, this.icone, this.title, this.color});

  @override
  Widget build(BuildContext context) {
    var f = new NumberFormat("###,###,###", "fr");
    return Container(
      height: 90.0,
      child: Card(
        elevation: 5.0,
        child: ListTile(
          leading: Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(
              icone,
              size: 60.0,
              color: color,
            ),
          ),
          title: Text(
            f.format(totalPassado),
            style: TextStyle(fontSize: 24.0),
          ),
          subtitle: Text(title),
        ),
      ),
    );
  }
}
