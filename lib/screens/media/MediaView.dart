import 'dart:developer';

import 'package:cacsa/models/media.dart';
import 'package:cacsa/screens/media/media.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:cacsa/utils/widget_functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../commons/appbar.dart';
import '../../commons/navigation_bar.dart';
import '../../constants/assets_path.dart';

class MediaView extends StatefulWidget {
  const MediaView({super.key});

  @override
  State<MediaView> createState() => _MediaViewState();
}

class _MediaViewState extends State<MediaView> {
  List<Media> medialist = MediaList.getMediaMedium();
  void launchView(url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    }
  }

  void launchLocalView(url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.platformDefault);
    }
  }

  late Stream<DocumentSnapshot<Map<String, dynamic>>> stream;

  @override
  void initState() {
    stream = FirebaseFirestore.instance
        .collection("yt_stream")
        .doc("V906YkgSW0uy1L1b45Us")
        .snapshots();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MyNavBar(),
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
          StreamBuilder<DocumentSnapshot>(
            stream: stream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const YTStream(
                  link: "",
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const YTStream(
                  link: "",
                );
              } else {
                snapshot.data!.get('link');
                log("link is ${snapshot.data!.get('link')}");
                return YTStream(
                  link: snapshot.data!.get('link'),
                );
              }
            },
          ),
          // Container(
          //   width: double.infinity,
          //   height: 180,
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(10), color: textColorSub),
          //   child: Center(
          //       child: ClipRRect(
          //           borderRadius: BorderRadius.circular(30),
          //           child: const Image(
          //             image: AssetImage('assets/youtube.png'),
          //             height: 50,
          //             width: 50,
          //           ))),
          // ),

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
                        onTap: () {
                          launchLocalView(medialist[index].route);
                        },
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

class YTStream extends StatefulWidget {
  final String link;
  const YTStream({Key? key, required this.link}) : super(key: key);

  @override
  State<YTStream> createState() => _YTStreamState();
}

class _YTStreamState extends State<YTStream> {
  late YoutubePlayerController _controller;
  final bool _isPlayerReady = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() {
    if (widget.link.isNotEmpty) {
      _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(widget.link)!,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          isLive: true,
        ),
      );
    } else {
      _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(
            "https://www.youtube.com/watch?v=-uzlNcoN934")!,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
        ),
      );
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
        ),
        builder: (context, player) {
          return Column(
            children: [
              // some widgets
              player,
              //some other widgets
            ],
          );
        },
      ),
    );
  }
}
