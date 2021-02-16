import 'package:flutter/material.dart';

class JPbotton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 60,
      child: Image.asset(
          'lib/images/redjp.png'
      ),
      color: Colors.grey[800],
    );
  }
}