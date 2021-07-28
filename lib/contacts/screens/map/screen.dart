import 'package:flutter/material.dart';
import 'package:potatoes_test/contacts/screens/map/map.dart';

class MapScren extends StatelessWidget {
  const MapScren({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacto por mapa'),
      ),
      body: SearchGaragesInMapScreenMap(
        latitudeMap: 37.43296265331129,
        longitudeMap: -122.08832357078792,
      ),
    );
  }
}
