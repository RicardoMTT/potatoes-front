import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:potatoes_test/clasification/contacts/screens/map/screen.dart';
import 'package:url_launcher/url_launcher.dart';

class CommonCard extends StatelessWidget {
  final name;
  final lastName;
  final longitude;
  final latitude;
  const CommonCard(
      {Key key, this.name, this.lastName, this.longitude, this.latitude})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ]),
      child: Container(
        margin: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left: 6),
                    child: Text("$name  $lastName",
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.headline5.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 17)),
                  ),
                  Row(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.network(
                            'https://image.freepik.com/free-vector/man-profile-cartoon_18591-58484.jpg',
                            height: 60,
                            width: 60,
                            fit: BoxFit.cover,
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Profesional fitologo',
                          style: Theme.of(context).textTheme.headline5.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 14))
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    elevation: 0,
                    color: Colors.white,
                    onPressed: () {
                      Get.bottomSheet(BottomSheetEmergency());
                    },
                    child: Icon(
                      Icons.insert_drive_file,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BottomSheetEmergency extends StatefulWidget {
  @override
  _BottomSheetEmergencyState createState() => _BottomSheetEmergencyState();
}

class _BottomSheetEmergencyState extends State<BottomSheetEmergency> {
  final longitud = 0;
  final latitud = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      color: Colors.white,
      // transform: Matrix4.identity()
      //   ..rotateX(10)
      //   ..rotateY(20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 90,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                      'https://image.freepik.com/free-vector/man-profile-cartoon_18591-58484.jpg'),
                  Text('Empresa Antunez')
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RaisedButton(
                    elevation: 1,
                    color: Colors.white,
                    onPressed: () async {
                      bool res = await FlutterPhoneDirectCaller.callNumber(
                          "967728000");
                      print("RES $res");
                    },
                    child: Icon(
                      Icons.call,
                      color: Colors.blue,
                    ),
                  ),
                  RaisedButton(
                    elevation: 1,
                    color: Colors.white,
                    onPressed: () {
                      Get.to(MapScren());
                    },
                    child: Icon(
                      Icons.my_location_rounded,
                      color: Colors.blue,
                    ),
                  ),
                  RaisedButton(
                    elevation: 1,
                    color: Colors.white,
                    onPressed: () {
                      launchWhatsApp("+51967728000", "HI");
                    },
                    child: Icon(
                      Icons.messenger,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void launchWhatsApp(number, message) async {
    String url = "https://wa.me/$number?text=Hello";
    await canLaunch(url) ? launch(url) : print('ERRRor');
  }
}
