import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_config/flutter_config.dart';

String kMyBannerId = '${FlutterConfig.get('AD_BANNER_ID')}';
String kMyInterAd = '${FlutterConfig.get('AD_INTER_ID')}';
String kAppId = '${FlutterConfig.get('AD_APP_ID')}';

InterstitialAd interstitialAd;
BannerAd bannerAd;

InterstitialAd myInterstitial() {
  return InterstitialAd(
    adUnitId: kMyInterAd,
    targetingInfo: kTargetingInfo,
    listener: (MobileAdEvent event) {
      if (event == MobileAdEvent.failedToLoad) {
        interstitialAd.load();
      } else if (event == MobileAdEvent.closed) {
        //interstitialAd = myInterstitial()..load();
      }
    },
  );
}

Future<void> myFirebaseAdInterInit() async {
  try {
    await abrirInter();
    interstitialAd
      ..load()
      ..show();
  } catch (e) {
    debugPrint(e.toString());
  }
}

BannerAd myBannerAd() {
  return BannerAd(
    adUnitId: kMyBannerId,
    targetingInfo: kTargetingInfo,
    size: AdSize.smartBanner,
    listener: (MobileAdEvent event) {
      if (event == MobileAdEvent.failedToLoad) {
        bannerAd.load();
      } else if (event == MobileAdEvent.closed) {
        bannerAd = myBannerAd()..load();
      }
      debugPrint("InterstitialAd event is $event");
    },
  );
}

Future<void> myFirebaseAdBannerInit() async {
  try {
    await abrirBanner();
    bannerAd
      ..load()
      ..show(
        anchorOffset: 48.0,
      );
  } catch (e) {
    debugPrint(e.toString());
  }
}

Future<void> abrirBanner() async {
  bannerAd = myBannerAd()..load();
}

Future<void> abrirInter() async {
  await FirebaseAdMob.instance.initialize(appId: kAppId);
  interstitialAd = myInterstitial()..load();
}

MobileAdTargetingInfo kTargetingInfo = const MobileAdTargetingInfo(
  keywords: [
    'Entertainment',
    'Saude',
    'Health',
    'Investment',
    'Money',
    'shopping',
    'Fun',
    'games',
    'Games',
  ],
  childDirected: false,
);

Future<void> adDispose() async {
  if (bannerAd != null) {
    bannerAd.dispose();
    bannerAd = null;
  }
  if (interstitialAd != null) {
    interstitialAd.dispose();
    //interstitialAd = null;
    //interstitialAd = null;
  }
}
