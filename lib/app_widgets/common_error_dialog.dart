import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:potatoes_test/app_widgets/common_asset_image.dart';

class CommonErrorDialog extends StatelessWidget {
  final String messageText;
  final String acceptText;
  const CommonErrorDialog({Key key, this.messageText, this.acceptText})
      : super(key: key);

  static Future<bool> show({String messageText, String acceptText}) {
    return Get.dialog(CommonErrorDialog(
      acceptText: acceptText,
      messageText: messageText,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Container(
          width: 326,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 39,
              ),
              const CommonAssetImage(
                asset: 'login/error.png',
                height: 60,
                width: 60,
                fit: BoxFit.contain,
              ),
              const SizedBox(
                height: 18,
              ),
              Text(
                messageText,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 54,
                decoration: const BoxDecoration(),
                child: FlatButton(
                  onPressed: () {
                    Get.back(result: true);
                  },
                  child: Text(acceptText,
                      style: const TextStyle(color: Colors.blue, fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
