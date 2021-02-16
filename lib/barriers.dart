import 'package:flutter/material.dart';

class MyBarrier extends StatelessWidget {

  final size;

  MyBarrier({this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: 100,
      child: Image.asset(
          'lib/images/sword 5.png'
      ),
    );
  }
}
