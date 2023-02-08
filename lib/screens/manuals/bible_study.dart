import 'package:cacsa/commons/appbar.dart';
import 'package:cacsa/models/believers_treasure.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:cacsa/utils/widget_functions.dart';
import 'package:selectable/selectable.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../../commons/navigation_bar.dart';
import '../../commons/numbers.dart';

class BelieversTreasure extends StatelessWidget {
  final Study study;
  final bool isEnglish;

  const BelieversTreasure(this.study, this.isEnglish, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const MyNavBar(),
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
                  isEnglish ? "Study ${study.id}" : "Eko ${numbers[study.id]}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: textColorGreen,
                    fontFamily: 'Euclid-Regular',
                  ),
                ),
                addVerticalSpace(6),
                Text(
                  study.topic,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    fontFamily: 'Euclid-SemiBold',
                  ),
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
                          title: isEnglish ? 'Share' : 'Pin',
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
                            Section(
                                title:
                                    isEnglish ? "MEMORY VERSE" : "ESE AKOSORI",
                                content: study.memoryVerse),
                            addVerticalSpace(10),
                            Section(
                                title: isEnglish ? "INTRODUCTION" : "ORO AKOSO",
                                content: study.introduction),
                            addVerticalSpace(10),
                            SectionOutline(
                              title:
                                  isEnglish ? "STUDY OUTLINE" : "ITUPALE EKO",
                              outlines: study.studyOutline,
                            ),
                            addVerticalSpace(5),
                            OutlineSection(
                              outlines: study.studyOutline,
                            ),
                            addVerticalSpace(10),
                            Section(
                                title: isEnglish ? "CONCLUSION" : "IPAARI",
                                content: study.conclusion),
                            addVerticalSpace(10),
                            DiscussionSection(
                              discusions: study.discussion,
                              isEnglish: isEnglish,
                            )
                            // Section(
                            //     title: "DISCUSSION", content: study.discussion),
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
          TextSpan(text: '$title:\n', style: themeData.textTheme.headline4),
          TextSpan(text: content, style: themeData.textTheme.bodyText1)
        ]),
        textAlign: TextAlign.left,
      ),
    );
  }
}

class SectionOutline extends StatelessWidget {
  final String title;
  final List<Outline> outlines;

  const SectionOutline({Key? key, required this.title, required this.outlines})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    int index = 1;
    return Align(
      alignment: Alignment.topLeft,
      child: RichText(
          text: TextSpan(children: [
        TextSpan(text: '$title: ', style: themeData.textTheme.headline4),
        for (Outline outline in outlines) ...{
          TextSpan(
              text: '\n\n${index++}. ${outline.topic}',
              style: themeData.textTheme.bodyText1),
        }
      ])),
    );
  }
}

class OutlineSection extends StatelessWidget {
  final List<Outline> outlines;

  const OutlineSection({Key? key, required this.outlines}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    int index = 1;
    return Align(
      alignment: Alignment.topLeft,
      child: RichText(
          text: TextSpan(children: [
        for (Outline outline in outlines) ...{
          TextSpan(
              text: '\n\n${index++}. ${outline.topic}',
              style: themeData.textTheme.headline4),
          for (String titles in outline.body) ...{
            TextSpan(text: '\n$titles', style: themeData.textTheme.bodyText1),
          }
        }
      ])),
    );
  }
}

class DiscussionSection extends StatelessWidget {
  final List<Discussion> discusions;
  final bool isEnglish;

  const DiscussionSection(
      {Key? key, required this.discusions, required this.isEnglish})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    int index = 1;
    return Align(
      alignment: Alignment.topLeft,
      child: RichText(
          text: TextSpan(children: [
        for (Discussion discusion in discusions) ...{
          TextSpan(
              text: discusions.length == 1
                  ? isEnglish
                      ? 'DISCUSSION'
                      : "IJIRORO"
                  : isEnglish
                      ? 'DISCUSSION ${index++}.'
                      : 'IJIRORO ${index++}.',
              style: themeData.textTheme.headline4),
          TextSpan(
              text: '\n${discusion.body}\n',
              style: themeData.textTheme.bodyText1),
        }
      ])),
    );
  }
}
