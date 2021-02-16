import 'package:flutter/material.dart';

class Sword5d extends StatelessWidget {

  final size;

  Sword5d({this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: 100,
      child: Image.asset(
          'lib/images/sword 5d.png'
      ),
    );
  }
}
