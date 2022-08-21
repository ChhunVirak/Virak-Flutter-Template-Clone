import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/helper/notification_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//   Timer? _timer;
//

  final remoteConfi = FirebaseRemoteConfig.instance;
  final analytics = FirebaseAnalytics.instance;
  // Color color = Colors.yellow;

  // late final uriLinkStream = linkStream.transform<Uri?>(
  //   StreamTransformer<String?, Uri?>.fromHandlers(
  //     handleData: (String? link, EventSink<Uri?> sink) {
  //       if (link == null) {
  //         sink.add(null);
  //       } else {
  //         sink.add(Uri.parse(link));
  //       }
  //     },
  //   ),
  // );
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  getValueFromRemote() async {
    // debugPrint("is color: ${remoteConfi.getBool('is_color')}");
    if (remoteConfi.getBool('is_color')) {
      setState(() {
        // color = Colors.green;
      });
    }
  }

  String deviceId = '';

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // context.router.pushNamed('/profile');
    });

    FirebaseMessaging.instance.getToken().then((value) {
      deviceId = value ?? '';
      setState(() {});
      debugPrint("Device ID: ======= $value");
    });
    // Timer(const Duration(seconds: 1), () {
    //   FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
    //     debugPrint('Dynamic Link Data ${dynamicLinkData.link}');

    //     AutoRouter.of(context).pushNamed(dynamicLinkData.link.path);
    //   }).onError((error) {});
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Homepage"),
      ),
      body: IntrinsicWidth(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 5),
                child: Text(
                  'Available Dynamic Link For This App',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Clipboard.setData(const ClipboardData(
                      text: 'https://viraktemplate.page.link'));
                },
                child: const Card(
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text('https://viraktemplate.page.link')),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Text(
                  'Available DeepLinks For This App',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Clipboard.setData(
                      const ClipboardData(text: 'https://chhunvirak.app'));
                },
                child: const Card(
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text('https://chhunvirak.app')),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Clipboard.setData(const ClipboardData(
                      text: 'https://app.chhunvirak.z1fsc'));
                },
                child: const Card(
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text('https://app.chhunvirak.z1fsc')),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Clipboard.setData(const ClipboardData(
                      text: 'https://flutter.chhunvirak.z1fsc'));
                },
                child: const Card(
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text('https://flutter.chhunvirak.z1fsc')),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Text(
                  'Device Token',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: deviceId));
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(deviceId),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Text(
                  'Options Available Now',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                  onPressed: () {
                    // getAPI();
                    NotificationHelper.showNotification(
                        title: "Local Notification",
                        body: 'Here is sample local Notifiactions');
                  },
                  child: const Text('Sent Local Notification'),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                onPressed: () {
                  throw Exception(
                      'Here is sample exception message'.toUpperCase());
                },
                child: const Text("Throw Sample Exception"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                onPressed: () {
                  // launch('https://viraktemplate.page.link');

                  launchUrl(
                    Uri(
                        scheme: 'https',
                        host: 'chhunvirak.app',
                        path: 'profile',
                        queryParameters: {
                          'name': 'Chhoeung Chhun Virak',
                          'sex': 'Male'
                        }),
                    mode: LaunchMode.externalNonBrowserApplication,
                  ).then((value) {
                    debugPrint('Done');
                  });
                },
                child: const Text("Go to Profile With url_launcher"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                onPressed: () {
                  // launch('https://viraktemplate.page.link');

                  // var a = AutoRouter.innerRouterOf(context, 'jdjka');
                  // debugPrint('${a!.hasEntries}');
                  AutoRouter.of(context)
                      .pushNamed('/profile?name=Chhoeung Chhun Virak&sex=Male');
                  // context.pushRoute(
                  //     ProfileRoute(name: 'Chhoeung Chhun Virak', sex: 'Male'));
                  // );
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Go to Profile With AutoRouter"),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                onPressed: () {
                  launchUrl(
                      Uri(
                          scheme: 'https',
                          host: 'console.firebase.google.com',
                          path: '/u/1/project/virak-z1fsc/messaging'),
                      mode: LaunchMode.externalApplication);
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Open Firebase Messaging"),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                onPressed: () {
                  launchUrl(
                      Uri(
                          scheme: 'https',
                          host: 'console.firebase.google.com',
                          path: 'u/1/project/virak-z1fsc/crashlytics'),
                      mode: LaunchMode.externalApplication);
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Open Firebase Crashlytics"),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                onPressed: () {
                  launchUrl(
                      Uri(scheme: 'https', host: 't.me', path: 'Virakchhun'),
                      mode: LaunchMode.externalApplication);
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Open Telegram"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
