import 'package:flutter/material.dart';

import '../utils/colors.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton.icon(
            // <-- TextButton

            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back_rounded,
              size: 24.0,
              color: Colors.black,
            ),
            label: const Text(
              'Back',
              style: TextStyle(
                  color: textColorBlack,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  fontFamily: 'Euclid-Medium'),
            ),
          ),
        ]);
  }
}

class MyWAppBar extends StatelessWidget {
  const MyWAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton.icon(
            // <-- TextButton
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back_rounded,
              size: 24.0,
              color: Colors.white,
            ),
            label: const Text(
              'Back',
              style: TextStyle(
                  color: textColorWhite,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  fontFamily: 'Euclid-Medium'),
            ),
          ),
        ]);
  }
}
