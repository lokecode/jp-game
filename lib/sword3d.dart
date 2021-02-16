import 'package:flutter/material.dart';

class Sword3d extends StatelessWidget {

  final size;

  Sword3d({this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: 100,
      child: Image.asset(
          'lib/images/sword3d.png'
      ),
    );
  }
}
