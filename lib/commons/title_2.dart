import 'package:flutter/material.dart';

import '../utils/colors.dart';

class MyTitle2 extends StatelessWidget {
  const MyTitle2({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return const Text(
      'About CACSA',
      style: TextStyle(
          color: textColorGreen,
          fontWeight: FontWeight.w500,
          fontSize: 20,
          fontFamily: 'Euclid-Medium'),
    );
  }
}
