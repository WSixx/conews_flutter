import 'package:conews_flutter/screens/home_screen.dart';
import 'package:conews_flutter/services/api_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Future<void> getCountryLive() async {
    final apiModel = ApiModel();
    final apiData = await apiModel.getCountryLive2();

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return HomeScreen(
        locationData: apiData,
      );
    }));
  }

  @override
  void initState() {
    super.initState();
    getCountryLive();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitPouringHourglass(
          color: Colors.blue,
          size: 100,
        ),
      ),
    );
  }
}
