import 'package:auto_route/auto_route.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

class FirebaseDynamicLinkHelper {
  static Future<void> initDynamicLinks(BuildContext context) async {
    dynamicLinks.onLink.listen((dynamicLinkData) {
      dynamicLinkData.link.path;
      // debugPrint('Dynamic Link Data ');

      AutoRouter.of(context).pushNamed('profile?name=dara&sex=other');
    }).onError((error) {});
  }

  static Future<Uri> createDynamicLink(
      {String? path,
      String? description,
      String? image,
      String? title,
      bool? short}) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://z1fsctemplate.page.link',
      link: Uri.parse('https://cicapp.page.link/$path'),
      androidParameters: const AndroidParameters(
        packageName: 'com.virak.z1fsc',
        minimumVersion: 0,
      ),
      iosParameters: const IOSParameters(
          bundleId: 'com.virak.z1fsc',
          minimumVersion: '0',
          appStoreId: '1638275403'),
      socialMetaTagParameters: SocialMetaTagParameters(
          description: description, imageUrl: Uri.parse(image!), title: title),
    );

    Uri url;
    if (short!) {
      final ShortDynamicLink shortLink =
          await dynamicLinks.buildShortLink(parameters);
      url = shortLink.shortUrl;
    } else {
      url = await dynamicLinks.buildLink(parameters);
    }
    return url;
  }
}
