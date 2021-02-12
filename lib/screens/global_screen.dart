import 'package:conews_flutter/helper/ad_helper.dart';
import 'package:conews_flutter/services/api_data.dart';
import 'package:conews_flutter/utilities/constants.dart';
import 'package:conews_flutter/utilities/language_helper.dart';
import 'package:conews_flutter/widgets/app_bar.dart';
import 'package:conews_flutter/widgets/bottom_widget.dart';
import 'package:conews_flutter/widgets/my_box.dart';
import 'package:conews_flutter/widgets/row_outlined_button.dart';
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
        return;
      }
      totalRecuperados = apiData['Global']['TotalRecovered'] as int;
      pais = apiData['Global']['Country'] as String;
      totalConfirmados = apiData['Global']['TotalConfirmed'] as int;
      novosCasos = apiData['Global']['NewConfirmed'] as int;
      novasMortes = apiData['Global']['NewDeaths'] as int;
      totalMortes = apiData['Global']['TotalDeaths'] as int;
      dataAtual = apiData['Date'] as String;
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
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
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
              child: OutlinedButton(
                onPressed: () async {
                  final apiData = await apiModel.getCountryLive2();
                  updateUi2(apiData);
                },
                style: OutlinedButton.styleFrom(shape: kButtonOutlineShape),
                child: rowOutlineButton(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
