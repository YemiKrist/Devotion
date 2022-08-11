import 'package:flutter/material.dart';

import '../utils/colors.dart';

class MyTitle extends StatelessWidget {
  const MyTitle({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
            color: textColorWhite,
            fontWeight: FontWeight.w700,
            fontSize: 40,
            fontFamily: 'Euclid-Medium'),
      ),
    );
  }
}
