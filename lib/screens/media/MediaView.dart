import 'package:cacsa/models/media.dart';
import 'package:cacsa/screens/media/media.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:cacsa/utils/widget_functions.dart';
import "package:flutter/material.dart";
import "package:get/get.dart";

import '../../commons/appbar.dart';
import '../../commons/title.dart';
import '../../constants/assets_path.dart';

class MediaView extends StatefulWidget {
  const MediaView({super.key});

  @override
  State<MediaView> createState() => _MediaViewState();
}

class _MediaViewState extends State<MediaView> {
  List<Media> medialist = MediaList.getMediaMedium();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBgColor,
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const MyWAppBar(),
          const Center(
            child: Text(
              'Media Links',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w500, color: bgWhite),
            ),
          ),
          addVerticalSpace(20),
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: textColorSub),
            child: Center(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: const Image(
                      image: AssetImage('assets/youtube.png'),
                      height: 50,
                      width: 50,
                    ))),
          ),
          Center(
            child: Card(
              color: bgWhite,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3)),
              child: const Padding(
                padding: EdgeInsets.only(left: 12.0, right: 12),
                child: Text(
                  "LIVE CHAT",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          addVerticalSpace(30),
          Expanded(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(bottom: 10),
                shrinkWrap: true,
                itemCount: medialist.length,
                itemBuilder: ((context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => {},
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: bgWhite,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image(
                                  image: AssetImage(medialist[index].icons),
                                  height: 30,
                                  width: 30,
                                ),
                              ),
                              addHorizontalSpace(20),
                              Expanded(
                                child: Text(
                                  medialist[index].title,
                                  style: const TextStyle(
                                      color: textColorBlack,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image(
                                      image: AssetImage(ArrowIcon),
                                      height: 20,
                                      width: 20))
                            ],
                          ),
                        ),
                      ),
                      addVerticalSpace(20)
                    ],
                  );
                })),
          )
        ]),
      )),
    );
  }
}
