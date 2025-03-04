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
    final f = NumberFormat("###,###,###", "fr");
    return SizedBox(
      height: 90.0,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
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
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(
              f.format(totalPassado),
              style: TextStyle(
                fontSize: 24.0,
                color: Theme.of(context).textTheme.headline6.color,
              ),
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(title),
          ),
        ),
      ),
    );
  }
}
