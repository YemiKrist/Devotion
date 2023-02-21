import 'package:cacsa/commons/appbar.dart';
import 'package:cacsa/commons/navigation_bar.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:cacsa/utils/widget_functions.dart';
import 'package:flutter/material.dart';

class LeadersBio extends StatelessWidget {
  const LeadersBio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const MyNavBar(),
        backgroundColor: splashBackgroundColor,
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            //  margin: const EdgeInsets.symmetric(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MyAppBar(),
                addVerticalSpace(25),
                const Text(
                  'BIOGRAPHY OF PASTOR DR. JOSEPH BABATOPE ADEYEMO',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: textColorGreen,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      fontFamily: 'Euclid-Medium'),
                ),
                addVerticalSpace(15),
                Expanded(
                    flex: 2,
                    child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            const Section(
                                title: "HIS BIRTH",
                                content:
                                    '''Pastor Dr. Joseph Babatope Adeyemo was born in 1957 to the family of Pa and Mrs. G. E. Adeyemo of Ipoti-Ekiti in Ijero Local Government of Ekiti State.
                                    '''),
                            addVerticalSpace(8),
                            const Section(
                                title: "HIS EDUCATION",
                                content:
                                    '''Pastor Dr. Joseph Babatope Adeyemo was born in 1957 to the family of Pa and Mrs. G. E. Adeyemo of Ipoti-Ekiti in Ijero Local Government of Ekiti State.
                                    '''),
                            addVerticalSpace(8),
                            const Section(
                                title: "THE ERA OF PASTOR ADEYEMO IN CACSA",
                                content:
                                    '''Right from his secondary school, Pastor Adeyemo committed himself to serve the Lord.  He was appointed the branch leader of CACSA fellowship in Ipoti High School, Ipoti Ekiti (1976/77).  Upon completion of his first degree, he chose to serve with CACSA during his NYSC year in the then Bauchi and Plateau States.  He served as the Zonal Secretary, then as the Zonal leader of CACSA, Akure Zone in 1986/87 and 1991/92 respectively.
                                    \nFurthermore, he served as Ondo State Secretary of CACSA before he was appointed as the Ondo State Minister of CACSA in 1993.  He became the Deputy Director of Administration of CACSA in 1994 and in 1996, he was appointed as the Director of Administration, the position he occupied till His appointment as the President in 2014.  He was a Pastor in CAC Victory Assembly, Akure from 1999-2004 and in CAC Chapel of Mercy, Ado-Ekiti from 2008-2018.
                                    '''),
                            const Section(
                                title: "HIS FAMILY LIFE",
                                content:
                                    '''Pastor Adeyemo quit bachelorhood in the year 1987 when he got married to his darling wife, Mrs. Victoria Oluwayemisi Adeyemo at CAC Oke Alaafia, Akure, Ondo State.  The marriage is blessed with three children, Oluwatosin, EbunOluwa and Oluwafunmilayo who are now happily married to the glory of God.
                                    '''),
                            addVerticalSpace(8),
                            const Section(
                                title:
                                    "PASTOR ADEYEMO’S CAREER IN THE CIVIL SERVICE",
                                content:
                                    '''He started his career as a class teacher in the old Ondo State.  He taught for 10 years before he joined the Civil Service.  He served in various positions in the Civil Service before he was appointed as Permanent Secretary in the Ekiti Civil Service Commission in 2012.  He retired voluntarily in 2013 and has since been fully committed to the service of the Kingdom.
                                    '''),
                            addVerticalSpace(8),
                            const Section(
                                title:
                                    "THE MANTLE OF LEADERSHIP FELL UPON HIS SHOULDER",
                                content:
                                    '''The demise of Baba AriJesudade on 10th December, 2013 created a big vacuum in CACSA which prompted the leaders to seek the face of God for a successor.  Elder (Prof.) Dosu Oyewole, the oldest member became the interim leader till 5th July 2014 when Pastor (Dr.) Joseph Babatope Adeyemo became the National Leader of the group.
                                    \nThe choice of a successor to Baba AriJesudade had the approval of God as it happened without bitterness or rancour.
                                    '''),
                            addVerticalSpace(8),
                            const Section(
                                title:
                                    "GROWTH AND DEVELOPMENT WITNESSED IN HIS TENURE",
                                content:
                                    '''To the glory of God, a lot of growth and development have taken place since the mantle of leadership fell on him.
                                    \nThe Olu AriJesudade Memorial Hall that has reached 60% completion is one of the notable achievements of his administration.  Re-roofing of old buildings, purchase of the school premises, construction of perimeter fencing, approval of Christ Leads School as a WAEC & NECO Centre, establishment of Arijesudade Centre for Leadership Development (ARICLEAD), an NGO, life streaming of our programmes among others are part of the laudable achievements recorded in his tenure.
                                    '''),
                            addVerticalSpace(8),
                            const Section(
                                title: "HIS LEGACY",
                                content:
                                    '''He is an astute administrator, a goal getter and a passionate teacher of the Word.
                                    '''),
                            addVerticalSpace(12),
                            const Section(
                                title: "Complied by:",
                                content:
                                    '''Pastor Sam Ayodele\nDirector of Publicity & Publications\nCACSA
                                    ''')
                          ],
                        )))
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
          TextSpan(text: '$title\n', style: themeData.textTheme.headline4),
          TextSpan(text: content, style: themeData.textTheme.bodyText1)
        ]),
        textAlign: TextAlign.left,
      ),
    );
  }
}
