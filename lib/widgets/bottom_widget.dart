import 'package:conews_flutter/screens/chart_screen.dart';
import 'package:conews_flutter/utilities/language_helper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomWidgetCountry extends StatefulWidget {
  final newCases;
  final newDeaths;
  final totalConfirmed;
  final totalRecovered;
  final totalDeaths;
  final dataNow;
  final apiData;

  const BottomWidgetCountry({
    this.newDeaths,
    this.newCases,
    this.totalConfirmed,
    this.totalRecovered,
    this.totalDeaths,
    this.dataNow,
    this.apiData,
  });
  @override
  _BottomWidgetCountryState createState() => _BottomWidgetCountryState();
}

class _BottomWidgetCountryState extends State<BottomWidgetCountry> {
  LanguagesHelper languages = LanguagesHelper();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(languages.newCases(context) + ': ${widget.newCases}'),
        Text(languages.newDeaths(context) + ': ${widget.newDeaths}'),
        SizedBox(
          width: double.infinity,
          height: 45.0,
          child: OutlineButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.chartBar,
                  color: Colors.lightBlueAccent,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  languages.charts(context),
                  style: TextStyle(fontSize: 20.0),
                ),
              ],
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChartPage(
                    casosConfirmados: widget.totalConfirmed,
                    mortesConfirmadas: widget.totalDeaths,
                    recuperadosConfirmados: widget.totalRecovered,
                  ),
                ),
              );
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}
