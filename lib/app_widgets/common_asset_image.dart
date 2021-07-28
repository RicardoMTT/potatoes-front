import 'package:flutter/material.dart';

class CommonAssetImage extends StatelessWidget {
  final String asset;
  final double width;
  final double height;
  final BoxFit fit;
  final Color color;
  const CommonAssetImage({
    Key key,
    this.asset,
    this.width,
    this.height,
    this.fit,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/$asset',
      width: width,
      height: height,
      fit: fit,
      color: color,
    );
  }
}
