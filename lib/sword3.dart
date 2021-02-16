import 'package:flutter/material.dart';

class Sword3 extends StatelessWidget {

  final size;

  Sword3({this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: size,
      child: Image.asset(
        'lib/images/sword3.png'
      ),
    );
  }
}
