class GetJsonApi {
  final selectedCountry;
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
    totalRecovered = apiData['Countries'][selectedCountry]['TotalRecovered'];
    country = apiData['Countries'][selectedCountry]['Country'];
    totalConfirmed = apiData['Countries'][selectedCountry]['TotalConfirmed'];
    newCases = apiData['Countries'][selectedCountry]['NewConfirmed'];
    newDeaths = apiData['Countries'][selectedCountry]['NewDeaths'];
    totalDeaths = apiData['Countries'][selectedCountry]['TotalDeaths'];
    dataNow = apiData['Date'];
    return true;
  }

  Future takeCountries(dynamic apiData) async {
    print('Entrou no take');
    totalRecovered1
        .add(apiData['Countries'][selectedCountry]['TotalRecovered']);
    country1.add(apiData['Countries'][selectedCountry]['Country']);
    totalConfirmed1
        .add(apiData['Countries'][selectedCountry]['TotalConfirmed']);
    newCases1.add(apiData['Countries'][selectedCountry]['NewConfirmed']);
    newDeaths1.add(apiData['Countries'][selectedCountry]['NewDeaths']);
    totalDeaths1.add(apiData['Countries'][selectedCountry]['TotalDeaths']);
    dataNow1.add(apiData['Date']);
    print('Fez o for $i');
    print('Pais: ${country1[i]}');
    print('Terminou o for');
    return true;
  }
}
