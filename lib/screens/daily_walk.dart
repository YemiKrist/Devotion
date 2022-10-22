import 'package:cacsa/commons/appbar.dart';
import 'package:cacsa/models/daily_walk.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:cacsa/utils/widget_functions.dart';
import 'package:selectable/selectable.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class Daily extends StatelessWidget {
  final Walk walk;

  Daily(this.walk);
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
        backgroundColor: splashBackgroundColor,
        body: SafeArea(
          child: Container(
            // padding: const EdgeInsets.all(24.0),
            margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MyAppBar(),
                addVerticalSpace(25),
                Text(
                  walk.topic,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    fontFamily: 'Euclid-SemiBold',
                  ),
                ),
                addVerticalSpace(6),
                Text(
                  walk.date,
                  style: themeData.textTheme.subtitle1,
                ),
                addVerticalSpace(21),
                Expanded(
                  child: SingleChildScrollView(
                    child: Selectable(
                      popupMenuItems: [
                        SelectableMenuItem(
                            type: SelectableMenuItemType.webSearch),
                        SelectableMenuItem(type: SelectableMenuItemType.copy),
                        SelectableMenuItem(
                          title: 'Share',
                          isEnabled: (controller) => controller!.isTextSelected,
                          handler: (controller) {
                            Share.share(controller!.getSelection()!.text!);
                            // showDialog<void>(
                            //   context: context,
                            //   barrierDismissible: true,
                            //   builder: (builder) {
                            //     return AlertDialog(
                            //       contentPadding: EdgeInsets.zero,
                            //       content: Container(
                            //         padding: const EdgeInsets.all(16),
                            //         child:
                            //             Text(controller!.getSelection()!.text!),
                            //       ),
                            //       shape: RoundedRectangleBorder(
                            //           borderRadius: BorderRadius.circular(8)),
                            //     );
                            //   },
                            // );
                            return true;
                          },
                        ),
                      ],
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Column(
                          children: [
                            //  Section(title:'READ', content: walk.devotion.read),
                            walk.devotion.read.isNotEmpty
                                ? Section(
                                    title: 'READ', content: walk.devotion.read)
                                : addVerticalSpace(0),
                            walk.devotion.memoryVerse.isNotEmpty
                                ? Section(
                                    title: 'MEMORY VERSE',
                                    content: walk.devotion.memoryVerse)
                                : addVerticalSpace(0),
                            walk.devotion.introduction.isNotEmpty
                                ? Section(
                                    title: 'INTRODUCTION',
                                    content: walk.devotion.introduction)
                                : addVerticalSpace(0),
                            addVerticalSpace(10),
                            walk.devotion.content.isNotEmpty
                                ? Section(
                                    title: 'CONTENT',
                                    content: walk.devotion.content)
                                : addVerticalSpace(0),
                            addVerticalSpace(10),
                            walk.devotion.climax.isNotEmpty
                                ? Section(
                                    title: 'CLIMAX',
                                    content: walk.devotion.climax)
                                : addVerticalSpace(0),
                            addVerticalSpace(10),
                            walk.devotion.reflection.isNotEmpty
                                ? Section(
                                    title: 'REFLECTION: /APPLICATION',
                                    content: walk.devotion.reflection)
                                : addVerticalSpace(0),
                            addVerticalSpace(10),
                            walk.devotion.foodForThought != null
                                ? Section(
                                    title: 'FOOD FOR THOUGHT',
                                    content:
                                        walk.devotion.foodForThought.toString())
                                : addVerticalSpace(0),
                            walk.devotion.conclusion.isNotEmpty
                                ? Section(
                                    title: 'CONCLUSION',
                                    content: walk.devotion.conclusion)
                                : addVerticalSpace(0),
                            addVerticalSpace(10),
                            walk.devotion.prayerPoint.isNotEmpty
                                ? SectionPrayer(
                                    title: 'PRAYER POINT',
                                    prayerPoints: walk.devotion.prayerPoint)
                                : addVerticalSpace(0),
                            addVerticalSpace(10),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class Section extends StatelessWidget {
  final String title;
  final String content;

  const Section({Key? key, required this.title, required this.content})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Align(
      alignment: Alignment.topLeft,
      child: RichText(
        text: TextSpan(children: [
          TextSpan(text: '$title: ', style: themeData.textTheme.headline4),
          TextSpan(text: content, style: themeData.textTheme.bodyText1)
        ]),
        textAlign: TextAlign.left,
      ),
    );
  }
}

class SectionPrayer extends StatelessWidget {
  final String title;
  final List<String> prayerPoints;

  const SectionPrayer(
      {Key? key, required this.title, required this.prayerPoints})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return RichText(
        text: TextSpan(children: [
      TextSpan(text: '$title: ', style: themeData.textTheme.headline4),
      for (String prayer in prayerPoints) ...{
        TextSpan(text: '\n$prayer', style: themeData.textTheme.bodyText1),
      }
    ]));
  }
}
