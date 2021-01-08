import 'package:conews_flutter/helper/ad_helper.dart';
import 'package:conews_flutter/services/api_data.dart';
import 'package:conews_flutter/utilities/constants.dart';
import 'package:conews_flutter/utilities/language_helper.dart';
import 'package:conews_flutter/widgets/app_bar.dart';
import 'package:conews_flutter/widgets/bottom_widget.dart';
import 'package:conews_flutter/widgets/myBox.dart';
import 'package:conews_flutter/widgets/rowOutlineButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Global extends StatefulWidget {
  final dataApi;
  const Global({this.dataApi});

  @override
  _GlobalState createState() => _GlobalState();
}

class _GlobalState extends State<Global> {
  ApiModel apiModel = ApiModel();
  LanguagesHelper languages = LanguagesHelper();

  String pais = '';
  int novosCasos;
  int totalConfirmados = 0;
  int novasMortes = 0;
  int totalMortes = 0;
  int totalRecuperados = 0;
  String dataAtual;

  bool updateUi2(dynamic apiData) {
    setState(() {
      if (apiData == null) {
        return false;
      }
      totalRecuperados = apiData['Global']['TotalRecovered'];
      pais = apiData['Global']['Country'];
      totalConfirmados = apiData['Global']['TotalConfirmed'];
      novosCasos = apiData['Global']['NewConfirmed'];
      novasMortes = apiData['Global']['NewDeaths'];
      totalMortes = apiData['Global']['TotalDeaths'];
      dataAtual = apiData['Date'];
    });
    return true;
  }

  @override
  void initState() {
    super.initState();
    updateUi2(widget.dataApi);
    myFirebaseAdBannerInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        appBar: AppBar(),
        icone: FontAwesomeIcons.virus,
        title: 'COVID-19 GLOBAL',
        backgroundColor: Colors.red[800],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            MyBox(
              title: languages.totalCases(context),
              totalPassado: totalConfirmados,
              icone: FontAwesomeIcons.headSideMask,
              color: Colors.yellow,
            ),
            MyBox(
              title: languages.totalDeaths(context),
              totalPassado: totalMortes,
              icone: FontAwesomeIcons.church,
              color: Colors.red,
            ),
            MyBox(
              title: languages.totalRecuperados(context),
              totalPassado: totalRecuperados,
              icone: FontAwesomeIcons.heart,
              color: Colors.green,
            ),
            BottomWidgetCountry(
              apiData: widget.dataApi,
              dataNow: dataAtual,
              newDeaths: novasMortes,
              newCases: novosCasos,
              totalConfirmed: totalConfirmados,
              totalDeaths: totalMortes,
              totalRecovered: totalRecuperados,
            ),
            SizedBox(
              width: double.infinity,
              height: 40.0,
              child: OutlineButton(
                child: rowOutlineButton(context),
                onPressed: () async {
                  var apiData = await apiModel.getCountryLive2();
                  updateUi2(apiData);
                },
                shape: kButtonOutlineShape,
              ),
            ),
            Text(
              languages.updateBottom(context) +
                  ': ' +
                  dataAtual.substring(0, 10),
              style: kTextStyle12,
            ),
          ],
        ),
      ),
    );
  }
}
