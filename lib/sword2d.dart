import 'package:flutter/material.dart';

class Sword2d extends StatelessWidget {

  final size;

  Sword2d({this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: 100,
      child: Image.asset(
          'lib/images/sword 2d.png'
      ),
    );
  }
}
