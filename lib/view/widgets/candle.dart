import 'package:flutter/material.dart';

class Candle extends StatelessWidget {
  final Color? color;
  final double height, width;
  final List<BoxShadow> shadow = [
    BoxShadow(
      color: Colors.black26,
      offset: Offset.fromDirection(80.0, 1.0),
      blurRadius: 4,
      spreadRadius: 4,
    )
  ];
  Candle({
    Key? key,
    this.color,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      clipBehavior: Clip.none,
      children: [
        //canle body
        Container(
          height: height * 1.1,
          width: width * 0.1,
          decoration: BoxDecoration(
            color: color,
            boxShadow: shadow,
          ),
        ),
        // candle tail
        Container(
          height: height * 1.25,
          width: width * 0.005,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: color,
          ),
        ),
      ],
    );
  }
}
