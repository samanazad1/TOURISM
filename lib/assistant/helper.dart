import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:url_launcher/url_launcher.dart';

class HelperFunctions {
  static String getImage(String image) {
    return "assets/images/$image";
  }
}

telToPhone(BuildContext context, String number, [String number2 = ""]) async {
  UrlLauncher.launchUrl(
      Uri.parse(
        "tel://$number",
      ),
      mode: UrlLauncher.LaunchMode.externalApplication);
}

Future<void> launchTo(String url) async {
  try {
    final Uri uri = Uri.parse(url);
    if (await canLaunch(uri.toString())) {
      await launch(uri.toString());
    } else {
      throw 'Could not launch $url';
    }
  } catch (e) {
    print('Error launching URL: $e');
  }
}
