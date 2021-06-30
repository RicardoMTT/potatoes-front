import 'package:flutter/material.dart';
import 'package:potatoes_test/app_constants/color.dart';

class Prueba extends StatelessWidget {
  const Prueba({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.red,
          child: Stack(children: [
            Container(
              color: Colors.red,
              margin: EdgeInsets.all(5),
              height: 220,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 4), blurRadius: 4, color: Colors.red)
                  ]),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tarjeta'),
                        IconButton(icon: Icon(Icons.menu), onPressed: () {})
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.red,
                    margin: EdgeInsets.only(left: 30, top: 30),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Welcome')),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30, top: 30),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        children: [
                          Text('Ricardo'),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: 140,
              left: 20,
              child: Container(
                  height: 200,
                  color: Colors.red,
                  child: Image(
                    image: NetworkImage(
                        'https://i.pinimg.com/736x/6e/c4/c2/6ec4c2a66cf55deb60ef6bd5efc21ef4.jpg%27'),
                    fit: BoxFit.fill,
                    width: 110,
                  )),
            )
          ]),
        ),
      ),
    );
  }
}
