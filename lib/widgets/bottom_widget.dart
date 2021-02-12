import 'package:conews_flutter/screens/chart_screen.dart';
import 'package:conews_flutter/utilities/language_helper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomWidgetCountry extends StatefulWidget {
  final int newCases;
  final int newDeaths;
  final int totalConfirmed;
  final int totalRecovered;
  final int totalDeaths;
  final String dataNow;
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
        Text('${languages.newCases(context)}${': ${widget.newCases}'}'),
        Text('${languages.newDeaths(context)}${': ${widget.newDeaths}'}'),
        SizedBox(
          width: double.infinity,
          height: 45.0,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: const BorderSide(color: Colors.white),
              ),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(
                  FontAwesomeIcons.chartBar,
                  color: Colors.lightBlueAccent,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  languages.charts(context),
                  style: const TextStyle(fontSize: 20.0),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
