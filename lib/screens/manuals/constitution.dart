import 'package:cacsa/commons/appbar.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../commons/navigation_bar.dart';

class Constitution extends StatelessWidget {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  Constitution({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const MyNavBar(),
        backgroundColor: splashBackgroundColor,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: const MyAppBar()),
              Expanded(
                child: SfPdfViewer.asset(
                  'assets/constitution.pdf',
                  key: _pdfViewerKey,
                ),
              ),
            ],
          ),
        ));
  }
}
