import 'package:flutter/material.dart';
import 'package:potatoes_test/app_widgets/common_card.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contacts = List.generate(100, (index) => index);
    return Scaffold(
        appBar: AppBar(
          title: Text('contactos'),
        ),
        body: Container(
          color: Colors.transparent,
          child: ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              return CommonCard();
            },
          ),
        ));
  }
}
