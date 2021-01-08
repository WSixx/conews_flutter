import 'package:conews_flutter/services/networking.dart';

const countryLiveUrl =
    'https://api.covid19api.com/live/country/brazil/status/confirmed/date/2020-03-28T15:06:52Z';
const countryLiveUrl2 = 'https://api.covid19api.com/summary';

class ApiModel {
  Future<dynamic> getCountryLive() async {
    var url = '$countryLiveUrl';
    NetworkHelper networkHelper = NetworkHelper(url);
    var apiData = await networkHelper.getData();
    return apiData;
  }

  Future<dynamic> getCountryLive2() async {
    NetworkHelper networkHelper = NetworkHelper('$countryLiveUrl2');
    var apiData = await networkHelper.getData();
    return apiData;
  }
}
