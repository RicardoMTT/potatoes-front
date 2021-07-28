import 'package:flutter/material.dart';
import 'package:get/get.dart';

const blue4 = Color(0xff0276F8);

class AppAlertDialog extends StatelessWidget {
  final Widget content;
  final String contentText;

  const AppAlertDialog({Key key, this.content, this.contentText})
      : super(key: key);

  static Future<void> show(
          {Widget content,
          String contentText,
          Key key,
          bool barrierDismissible = true}) =>
      Get.dialog(
          AppAlertDialog(
            key: key,
            content: content,
            contentText: contentText,
          ),
          barrierDismissible: barrierDismissible);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(20).copyWith(bottom: 0),
      content: content ??
          Text(
            contentText,
          ),
      actionsPadding: EdgeInsets.zero,
      actions: [
        FlatButton(
          onPressed: () {
            Get.close(1);
          },
          child: const Text('Entendido',
              style: TextStyle(fontWeight: FontWeight.bold, color: blue4)),
        )
      ],
    );
  }
}
