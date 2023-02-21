import 'package:cacsa/commons/appbar.dart';
import 'package:cacsa/commons/navigation_bar.dart';
import 'package:cacsa/utils/colors.dart';
import 'package:cacsa/utils/widget_functions.dart';
import 'package:flutter/material.dart';

class FounderBio extends StatelessWidget {
  const FounderBio({Key? key}) : super(key: key);

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
                  'BIOGRAPHY OF LATE PASTOR (DR.) SAMUEL OLUWABUSUYI ARIJESUDADE',
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
                                    '''Pastor Samuel Oluwabusuyi AriJesudade was born in Igede Ekiti around 18th of March, 1943 to Pa. Daniel Ogunlana and Madam Mary Omoloju Ogunlana Arogundade of Ilesa and Ijebu-Jesa respectively.
                                    '''),
                            addVerticalSpace(8),
                            const Section(
                                title: "HIS EDUCATION",
                                content:
                                    '''After his primary school education, he went to different schools before sitting for the West African School Certificate Examination.  He served as “tuule” (ministerial apprenticeship) under Evangelist D. O. Babajide and Prophet T.O. Obadare for some time after his secondary school education.  He proceeded to Higher School Certificate (HSC) at Adeola Odutola College, Ijebu-Ode, between 1967 and 1968.  He taught briefly at Eyemote Comprehensive High School, Iyin Ekiti in 1969 before leaving for the University of Ibadan same year.
                                    \nAt the University of Ibadan, Olu AriJesudade as his popularly called got genuinely born again in the last week of October, 1969 and changed his surname from Arogundade to AriJesudade in the following year as led by the Spirit of God.
                                    '''),
                            addVerticalSpace(8),
                            const Section(
                                title: "THE VISION THAT GAVE BIRTH TO CACSA",
                                content:
                                    '''God will always surround His faithful children with men and women who will guide them in the journey of life.  This is the case of Olu AriJesudade as God used Prophetess Ogunranti and Professor Imevbore to guide and support him in many ways.  The prayer meetings he coordinated as a student with some of his mates that were held at Christ Apostolic Church Bethel, UI led to the vision of Christ Apostolic Church Students’ Association (CACSA) in 1970. The vision was to “rescue the youth of Christ Apostolic Church from the torrents of the world”.  The first conference in pursuit of that vision was held in Efon Alaaye in 1971.
                                    \nAfter his graduation with Bachelor of Science in Political Science in 1972, Olu AriJesudade underwent Pastoral Ordination Course at Christ Apostolic Church Pastoral College, Agege and was ordained as a Pastor.  He had wanted to be an Ambassador but changed his ambition for the service of God and humanity.  He chose teaching for the purpose of impacting lives.  In 1974, he did Postgraduate Diploma in Education at Ahmadu Bello University, Zaria.
                                    '''),
                            const Section(
                                title: "HIS FAMILY LIFE",
                                content:
                                    '''A Yoruba adage says “a child should be given hoe when he is matured enough to get one” so is the case of Olu AriJesudade when he decided to quit bachelorhood.  Having fulfilled the demands of the families and traditional matrimonial rites, Olu AriJesudade wedded his wife, Aderonke on 14th July, 1973 in Holy Matrimony at The Apostolic Church, Gbongan.  As at 1972, Aderonke was the Senior Girls’ Prefect at Oduduwa College, Ile-Ife, the school that hosted the second National Conference of CACSA same year.
                                    \nThe marriage was blessed with five children:  Toyin, Kayode, Segun, Setemi and Seun.
                                    \nBaba AriJesudade tried to find time for his biological children despite his teaching and ministerial schedules.  He loved them, provided for them and tried his best to educate them.  He also showed them the way of God.  He was a loving father.
                                    '''),
                            addVerticalSpace(8),
                            const Section(
                                title: "BABA ARIJESUDADE AND CACSA",
                                content:
                                    '''Apart from the fact that the vision of Christ Apostolic Church Students’ Association was given to Baba, he did everything humanly possible to nurture the vision for solid forty three years.  While he was still doing his secular work as a teacher, he did not allow anything to share his dedication and loyalty to the heavenly vision.  He always used every opportunity at his disposal to share the gospel and help the down trodden youths in choosing the right path with God.
                                    \nHe was at no time used his position to harass or intimidate anybody within and outside the fold.  The popular message of Baba was “be filled with the Holy Spirit”.  He was contented with the little he had.  He never amassed any wealth, property or assets to his credit.  He spend and be spent for the work of God.
                                    '''),
                            addVerticalSpace(8),
                            const Section(
                                title: "HIS LEGACY",
                                content:
                                    '''Baba was a rare gem in many perspectives. His ability to know members by name whether high or low is worthy of emulation.  He is a good manager of time.  He would be seated at functions before the arrival of others.  He believes so much in “thus says the Lord” which some people capitalized on to have their way.  He is an epitome of love to the extent that he loved the unlovables. Another legacy of Baba worth mentioning is his humility.  In spite of godly endowment upon his life, he lived a life of humility throughout the days of his life.  Another legacy of Baba was “his undiluted faith” as attested to by Lady Evang. (Dr.) Bola Are in a tribute to the great Icon.
                                    '''),
                            addVerticalSpace(8),
                            const Section(
                                title: "BABA IN THE TEACHING PROFESSION",
                                content:
                                    '''He served in many secondary schools all of which he turned to mission fields as an ambassador of Christ.  He served at Babalola Memorial Grammar School, Odo Owa, where he became a Vice Principal (1972 – 1978), Lennon Memorial College, Okene as Vice Principal (1978-1984), Saint Barnabas College, Kabba (1984-1987), Aiyetoro-Gbede Comprehensive High School (1989-1993) and finally Christian Comprehensive High School, Ijumu-Oro (1993-1995) where he retired voluntarily.
                                    '''),
                            addVerticalSpace(8),
                            const Section(
                                title: "HIS DEMISE",
                                content:
                                    '''After a brief illness, Baba passed on on 10th of December, 2013 at the age of seventy years.'''),
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
