import 'package:fcm_config/fcm_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:testapp0225/calendar.dart';
import 'event_list.dart';
import 'twitter_profile.dart';
import 'pages/index.dart';
import 'stream_textbook/stream.dart';
import 'stream_macos/mac_os.dart';
import 'stream_water_breathing/water_breathing.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

Future<void> _fcmBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

void main() async {
  await FCMConfig.instance.init(
    defaultAndroidForegroundIcon: '@mipmap/ic_launcher',
    //default is @mipmap/ic_launcher
    defaultAndroidChannel: AndroidNotificationChannel(
      'high_importance_channel', // same as value from android setup
      'Fcm config',
      importance: Importance.high,
      sound: RawResourceAndroidNotificationSound('notification'),
    ),
  );

  await Firebase.initializeApp();

  final token = await FCMConfig.instance.messaging.getToken();
  print("aaa");
  print(token);

  // FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
  // Android only
  // FirebaseApp secondaryApp = Firebase.app('SecondaryApp');
  // FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instanceFor(app: secondaryApp);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // const AndroidNotificationChannel channel = AndroidNotificationChannel(
  //   'high_importance_channel', // id
  //   'High Importance Notifications', // title
  //   description: 'This channel is used for important notifications.',// / description
  //   importance: Importance.max,
  // );
  //
  // final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  // FlutterLocalNotificationsPlugin();
  //
  // await flutterLocalNotificationsPlugin
  //     .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
  //     ?.createNotificationChannel(channel);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _deepLink = "null";
  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    initDynamicLinks();
    print("aaaaaaaaaaaaaaaaaa");
  }

  Future<void> initDynamicLinks() async {
    print("bbbbbbbbbbbbbbbbbb");
    dynamicLinks.onLink.listen((dynamicLinkData) {
      print("cccccccccccccccccc");
      Navigator.pushNamed(context, dynamicLinkData.link.path);
      print("context:$context");
      print("ディープリンクURL:${dynamicLinkData.link}");
      setState(() {
        _deepLink = dynamicLinkData.link.toString();
      });
    }).onError((error) {
      print("ddddddddddddddddddd");
      print('onLink error');
      print(error.message);
    });
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  Future<void> dialog() {
    return showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text("通知"),
          content: Text("通知がきました"),
          actions: <Widget>[
            // ボタン領域
            TextButton(
              child: Text("Cancel"),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: Text("OK"),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }

  final items = List<String>.generate(10000, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Text("ああああ"),
            RaisedButton(
              child: Text('カレンダー'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Calendar()),
                );
              },
            ),
            RaisedButton(
              child: Text('イベントリスト'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EventList()),
                );
              },
            ),
            RaisedButton(
              child: Text('イベントリスト atomic design'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Index()),
                );
              },
            ),
            RaisedButton(
              child: Text('twitter風プロフィール画面'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TwitterProfile()),
                );
              },
            ),
            RaisedButton(
              child: Text('stream'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyStreamApp()),
                );
              },
            ),
            RaisedButton(
              child: Text('macOSコードネーム'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MacOSApp()),
                );
              },
            ),
            Text(
              'Dynamic Link',
            ),
            Text(
              _deepLink,
              style: Theme.of(context).textTheme.headline4,
            ),
            FCMNotificationListener(
              onNotification: (RemoteMessage notification, _) async {
                await dialog();
              },
              child: Text("a"),
            ),
            RaisedButton(
              child: Text('水の呼吸'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WaterBreathingApp()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

// void _initDynamicLinks() async {
// 2. FirebaseDynamicLinksのpackageで提供されているメソッド
// FirebaseDynamicLinks.instance.onLink(onSuccess: (PendingDynamicLinkData dynamicLink) async {
//   final Uri deepLink = dynamicLink?.link;
//
//   if (deepLink != null) {
//     // 3. アプリ立ち上げ中に即時実行するとnullが渡る可能性があるので2~3秒停止
//     await Future.delayed(Duration(seconds: 3));
//     setState(() {
//       _deepLink = deepLink.toString();
//     });
//   }
// }, onError: (OnLinkErrorException e) async {
//   print('onLinkError');
//   print(e.message);
// });
// print("initDynamicLinks");
// FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
//   Navigator.pushNamed(context, dynamicLinkData.link.path);
//   print("できた！");
//   print(context);
//   print("dynamicLinkData.link.path");
//   _deepLink = dynamicLinkData.link.path.toString();
// }).onError((error) {
//     print('onLinkError');
//     print(error);
// });

// }

}
