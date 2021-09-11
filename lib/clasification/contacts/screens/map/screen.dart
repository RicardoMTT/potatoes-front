import 'package:flutter/material.dart';
import 'package:potatoes_test/clasification/contacts/screens/map/map.dart';

class MapScren extends StatelessWidget {
  const MapScren({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacto por mapa'),
      ),
      body: SearchGaragesInMapScreenMap(
        latitudeMap: -12.0561525,
        longitudeMap: -77.0867083,
      ),
    );
  }
}
