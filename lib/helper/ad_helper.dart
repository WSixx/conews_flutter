import 'package:firebase_admob/firebase_admob.dart';

const String kMyBannerId = 'ca-app-pub-2131192143907097/2085369645';
const String kMyInterAd = 'ca-app-pub-2131192143907097/6216186345';
const String kAppId = 'ca-app-pub-2131192143907097~8678698154';

InterstitialAd interstitialAd;
BannerAd bannerAd;

InterstitialAd myInterstitial() {
  return InterstitialAd(
    adUnitId: InterstitialAd.testAdUnitId, //kMyInterAd,
    targetingInfo: kTargetingInfo,
    listener: (MobileAdEvent event) {
      if (event == MobileAdEvent.failedToLoad) {
        interstitialAd..load();
      } else if (event == MobileAdEvent.closed) {
        //interstitialAd = myInterstitial()..load();
      }
    },
  );
}

void myFirebaseAdInterInit() async {
  try {
    await abrirInter();
    interstitialAd
      ..load()
      ..show();
  } catch (e) {
    print(e.toString());
  }
}

BannerAd myBannerAd() {
  return BannerAd(
    adUnitId: BannerAd.testAdUnitId, //kMyBannerId,
    targetingInfo: kTargetingInfo,
    size: AdSize.smartBanner,
    listener: (MobileAdEvent event) {
      if (event == MobileAdEvent.failedToLoad) {
        bannerAd..load();
      } else if (event == MobileAdEvent.closed) {
        bannerAd = myBannerAd()..load();
      }
      print("InterstitialAd event is $event");
    },
  );
}

void myFirebaseAdBannerInit() async {
  try {
    await abrirBanner();
    bannerAd
      ..load()
      ..show(
        anchorType: AnchorType.bottom,
        anchorOffset: 48.0,
        horizontalCenterOffset: 0.0,
      );
  } catch (e) {}
}

Future<void> abrirBanner() async {
  bannerAd = myBannerAd()..load();
}

Future<void> abrirInter() async {
  await FirebaseAdMob.instance.initialize(appId: kAppId);
  interstitialAd = myInterstitial()..load();
}

MobileAdTargetingInfo kTargetingInfo = MobileAdTargetingInfo(
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

void adDispose() async {
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
