import 'package:conews_flutter/services/api_data.dart';
import 'package:conews_flutter/utilities/constants.dart';
import 'package:conews_flutter/utilities/get_json_api.dart';
import 'package:conews_flutter/utilities/language_helper.dart';
import 'package:conews_flutter/widgets/app_bar.dart';
import 'package:conews_flutter/widgets/bottom_widget.dart';
import 'package:conews_flutter/widgets/my_box.dart';
import 'package:conews_flutter/widgets/row_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Brazil extends StatefulWidget {
  final apiData;
  const Brazil({this.apiData});

  @override
  _BrazilState createState() => _BrazilState();
}

class _BrazilState extends State<Brazil> {
  ApiModel apiModel = ApiModel();
  GetJsonApi getJsonApi = GetJsonApi(23);
  LanguagesHelper languages = LanguagesHelper();

  @override
  void initState() {
    super.initState();
    getJsonApi.updateUi2(widget.apiData);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
      appBar: MyAppBar(
        appBar: AppBar(),
        icone: FontAwesomeIcons.virus,
        title: languages.titlePage(context),
        backgroundColor: Colors.red[800],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
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
              child: OutlinedButton(
                onPressed: () async {
                  final apiData = await apiModel.getCountryLive2();
                  getJsonApi.updateUi2(apiData);
                },
                style: OutlinedButton.styleFrom(
                  shape: kButtonOutlineShape,
                ),
                child: rowOutlineButton(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
