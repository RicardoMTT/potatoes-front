import 'package:flutter/material.dart';
import 'package:potatoes_test/app_widgets/common_card.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contacts = [
      {
        'nombre': 'Ricardo',
        'apellido': 'Tovar',
        'longitud': '-12.0561525',
        'lalitud': '-77.0867083,17'
      },
      {
        'nombre': 'Jose luis',
        'apellido': 'Torres',
        'longitud': '-12.0600432',
        'lalitud': '-77.1024664'
      },
      {
        'nombre': 'Andres ',
        'apellido': 'Garcia',
        'longitud': '-12.0540648',
        'lalitud': '-77.1158789'
      }
    ];

    //List.generate(100, (index) => {'nombre': 'Ricardo', 'edad': 23});
    return Scaffold(
        appBar: AppBar(
          title: Text('contactos'),
        ),
        body: Container(
          color: Colors.transparent,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              return CommonCard(
                name: contacts[index]['nombre'],
                lastName: contacts[index]['apellido'],
                longitude: contacts[index]['longitud'],
                latitude: contacts[index]['latitud'],
              );
            },
          ),
        ));
  }
}
