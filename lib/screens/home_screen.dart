import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:conews_flutter/helper/ad_helper.dart';
import 'package:conews_flutter/screens/brasil_screen.dart';
import 'package:conews_flutter/screens/global_screen.dart';
import 'package:conews_flutter/screens/other_countries_screen.dart';
import 'package:conews_flutter/screens/sobre_screen.dart';
import 'package:conews_flutter/screens/usa_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  final locationData;
  const HomeScreen({this.locationData});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedPage = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    adDispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => _selectedPage = index);
        },
        children: <Widget>[
          Global(
            dataApi: widget.locationData,
          ),
          OtherCountries(
            apiData: widget.locationData,
          ),
          Brazil(
            apiData: widget.locationData,
          ),
          Usa(
            apiData: widget.locationData,
          ),
          Scaffold(
            body: About(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _selectedPage,
        itemCornerRadius: 8,
        curve: Curves.easeInBack,
        onItemSelected: (int index) => setState(() {
          _selectedPage = index;
          _pageController.jumpToPage(index);
        }),
        items: [
          BottomNavyBarItem(
            icon: const Icon(FontAwesomeIcons.globe),
            title: const Text('Global'),
            activeColor: Colors.red,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(FontAwesomeIcons.globeAmericas),
            title: const Text('Others'),
            activeColor: Colors.yellow[800],
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(FontAwesomeIcons.globeAmericas),
            title: const Text('Brazil'),
            activeColor: Colors.green,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(FontAwesomeIcons.globeAmericas),
            title: const Text('USA'),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(FontAwesomeIcons.addressBook),
            title: const Text(
              'About',
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
