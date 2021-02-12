import 'package:conews_flutter/services/networking.dart';

const countryLiveUrl =
    'https://api.covid19api.com/live/country/brazil/status/confirmed/date/2020-03-28T15:06:52Z';
const countryLiveUrl2 = 'https://api.covid19api.com/summary';

class ApiModel {
  Future getCountryLive() async {
    const url = countryLiveUrl;
    final NetworkHelper networkHelper = NetworkHelper(url);
    final apiData = await networkHelper.getData();
    return apiData;
  }

  Future getCountryLive2() async {
    final NetworkHelper networkHelper = NetworkHelper(countryLiveUrl2);
    final apiData = await networkHelper.getData();
    return apiData;
  }
}
