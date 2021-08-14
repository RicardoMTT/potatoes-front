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
        color: Colors.black,
        width: double.infinity,
        child: Image.asset(
          'assets/images/clasification/recomendations.png',
          width: 200,
          height: 300,
        ),
      ),
    );
  }
}
