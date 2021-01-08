import 'package:conews_flutter/services/api_data.dart';
import 'package:conews_flutter/utilities/constants.dart';
import 'package:conews_flutter/utilities/getJsonApi.dart';
import 'package:conews_flutter/utilities/language_helper.dart';
import 'package:conews_flutter/widgets/app_bar.dart';
import 'package:conews_flutter/widgets/bottom_widget.dart';
import 'package:conews_flutter/widgets/myBox.dart';
import 'package:conews_flutter/widgets/rowOutlineButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Usa extends StatefulWidget {
  final apiData;
  const Usa({Key key, this.apiData}) : super(key: key);

  @override
  _UsaState createState() => _UsaState();
}

class _UsaState extends State<Usa> {
  ApiModel apiModel = ApiModel();
  GetJsonApi getJsonApi = GetJsonApi(182);
  LanguagesHelper languages = LanguagesHelper();

  /*String pais = '';
  int novosCasos;
  int totalConfirmados = 0;
  int novasMortes = 0;
  int totalMortes = 0;
  int totalRecuperados = 0;
  String dataAtual;

  void updateUi2(dynamic apiData) {
    setState(() {
      if (apiData == null) {
        print('Entrou no null');
        return;
      }
      totalRecuperados = apiData['Countries'][177]['TotalRecovered'];
      pais = apiData['Countries'][177]['Country'];
      totalConfirmados = apiData['Countries'][177]['TotalConfirmed'];
      novosCasos = apiData['Countries'][177]['NewConfirmed'];
      novasMortes = apiData['Countries'][177]['NewDeaths'];
      totalMortes = apiData['Countries'][177]['TotalDeaths'];
      dataAtual = apiData['Date'];
      print('UpdateUi2: ' + totalRecuperados.toString());
    });
  }*/

  @override
  void initState() {
    super.initState();
    //updateUi2(widget.dadosApi);
    getJsonApi.updateUi2(widget.apiData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        appBar: AppBar(),
        icone: FontAwesomeIcons.virus,
        title: 'COVID-19 USA',
        backgroundColor: Colors.red[800],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(getJsonApi.country),
            MyBox(
              title: languages.totalCases(context),
              totalPassado: getJsonApi.totalConfirmed,
              icone: FontAwesomeIcons.headSideMask,
              color: Colors.yellow,
            ),
            MyBox(
              title: languages.totalDeaths(context),
              totalPassado: getJsonApi.totalDeaths,
              icone: FontAwesomeIcons.church,
              color: Colors.red,
            ),
            MyBox(
              title: languages.totalRecuperados(context),
              totalPassado: getJsonApi.totalRecovered,
              icone: FontAwesomeIcons.heart,
              color: Colors.green,
            ),
            BottomWidgetCountry(
              apiData: widget.apiData,
              dataNow: getJsonApi.dataNow,
              newDeaths: getJsonApi.newDeaths,
              newCases: getJsonApi.newCases,
              totalConfirmed: getJsonApi.totalConfirmed,
              totalDeaths: getJsonApi.totalDeaths,
              totalRecovered: getJsonApi.totalRecovered,
            ),
            SizedBox(
              width: double.infinity,
              height: 40.0,
              child: OutlineButton(
                child: rowOutlineButton(context),
                onPressed: () async {
                  var apiData = await apiModel.getCountryLive2();
                  getJsonApi.updateUi2(apiData);
                },
                shape: kButtonOutlineShape,
              ),
            ),
            Text(
              languages.updateBottom(context) +
                  ': ' +
                  getJsonApi.dataNow.substring(0, 10),
              style: kTextStyle12,
            )
          ],
        ),
      ),
    );
  }
}
