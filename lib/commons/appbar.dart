import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      IconButton(
        iconSize: 70.0,
        icon: Image.asset('assets/back.png'),
        onPressed: () => Navigator.of(context).pop(),
      )
    ]);
  }
}

class MyWAppBar extends StatelessWidget {
  const MyWAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      IconButton(
        iconSize: 70.0,
        icon: Image.asset('assets/backWhite.png'),
        onPressed: () => Navigator.of(context).pop(),
      )
    ]);
  }
}
