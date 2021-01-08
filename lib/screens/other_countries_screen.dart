import 'package:conews_flutter/helper/ad_helper.dart';
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

class OtherCountries extends StatefulWidget {
  final apiData;
  const OtherCountries({Key key, this.apiData}) : super(key: key);

  @override
  _OtherCountriesState createState() => _OtherCountriesState();
}

class _OtherCountriesState extends State<OtherCountries> {
  ApiModel apiModel = ApiModel();
  int countryNumber = 0;
  GetJsonApi getJsonApi = GetJsonApi(0);
  LanguagesHelper languages = LanguagesHelper();

  @override
  void initState() {
    super.initState();
    getJsonApi.updateUi2(widget.apiData);
    myFirebaseAdInterInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        appBar: AppBar(),
        icone: FontAwesomeIcons.virus,
        title: 'COVID-19',
        backgroundColor: Colors.red[800],
      ),
      body: ListView.builder(
          itemCount: 185,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: ExpansionTile(
                leading: Icon(
                  FontAwesomeIcons.globe,
                  color: Colors.blue[800],
                ),
                subtitle: Text(
                  languages.clickOpen(context),
                  style: TextStyle(fontSize: 8.0),
                ),
                title: Text(takePais(index).country),
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        takePais(index).country,
                        style: kNameCountryTextStyle12,
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      MyBox(
                        title: languages.totalCases(context),
                        totalPassado: takePais(index).totalConfirmed,
                        icone: FontAwesomeIcons.headSideMask,
                        color: Colors.yellow,
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      MyBox(
                        title: languages.totalDeaths(context),
                        totalPassado: takePais(index).totalDeaths,
                        icone: FontAwesomeIcons.church,
                        color: Colors.red,
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      MyBox(
                        title: languages.totalRecuperados(context),
                        totalPassado: takePais(index).totalRecovered,
                        icone: FontAwesomeIcons.heart,
                        color: Colors.green,
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      BottomWidgetCountry(
                        apiData: widget.apiData,
                        dataNow: takePais(index).dataNow,
                        newDeaths: takePais(index).newDeaths,
                        newCases: takePais(index).newCases,
                        totalConfirmed: takePais(index).totalConfirmed,
                        totalDeaths: takePais(index).totalDeaths,
                        totalRecovered: takePais(index).totalRecovered,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50.0,
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
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }

  GetJsonApi takePais(int country) {
    GetJsonApi getJsonApi = GetJsonApi(country);
    getJsonApi.updateUi2(widget.apiData);
    return getJsonApi;
  }
}
