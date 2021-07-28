import 'dart:io';

import 'package:flutter/material.dart';
import 'package:potatoes_test/app_widgets/common_avatar.dart';

class CardImagePlant extends StatelessWidget {
  final Function press;
  final File image;
  final String avatarUrl;
  const CardImagePlant({Key key, this.press, this.image, this.avatarUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 200,
          height: 200,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12.withOpacity(0.08),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: Avatar(
            newImageFile: image,
          ),
        ),
        Positioned(
            bottom: -2,
            left: 170,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: InkWell(
                onTap: press,
                child: Icon(
                  Icons.cancel,
                  size: 30,
                ),
              ),
            ))
      ],
    );
  }
}
