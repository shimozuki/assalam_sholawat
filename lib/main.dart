// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'setting.dart';
import 'var.dart';
import 'aboutus.dart';
import 'help.dart';
import 'page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'time_solat.dart';
import 'splash.dart';
// import 'package:firebase_core/firebase_core.dart';

//run App
void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MaterialApp(
    home: Splash2(),
    title: 'Flutter',
    routes: {
      Pages.routeName: (context) => Pages(),
    },
  ));
}

//Flutter tuto 1-16
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final myController = TextEditingController();
  DateTime timeBackPressed = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final difference = DateTime.now().difference(timeBackPressed);
        final isExitWarning = difference >= Duration(seconds: 2);
        timeBackPressed = DateTime.now();

        if (isExitWarning) {
          final message = 'Press back again to exit';
          Fluttertoast.showToast(msg: message, fontSize: 18);
          return false;
        } else {
          SystemNavigator.pop();
          return true;
        }
      },
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: bgcolor,
          //top bar
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.amber),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Sholawat'),
                Tab(text: 'Terjemahan'),
              ],
            ),
            toolbarHeight: 60.0,
            title: Text(
              'Assalam Sholawat',
              style: TextStyle(
                letterSpacing: 4.0,
                fontFamily: 'Anton',
                fontSize: 25,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.grey[850],
            elevation: 0.0,
            actions: [
              IconButton(
                color: Colors.amber,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Setting()),
                  );
                },
                icon: Icon(
                  Icons.settings,
                ),
              ),
            ],
          ),
          // drawer: SizedBox(
          //   width: MediaQuery.of(context).size.width * 0.70,
          //   child: Drawer(
          //     child: Material(
          //       color: Colors.amber,
          //       child: Padding(
          //         padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          //         child: ListView(
          //           children: <Widget>[
          //             Column(
          //               mainAxisAlignment: MainAxisAlignment.start,
          //               children: const [
          //                 Text(
          //                   'MyQuran App',
          //                   style: TextStyle(
          //                     fontFamily: 'Anton',
          //                     fontSize: 30.0,
          //                     color: Colors.amber,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //             Divider(
          //               color: commontext,
          //             ),
          //             SizedBox(height: 10.0),
          //             buildMenuItem(
          //               text: 'About',
          //               icon: Icons.person,
          //               onPressed: () {
          //                 Navigator.push(
          //                   context,
          //                   MaterialPageRoute(
          //                       builder: (context) => const About()),
          //                 );
          //               },
          //             ),
          //             SizedBox(height: 10.0),
          //             buildMenuItem(
          //               text: 'Help',
          //               icon: Icons.help,
          //               onPressed: () {
          //                 Navigator.push(
          //                   context,
          //                   MaterialPageRoute(
          //                       builder: (context) => const Help()),
          //                 );
          //               },
          //             ),
          //             SizedBox(height: 10.0),
          //             buildMenuItem(
          //               text: 'Solat Time',
          //               icon: Icons.timer,
          //               onPressed: () {
          //                 Navigator.push(
          //                   context,
          //                   MaterialPageRoute(
          //                       builder: (context) => const MyApp()),
          //                 );
          //               },
          //             ),
          //             SizedBox(height: 10.0),
          //             buildMenuItem(
          //               text: 'Bookmarks',
          //               icon: Icons.bookmark,
          //               onPressed: () {
          //                 Navigator.push(
          //                   context,
          //                   MaterialPageRoute(
          //                       builder: (context) => const Bookmark()),
          //                 );
          //               },
          //             ),
          //             SizedBox(height: 10.0),
          //             buildMenuItem(
          //               text: 'Search',
          //               icon: Icons.search,
          //               onPressed: () => showDialog<String>(
          //                 context: context,
          //                 builder: (BuildContext context) => AlertDialog(
          //                   title: const Text('Jump to Page'),
          //                   content: TextField(
          //                     controller: myController,
          //                     keyboardType: TextInputType.number,
          //                     obscureText: false,
          //                     decoration: InputDecoration(
          //                       border: OutlineInputBorder(),
          //                       labelText: 'Insert Page',
          //                     ),
          //                   ),
          //                   actions: <Widget>[
          //                     TextButton(
          //                       onPressed: () =>
          //                           Navigator.pop(context, 'Cancel'),
          //                       child: const Text('Cancel'),
          //                     ),
          //                     TextButton(
          //                       onPressed: () {
          //                         Navigator.pushNamed(
          //                           context,
          //                           Pages.routeName,
          //                           arguments: ScreenArguments(
          //                             int.parse(myController.text),
          //                           ),
          //                         );
          //                       },
          //                       child: const Text('OK'),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),

          body: TabBarView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                child: ListView(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[700],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.amber,
                          width: 5,
                        ),
                      ),
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Center(
                          child: Text(
                            'Sholawat Nabi',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: 'Anton',
                              letterSpacing: 7,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    surah(
                      text: "اَللهُ الْكَافِى",
                      text2: "Allahul Kahfi'",
                      num: '1',
                      number: '582',
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          Pages.routeName,
                          arguments: ScreenArguments(0),
                        );
                      },
                    ),
                    surah(
                      text: "حَيُّوا الهَادِی",
                      text2: "Hayyul Hadi",
                      num: '2',
                      number: '583',
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          Pages.routeName,
                          arguments: ScreenArguments(1),
                        );
                      },
                    ),
                    surah(
                      text: "تَبَسَّمَ",
                      text2: "Tabassam",
                      num: '3',
                      number: '585',
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          Pages.routeName,
                          arguments: ScreenArguments(3),
                        );
                      },
                    ),
                    surah(
                      text: 'مَنْ أَنَا',
                      text2: "Man Ana",
                      num: '4',
                      number: '586',
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          Pages.routeName,
                          arguments: ScreenArguments(4),
                        );
                      },
                    ),
                    surah(
                      text: 'ا ربي أنت الهادي',
                      text2: "Ya Robbi Antalhadi",
                      num: '5',
                      number: '587',
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          Pages.routeName,
                          arguments: ScreenArguments(5),
                        );
                      },
                    ),
                    // surah(
                    //   text: 'Surah Al-Mutaffifin',
                    //   text2: "Mekah-36 verses",
                    //   num: '6',
                    //   number: '587',
                    //   onPressed: () {
                    //     Navigator.pushNamed(
                    //       context,
                    //       Pages.routeName,
                    //       arguments: ScreenArguments(5),
                    //     );
                    //   },
                    // ),
                    // surah(
                    //   text: 'Surah Al-Inshiqaq',
                    //   text2: "Mekah-25 verses",
                    //   num: '7',
                    //   number: '589',
                    //   onPressed: () {
                    //     Navigator.pushNamed(
                    //       context,
                    //       Pages.routeName,
                    //       arguments: ScreenArguments(7),
                    //     );
                    //   },
                    // ),
                    // surah(
                    //   text: 'Surah Al-Buruj',
                    //   text2: "Mekah-22 verses",
                    //   num: '8',
                    //   number: '590',
                    //   onPressed: () {
                    //     Navigator.pushNamed(
                    //       context,
                    //       Pages.routeName,
                    //       arguments: ScreenArguments(8),
                    //     );
                    //   },
                    // ),
                    // surah(
                    //   text: 'Surah At-Tariq',
                    //   text2: "Mekah-17 verses",
                    //   num: '9',
                    //   number: '591',
                    //   onPressed: () {
                    //     Navigator.pushNamed(
                    //       context,
                    //       Pages.routeName,
                    //       arguments: ScreenArguments(9),
                    //     );
                    //   },
                    // ),
                    // surah(
                    //   text: "Surah Al-A'la",
                    //   text2: "Mekah-19 verses",
                    //   num: '10',
                    //   number: '591',
                    //   onPressed: () {
                    //     Navigator.pushNamed(
                    //       context,
                    //       Pages.routeName,
                    //       arguments: ScreenArguments(9),
                    //     );
                    //   },
                    // ),
                    // surah(
                    //   text: 'Surah Al-Ghashiyah',
                    //   text2: "Mekah-26 verses",
                    //   num: '11',
                    //   number: '592',
                    //   onPressed: () {
                    //     Navigator.pushNamed(
                    //       context,
                    //       Pages.routeName,
                    //       arguments: ScreenArguments(10),
                    //     );
                    //   },
                    // ),
                    // surah(
                    //   text: 'Surah Al-Fajr',
                    //   text2: "Mekah-30 verses",
                    //   num: '12',
                    //   number: '593',
                    //   onPressed: () {
                    //     Navigator.pushNamed(
                    //       context,
                    //       Pages.routeName,
                    //       arguments: ScreenArguments(11),
                    //     );
                    //   },
                    // ),
                    // surah(
                    //   text: 'Surah Al-Balad',
                    //   text2: "Mekah-20 verses",
                    //   num: '13',
                    //   number: '594',
                    //   onPressed: () {
                    //     Navigator.pushNamed(
                    //       context,
                    //       Pages.routeName,
                    //       arguments: ScreenArguments(12),
                    //     );
                    //   },
                    // ),
                    // surah(
                    //   text: 'Surah Ash-Shams',
                    //   text2: "Mekah-15 verses",
                    //   num: '14',
                    //   number: '595',
                    //   onPressed: () {
                    //     Navigator.pushNamed(
                    //       context,
                    //       Pages.routeName,
                    //       arguments: ScreenArguments(13),
                    //     );
                    //   },
                    // ),
                    // surah(
                    //   text: 'Surah Al-Layl',
                    //   text2: "Mekah-21 verses",
                    //   num: '15',
                    //   number: '595',
                    //   onPressed: () {
                    //     Navigator.pushNamed(
                    //       context,
                    //       Pages.routeName,
                    //       arguments: ScreenArguments(13),
                    //     );
                    //   },
                    // ),
                    // surah(
                    //   text: 'Surah Ad-Dhuha',
                    //   text2: "Mekah-11 verses",
                    //   num: '16',
                    //   number: '596',
                    //   onPressed: () {
                    //     Navigator.pushNamed(
                    //       context,
                    //       Pages.routeName,
                    //       arguments: ScreenArguments(14),
                    //     );
                    //   },
                    // ),
                    // surah(
                    //   text: 'Surah Al-Sharh',
                    //   text2: "Mekah-8 verses",
                    //   num: '17',
                    //   number: '596',
                    //   onPressed: () {
                    //     Navigator.pushNamed(
                    //       context,
                    //       Pages.routeName,
                    //       arguments: ScreenArguments(14),
                    //     );
                    //   },
                    // ),
                    // surah(
                    //   text: 'Surah At-Tin',
                    //   text2: "Mekah-8 verses",
                    //   num: '18',
                    //   number: '597',
                    //   onPressed: () {
                    //     Navigator.pushNamed(
                    //       context,
                    //       Pages.routeName,
                    //       arguments: ScreenArguments(15),
                    //     );
                    //   },
                    // ),
                    // surah(
                    //   text: 'Surah Al-Alaq',
                    //   text2: "Mekah-19 verses",
                    //   num: '19',
                    //   number: '597',
                    //   onPressed: () {
                    //     Navigator.pushNamed(
                    //       context,
                    //       Pages.routeName,
                    //       arguments: ScreenArguments(15),
                    //     );
                    //   },
                    // ),
                    // surah(
                    //   text: 'Surah Al-Qadr',
                    //   text2: "Mekah-5 verses",
                    //   num: '20',
                    //   number: '598',
                    //   onPressed: () {
                    //     Navigator.pushNamed(
                    //       context,
                    //       Pages.routeName,
                    //       arguments: ScreenArguments(16),
                    //     );
                    //   },
                    // ),
                    // surah(
                    //   text: 'Surah Al-Bayyinah',
                    //   text2: "Mekah-8 verses",
                    //   num: '21',
                    //   number: '598',
                    //   onPressed: () {
                    //     Navigator.pushNamed(
                    //       context,
                    //       Pages.routeName,
                    //       arguments: ScreenArguments(16),
                    //     );
                    //   },
                    // ),
                    // surah(
                    //   text: 'Surah Az-Zalzalah',
                    //   text2: "Mekah-8 verses",
                    //   num: '22',
                    //   number: '599',
                    //   onPressed: () {
                    //     Navigator.pushNamed(
                    //       context,
                    //       Pages.routeName,
                    //       arguments: ScreenArguments(17),
                    //     );
                    //   },
                    // ),
                    // surah(
                    //   text: 'Surah Al-Adiyat',
                    //   text2: "Mekah-11 verses",
                    //   num: '23',
                    //   number: '599',
                    //   onPressed: () {
                    //     Navigator.pushNamed(
                    //       context,
                    //       Pages.routeName,
                    //       arguments: ScreenArguments(17),
                    //     );
                    //   },
                    // ),
                    // surah(
                    //   text: "Surah Al-Qari'ah",
                    //   text2: "Mekah-11 verses",
                    //   num: '24',
                    //   number: '600',
                    //   onPressed: () {
                    //     Navigator.pushNamed(
                    //       context,
                    //       Pages.routeName,
                    //       arguments: ScreenArguments(18),
                    //     );
                    //   },
                    // ),
                    // surah(
                    //   text: 'Surah At-Takathur',
                    //   text2: "Mekah-8 verses",
                    //   num: '25',
                    //   number: '600',
                    //   onPressed: () {
                    //     Navigator.pushNamed(
                    //       context,
                    //       Pages.routeName,
                    //       arguments: ScreenArguments(18),
                    //     );
                    //   },
                    // ),
                    // surah(
                    //   text: 'Surah Al-Asr',
                    //   text2: "Mekah-3 verses",
                    //   num: '26',
                    //   number: '601',
                    //   onPressed: () {
                    //     Navigator.pushNamed(
                    //       context,
                    //       Pages.routeName,
                    //       arguments: ScreenArguments(19),
                    //     );
                    //   },
                    // ),
                    // surah(
                    //   text: 'Surah Al-Humazah',
                    //   text2: "Mekah-9 verses",
                    //   num: '27',
                    //   number: '601',
                    //   onPressed: () {
                    //     Navigator.pushNamed(
                    //       context,
                    //       Pages.routeName,
                    //       arguments: ScreenArguments(19),
                    //     );
                    //   },
                    // ),
                    // surah(
                    //   text: 'Surah Al-Fil',
                    //   text2: "Mekah-5 verses",
                    //   num: '28',
                    //   number: '601',
                    //   onPressed: () {
                    //     Navigator.pushNamed(
                    //       context,
                    //       Pages.routeName,
                    //       arguments: ScreenArguments(19),
                    //     );
                    //   },
                    // ),
                    // surah(
                    //   text: 'Surah Quraysh',
                    //   text2: "Mekah-4 verses",
                    //   num: '29',
                    //   number: '602',
                    //   onPressed: () {
                    //     Navigator.pushNamed(
                    //       context,
                    //       Pages.routeName,
                    //       arguments: ScreenArguments(20),
                    //     );
                    //   },
                    // ),
                    // surah(
                    //   text: "Surah Al-Ma'un",
                    //   text2: "Mekah-7 verses",
                    //   num: '30',
                    //   number: '602',
                    //   onPressed: () {
                    //     Navigator.pushNamed(
                    //       context,
                    //       Pages.routeName,
                    //       arguments: ScreenArguments(20),
                    //     );
                    //   },
                    // ),
                    // surah(
                    //   text: 'Surah Al-Kawthar',
                    //   text2: "Mekah-3 verses",
                    //   num: '31',
                    //   number: '602',
                    //   onPressed: () {
                    //     Navigator.pushNamed(
                    //       context,
                    //       Pages.routeName,
                    //       arguments: ScreenArguments(20),
                    //     );
                    //   },
                    // ),
                    // surah(
                    //   text: 'Surah Al-Kafirun',
                    //   text2: "Mekah-6 verses",
                    //   num: '32',
                    //   number: '603',
                    //   onPressed: () {
                    //     Navigator.pushNamed(
                    //       context,
                    //       Pages.routeName,
                    //       arguments: ScreenArguments(21),
                    //     );
                    //   },
                    // ),
                    // surah(
                    //   text: 'Surah An-Nasr',
                    //   text2: "Mekah-3 verses",
                    //   num: '33',
                    //   number: '603',
                    //   onPressed: () {
                    //     Navigator.pushNamed(
                    //       context,
                    //       Pages.routeName,
                    //       arguments: ScreenArguments(21),
                    //     );
                    //   },
                    // ),
                    // surah(
                    //   text: 'Surah Al-Masad',
                    //   text2: "Mekah-5 verses",
                    //   num: '34',
                    //   number: '603',
                    //   onPressed: () {
                    //     Navigator.pushNamed(
                    //       context,
                    //       Pages.routeName,
                    //       arguments: ScreenArguments(21),
                    //     );
                    //   },
                    // ),
                    // surah(
                    //   text: 'Surah Al-Ikhlas',
                    //   text2: "Mekah-4 verses",
                    //   num: '35',
                    //   number: '604',
                    //   onPressed: () {
                    //     Navigator.pushNamed(
                    //       context,
                    //       Pages.routeName,
                    //       arguments: ScreenArguments(22),
                    //     );
                    //   },
                    // ),
                    // surah(
                    //   text: 'Surah Al-Falaq',
                    //   text2: "Mekah-5 verses",
                    //   num: '36',
                    //   number: '604',
                    //   onPressed: () {
                    //     Navigator.pushNamed(
                    //       context,
                    //       Pages.routeName,
                    //       arguments: ScreenArguments(22),
                    //     );
                    //   },
                    // ),
                    // surah(
                    //   text: 'Surah An-Nas',
                    //   text2: "Mekah-6 verses",
                    //   num: '37',
                    //   number: '604',
                    //   onPressed: () {
                    //     Navigator.pushNamed(
                    //       context,
                    //       Pages.routeName,
                    //       arguments: ScreenArguments(22),
                    //     );
                    //   },
                    // ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                child: ListView(
                  children: <Widget>[
                    SizedBox(height: 10.0),
                    juzuk(
                      text: "Sholawat",
                      number: '582',
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          Pages.routeName,
                          arguments: ScreenArguments(0),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildMenuItem({
  required String text,
  required IconData icon,
  VoidCallback? onPressed,
}) {
  const iconcolor = Colors.amber;
  var textcolor = commontext;

  return ListTile(
    leading: Icon(
      icon,
      color: iconcolor,
    ),
    title: Text(
      text,
      style: TextStyle(color: textcolor),
    ),
    onTap: onPressed,
  );
}

Widget surah({
  required String text,
  required String text2,
  required String num,
  required String number,
  VoidCallback? onPressed,
}) {
  return Card(
    color: Colors.grey[700],
    child: ListTile(
      leading: Text(
        num,
        style:
            TextStyle(fontFamily: 'Anton', fontSize: 30.0, color: Colors.amber),
      ),
      title: Column(
        children: [
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text(text2, style: TextStyle(color: Colors.grey, letterSpacing: 2)),
        ],
      ),
      trailing: Text(number,
          style: TextStyle(
            color: Colors.amber,
          )),
      onTap: onPressed,
    ),
  );
}

Widget juzuk({
  required String text,
  required String number,
  VoidCallback? onPressed,
}) {
  return Card(
    color: Colors.grey[700],
    child: ListTile(
      title: Padding(
        padding: EdgeInsets.fromLTRB(10, 0.0, 0.0, 0.0),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 5,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      trailing: Text(
        number,
        style: TextStyle(
          color: Colors.amber,
        ),
      ),
      onTap: onPressed,
    ),
  );
}
