import 'package:cacsa/commons/appbar.dart';
import 'package:cacsa/models/daily_walk.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:cacsa/utils/widget_functions.dart';
import 'package:flutter/material.dart';

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
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MyAppBar(),
                Text(walk.topic,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    ),
                ),
                addVerticalSpace(6),
                Text(walk.date,
                  style: themeData.textTheme.subtitle1,
                ),
                addVerticalSpace(21),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Column(
                        children: [
                        //  Section(title:'READ', content: walk.devotion.read),
                        Section(title:'READ', content: walk.devotion.read),
                        Section(title: 'MEMORY VERSE', content: walk.devotion.memoryVerse),
                        Section(title: 'INTRODUCTION', content: walk.devotion.introduction),
                        addVerticalSpace(10),
                        Section(title: 'CONTENT', content: walk.devotion.content),
                        addVerticalSpace(10),
                        Section(title: 'CLIMAX', content: walk.devotion.conclusion),
                        addVerticalSpace(10),
                        Section(title: 'REFLECTION: /APPLICATION', content: walk.devotion.reflection),
                        addVerticalSpace(10),
                        Section(title: 'CONCLUSION', content: walk.devotion.conclusion),
                        addVerticalSpace(10),
                        Section(title: 'PRAYER POINT', content: walk.devotion.prayerPoint),
                        addVerticalSpace(10),
                        ],
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

  const Section( {Key? key, required this.title, required this.content}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return RichText( text: TextSpan(children: [
                          TextSpan(
                            text: '$title: ',
                            style: themeData.textTheme.headline4
                          ),
                          TextSpan(
                             text: content,
                             style: themeData.textTheme.bodyText1
                          )
                        ]));
  }
}
