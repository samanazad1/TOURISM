import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tourism/assistant/util/colors.dart';
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


showMyToast({
  required String message,
  bool errorType = false,
  bool fromTop = false,
  bool shortToast = false,
  bool isGreen = false,
}) {
  Fluttertoast.cancel();
  Fluttertoast.showToast(
    msg: message,
    toastLength: shortToast ? Toast.LENGTH_SHORT : Toast.LENGTH_LONG,
    gravity: fromTop ? ToastGravity.TOP : ToastGravity.BOTTOM,
    timeInSecForIosWeb: shortToast ? 1 : 5,
    backgroundColor: errorType
        ? Colors.red
        : isGreen
            ? Colors.green
            : primaryColor,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

areYouSure(context,
    {required Function function,
    required String title,
    bool? isOrder = false,
    bool haveButtonCancel = true,
    Widget? content,
    bool mandatory = false}) async {
  if (true) {
    showDialog(
        context: context,
        barrierDismissible: !mandatory,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            title: Text(title),
            content: content,
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'cancel',
                  // AppLocalizations.of(context)!.cancel,
                  style: TextStyle(
                    color: primaryColor,
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    if (isOrder == false) {
                      Navigator.pop(context);
                      function();
                    } else {
                      Navigator.pop(context);
                      function();
                    }
                  },
                  child: const Text(
                    'yes',
                    // AppLocalizations.of(context)!.yes,
                    style: TextStyle(
                      color: primaryColor,
                    ),
                  )),
            ],
          );
        });
  }
}