import 'package:flutter/material.dart';
import 'package:qbkj_mob/qbkj.dart';
import 'package:qbkj_mob_example/pages/feed_page.dart';

import 'pages/banner_page.dart';
import 'pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final isInited = false;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    print(await QBKJAd.initAd('1330509223779385377'));
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: App(),
    );
  }
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  List<Widget> events = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: ListView(
        children: [
          ...events,
          MaterialButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: const Text('横幅广告'),
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BannerPage(),
                ),
              );
            },
          ),
          MaterialButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: const Text('开屏广告'),
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SplashPage(),
                ),
              );
            },
          ),
          MaterialButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: const Text('信息流广告'),
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FeedPage(),
                ),
              );
            },
          ),
          MaterialButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: const Text('插屏广告'),
            onPressed: () {
              setState(() {
                events = [];
              });
              QBKJAd.insertAd(
                '1330513058157576258',
                callback: QBKJCallback(
                  onShow: () {
                    setState(() {
                      events.add(Text('插屏广告 onShow'));
                    });
                  },
                  onClick: () {
                    setState(() {
                      events.add(Text('插屏广告 onClick'));
                    });
                  },
                  onClose: () {
                    setState(() {
                      events.add(Text('插屏广告 onClose'));
                    });
                  },
                  onFail: () {
                    setState(() {
                      events.add(Text('插屏广告 onFail'));
                    });
                  },
                ),
              );
            },
          ),
          MaterialButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: const Text('激励广告'),
            onPressed: () {
              setState(() {
                events = [];
              });
              QBKJAd.rewardAd(
                '1330515047692124225',
                userId: 'userId',
                callback: QBKJCallback(
                  onShow: () {
                    setState(() {
                      events.add(Text('激励广告 onShow'));
                    });
                  },
                  onClick: () {
                    setState(() {
                      events.add(Text('激励广告 onClick'));
                    });
                  },
                  onClose: () {
                    setState(() {
                      events.add(Text('激励广告 onClose'));
                    });
                  },
                  onFail: () {
                    setState(() {
                      events.add(Text('激励广告 onFail'));
                    });
                  },
                  onSkip: () {
                    setState(() {
                      events.add(Text('激励广告 onSkip'));
                    });
                  },
                  onReward: () {
                    setState(() {
                      events.add(Text('激励广告 onReward'));
                    });
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
