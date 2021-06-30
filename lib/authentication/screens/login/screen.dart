import 'package:flutter/material.dart';
import 'package:potatoes_test/authentication/screens/login/form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Stack(
        children: [
          _buildColorBackground(),
          //_buildImageBackground(_height * 0.5),
          SafeArea(
              child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const LoginScreenForm(),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }

  Widget _buildColorBackground() {
    return Positioned(
      left: 0,
      top: 0,
      bottom: 0,
      right: 0,
      child: Container(color: Colors.transparent),
    );
  }

  Widget _buildImageBackground(double height) {
    return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        top: 0,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xff7c94b6),
            image: new DecorationImage(
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.grey.withOpacity(0.1), BlendMode.srcOver),
                image: AssetImage('assets/images/login/descarga.jpg')
                // image: Image.asset(
                //   'http://www.server.com/image.jpg',
                // ),
                ),
          ),
        ));
  }
}
