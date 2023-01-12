import 'package:cached_network_image/cached_network_image.dart';
import 'package:cacsa/commons/navigation_bar.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:cacsa/utils/widget_functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NotificationWidget extends StatefulWidget {
  const NotificationWidget({super.key});

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  late Stream<DocumentSnapshot<Map<String, dynamic>>> adsStream;

  List<String> advert = [
    "Ads or\n Upcoming Events",
    "Ads or\n Upcoming Events",
    "Ads or\n Upcoming Events"
  ];

  @override
  void initState() {
    adsStream = FirebaseFirestore.instance
        .collection("ads")
        .doc("h5VdPmJ8XQ7jOR9BLUxp")
        .snapshots();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: bgGrey,
        bottomNavigationBar: const MyNavBar(),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addVerticalSpace(20),
              const Center(
                child: Text(
                  "Notifications",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: textColorGreen,
                      fontWeight: FontWeight.w700,
                      fontSize: 40,
                      fontFamily: 'Euclid-Medium'),
                ),
              ),
              addVerticalSpace(10),
              Expanded(
                child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                  stream: adsStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List urls = snapshot.data!.get("urls").toList();
                      return ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: urls.length,
                          itemBuilder: (context, index) {
                            return CachedNetworkImage(
                              imageUrl: urls[index],
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            );
                          });
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ),
              // Expanded(
              //   child: ListView.builder(
              //       physics: const BouncingScrollPhysics(),
              //       itemCount: advert.length,
              //       itemBuilder: ((context, index) {
              //         return Padding(
              //           padding: const EdgeInsets.only(left: 20, right: 20),
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Container(
              //                 width: MediaQuery.of(context).size.width,
              //                 height: 150,
              // padding:
              //     const EdgeInsets.only(left: 20, bottom: 20),
              //                 decoration: const BoxDecoration(
              //                     color: backgroundyellow,
              // borderRadius:
              //     BorderRadius.all(Radius.circular(10))),
              //                 child: Align(
              //                     alignment: Alignment.bottomLeft,
              //                     child: Text(
              //                       advert[index],
              //                       style: const TextStyle(
              //                           fontSize: 20,
              //                           fontWeight: FontWeight.bold),
              //                     )),
              //               ),
              //               addVerticalSpace(10)
              //             ],
              //           ),
              //         );
              //       })),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
