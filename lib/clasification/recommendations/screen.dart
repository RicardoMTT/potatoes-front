import 'package:flutter/material.dart';

class RecomendationScreen extends StatelessWidget {
  const RecomendationScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recomendaciones'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              child: Image.asset(
                'assets/images/clasification/recomendations.png',
                width: 200,
                height: 300,
              ),
            ),
            Text(
              'Recomendaciones',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
                '1. Evitar el riego por aspersión, utilizar el riego por goteo'),
            SizedBox(
              height: 15,
            ),
            Text(
                '2. Después de la cosecha, eliminar o quemar todos los residuos de plantas infectadas,porque en ellos se conserva el inóculo.'),
            SizedBox(
              height: 15,
            ),
            Text('3. Usar como semilla tubérculos sanos.'),
            SizedBox(
              height: 15,
            ),
            Text(
                '4. Utilizar variedades de papa con resistencia cuantitativa u horizontal.'),
            SizedBox(
              height: 15,
            ),
            Text(
                '5.Eliminar todas las fuentes de infección, tales como tubérculos enfermos que se encuentran en los almacenes y plantas voluntarias en los campos..'),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
