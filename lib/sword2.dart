import 'package:flutter/material.dart';

class Sword2 extends StatelessWidget {

  final size;

  Sword2({this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: 100,
      child: Image.asset(
          'lib/images/sword 2.png'
      ),
    );
  }
}
