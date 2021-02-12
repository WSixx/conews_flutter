import 'package:flutter/foundation.dart';

class GetJsonApi {
  final int selectedCountry;
  String country;
  int newCases;
  int totalConfirmed;
  int newDeaths;
  int totalDeaths;
  int totalRecovered;
  String dataNow;
  int i = 0;

  List<String> country1;
  List<int> newCases1;
  List<int> totalConfirmed1;
  List<int> newDeaths1;
  List<int> totalDeaths1;
  List<int> totalRecovered1;
  List<String> dataNow1;

  GetJsonApi(this.selectedCountry);

  bool updateUi2(dynamic apiData) {
    if (apiData == null) {
      return false;
    }
    totalRecovered =
        apiData['Countries'][selectedCountry]['TotalRecovered'] as int;
    country = apiData['Countries'][selectedCountry]['Country'] as String;
    totalConfirmed =
        apiData['Countries'][selectedCountry]['TotalConfirmed'] as int;
    newCases = apiData['Countries'][selectedCountry]['NewConfirmed'] as int;
    newDeaths = apiData['Countries'][selectedCountry]['NewDeaths'] as int;
    totalDeaths = apiData['Countries'][selectedCountry]['TotalDeaths'] as int;
    dataNow = apiData['Date'] as String;
    return true;
  }

  Future takeCountries(dynamic apiData) async {
    totalRecovered1
        .add(apiData['Countries'][selectedCountry]['TotalRecovered'] as int);
    country1.add(apiData['Countries'][selectedCountry]['Country'] as String);
    totalConfirmed1
        .add(apiData['Countries'][selectedCountry]['TotalConfirmed'] as int);
    newCases1.add(apiData['Countries'][selectedCountry]['NewConfirmed'] as int);
    newDeaths1.add(apiData['Countries'][selectedCountry]['NewDeaths'] as int);
    totalDeaths1
        .add(apiData['Countries'][selectedCountry]['TotalDeaths'] as int);
    dataNow1.add(apiData['Date'] as String);
    debugPrint('Fez o for $i');
    debugPrint('Pais: ${country1[i]}');
    debugPrint('Terminou o for');
    return true;
  }
}
