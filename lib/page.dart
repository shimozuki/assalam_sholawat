import 'package:flutter/material.dart';
import 'package:flutter_quran/main.dart';
import 'var.dart';
import 'package:audioplayers/audioplayers.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';

// ignore_for_file: prefer_const_constructors

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MaterialApp(home: Pages()));
}

class Pages extends StatefulWidget {
  const Pages({Key? key}) : super(key: key);
  static const routeName = '/extractArguments';
  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    PageController pageController = PageController(
      initialPage: args.number,
    );
    return Scaffold(
      backgroundColor: bgcolor,
      body: PageView(
        reverse: true,
        controller: pageController,
        children: <Widget>[
          P582(),
          P583(),
          P584(),
          P585(),
          P586(),
          P587(),
          P588(),
          P589(),
          P590(),
          P591(),
          P592(),
          P593(),
          P594(),
          P595(),
          P596(),
          P597(),
          P598(),
          P599(),
          P600(),
          P601(),
          P602(),
          P603(),
          P604(),
        ],
      ),
    );
  }
}

class P582 extends StatefulWidget {
  const P582({Key? key}) : super(key: key);

  @override
  State<P582> createState() => _P582State();
}

class _P582State extends State<P582> {
  // CollectionReference mark = FirebaseFirestore.instance.collection('bookmark');
  AudioCache audioCache = AudioCache();
  PlayerState audioPlayerState = PlayerState.PAUSED;
  AudioPlayer audioPlayer = AudioPlayer();
  void _playFile() async {
    audioPlayer = await audioCache.play('582.mp3',
        stayAwake: true, mode: PlayerMode.MEDIA_PLAYER);
    // assign player here
  }

  void _stopFile() {
    audioPlayer.pause();
    // stop the file like this
  }

  // Future<void> _bookmark() {
  //   return mark
  //       .add({'bookmarkpages': 0})
  //       .then((value) => debugPrint("Bookmark Added"))
  //       .catchError((error) => debugPrint("Failed to add bookmark : $error"));
  // }

  // Future<void> _delete() {
  //   return mark
  //       .doc('ChNP67Iur101Q6xga0mS')
  //       .set('data')
  //       .then((value) => debugPrint("Bookmark Added"))
  //       .catchError((error) => debugPrint("Failed to add bookmark : $error"));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: bgcolor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
        ),
        title: Column(
          children: const [
            Text(
              "اَللهُ الْكَافِى",
              style: TextStyle(
                fontFamily: 'Anton',
                letterSpacing: 4.0,
              ),
            ),
            Text(
              "Sholawat Allahul Kahfi",
              style: TextStyle(
                letterSpacing: 4.0,
                fontSize: 15,
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[850],
        actions: [
          IconButton(
            icon: GestureDetector(
                child: Icon(selected582
                    ? Icons.bookmark
                    : Icons.bookmark_add_outlined)),
            onPressed: () {
              setState(() {
                selected582 = !selected582;
                if (selected582 == true) {
                  // _bookmark();
                } else {
                  // _delete();
                }
              });
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            isVisible = !isVisible;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/582.jpeg"),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Visibility(
        visible: isVisible,
        child: Container(
          height: 40,
          color: audiobar,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(play582 ? Icons.pause : Icons.play_arrow),
                onPressed: () {
                  setState(() {
                    play582 = !play582;
                    if (play582 == true) {
                      showDialog<String>(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) => AlertDialog(
                          backgroundColor: Colors.amber,
                          title: Text(
                            'Notice :',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                  'Make sure you pause the audio before navigate or change to another page,'),
                              SizedBox(height: 10),
                              const Text(
                                  'This Application is still on development and it may have some error on it,'),
                              SizedBox(height: 10),
                              const Text(
                                  'It will cause an error if you navigate to another page without pause the audio,'),
                              SizedBox(height: 10),
                              const Text(
                                  'If that happen, only ways to stop it you need to close the app,'),
                              SizedBox(height: 10),
                              const Text(
                                  'Each pages has their own audio. You need to do the same thing in another page,'),
                              SizedBox(height: 10),
                              const Text('Sorry for the problem appear.'),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Text(
                                    'Thank You!!!',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.black),
                                onPressed: () {
                                  Navigator.pop(context, 'Cancel');
                                },
                                child: const Text('OK'))
                          ],
                        ),
                      );
                      _playFile();
                    } else if (play582 == false) {
                      _stopFile();
                    }
                  });
                },
              ),
              VerticalDivider(
                width: 15,
                color: Colors.white,
                thickness: 2,
                endIndent: 4,
                indent: 4,
              ),
              Text('Az Zahir',
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class P583 extends StatefulWidget {
  const P583({Key? key}) : super(key: key);

  @override
  State<P583> createState() => _P583State();
}

class _P583State extends State<P583> {
  AudioCache audioCache = AudioCache();
  PlayerState audioPlayerState = PlayerState.PAUSED;
  AudioPlayer audioPlayer = AudioPlayer();
  void _playFile() async {
    audioPlayer = await audioCache.play('583.mp3',
        stayAwake: true, mode: PlayerMode.MEDIA_PLAYER);
    // assign player here
  }

  void _stopFile() {
    audioPlayer.pause();
    // stop the file like this
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: bgcolor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
        ),
        title: Column(
          children: const [
            Text(
              "حَيُّوا الهَادِی",
              style: TextStyle(fontFamily: 'Anton', letterSpacing: 4.0),
            ),
            Text(
              "Sholawat Hayyul Hadi",
              style: TextStyle(
                letterSpacing: 4.0,
                fontSize: 15,
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[850],
        actions: [
          IconButton(
            icon: GestureDetector(
                child: Icon(selected583
                    ? Icons.bookmark
                    : Icons.bookmark_add_outlined)),
            onPressed: () {
              setState(() {
                selected583 = !selected583;
                if (selected583 == true) {
                } else {}
              });
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            isVisible = !isVisible;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/583.jpeg"),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Visibility(
        visible: isVisible,
        child: Container(
          height: 40,
          color: audiobar,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(play583 ? Icons.pause : Icons.play_arrow),
                onPressed: () {
                  setState(() {
                    play583 = !play583;
                    if (play583 == true) {
                      showDialog<String>(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) => AlertDialog(
                          backgroundColor: Colors.amber,
                          title: Text(
                            'Notice :',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                  'Make sure you pause the audio before navigate or change to another page,'),
                              SizedBox(height: 10),
                              const Text(
                                  'This Application is still on development and it may have some error on it,'),
                              SizedBox(height: 10),
                              const Text(
                                  'It will cause an error if you navigate to another page without pause the audio,'),
                              SizedBox(height: 10),
                              const Text(
                                  'If that happen, only ways to stop it you need to close the app,'),
                              SizedBox(height: 10),
                              const Text(
                                  'Each pages has their own audio. You need to do the same thing in another page,'),
                              SizedBox(height: 10),
                              const Text('Sorry for the problem appear.'),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Text(
                                    'Thank You!!!',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.black),
                                onPressed: () {
                                  Navigator.pop(context, 'Cancel');
                                },
                                child: const Text('OK'))
                          ],
                        ),
                      );
                      _playFile();
                    } else {
                      _stopFile();
                    }
                  });
                },
              ),
              VerticalDivider(
                width: 15,
                color: Colors.white,
                thickness: 2,
                endIndent: 4,
                indent: 4,
              ),
              Text('Az Zahir',
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class P584 extends StatefulWidget {
  const P584({Key? key}) : super(key: key);

  @override
  State<P584> createState() => _P584State();
}

class _P584State extends State<P584> {
  AudioCache audioCache = AudioCache();
  PlayerState audioPlayerState = PlayerState.PAUSED;
  AudioPlayer audioPlayer = AudioPlayer();
  void _playFile() async {
    audioPlayer = await audioCache.play('584.mp3',
        stayAwake: true, mode: PlayerMode.MEDIA_PLAYER);
    // assign player here
  }

  void _stopFile() {
    audioPlayer.pause();
    // stop the file like this
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      extendBody: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
        ),
        title: Column(
          children: const [
            Text(
              "Surah An-Nazi'at",
              style: TextStyle(fontFamily: 'Anton', letterSpacing: 4.0),
            ),
            Text(
              "Page 584,Juzuk 30",
              style: TextStyle(
                letterSpacing: 4.0,
                fontSize: 15,
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[850],
        actions: [
          IconButton(
            icon: GestureDetector(
                child: Icon(selected584
                    ? Icons.bookmark
                    : Icons.bookmark_add_outlined)),
            onPressed: () {
              setState(() {
                selected584 = !selected584;
                if (selected584 == true) {
                } else {}
              });
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            isVisible = !isVisible;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/584.jpeg"),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Visibility(
        visible: isVisible,
        child: Container(
          height: 40,
          color: audiobar,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(play584 ? Icons.pause : Icons.play_arrow),
                onPressed: () {
                  setState(() {
                    play584 = !play584;
                    if (play584 == true) {
                      showDialog<String>(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) => AlertDialog(
                          backgroundColor: Colors.amber,
                          title: Text(
                            'Notice :',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                  'Make sure you pause the audio before navigate or change to another page,'),
                              SizedBox(height: 10),
                              const Text(
                                  'This Application is still on development and it may have some error on it,'),
                              SizedBox(height: 10),
                              const Text(
                                  'It will cause an error if you navigate to another page without pause the audio,'),
                              SizedBox(height: 10),
                              const Text(
                                  'If that happen, only ways to stop it you need to close the app,'),
                              SizedBox(height: 10),
                              const Text(
                                  'Each pages has their own audio. You need to do the same thing in another page,'),
                              SizedBox(height: 10),
                              const Text('Sorry for the problem appear.'),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Text(
                                    'Thank You!!!',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.black),
                                onPressed: () {
                                  Navigator.pop(context, 'Cancel');
                                },
                                child: const Text('OK'))
                          ],
                        ),
                      );
                      _playFile();
                    } else {
                      _stopFile();
                    }
                  });
                },
              ),
              VerticalDivider(
                width: 15,
                color: Colors.white,
                thickness: 2,
                endIndent: 4,
                indent: 4,
              ),
              Text('Az Zahir',
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class P585 extends StatefulWidget {
  const P585({Key? key}) : super(key: key);

  @override
  State<P585> createState() => _P585State();
}

class _P585State extends State<P585> {
  AudioCache audioCache = AudioCache();
  PlayerState audioPlayerState = PlayerState.PAUSED;
  AudioPlayer audioPlayer = AudioPlayer();
  void _playFile() async {
    audioPlayer = await audioCache.play('584.mp3',
        stayAwake: true, mode: PlayerMode.MEDIA_PLAYER);
    // assign player here
  }

  void _stopFile() {
    audioPlayer.pause();
    // stop the file like this
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      extendBody: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
        ),
        title: Column(
          children: const [
            Text(
              "Sholawat Tabassam",
              style: TextStyle(fontFamily: 'Anton', letterSpacing: 4.0),
            ),
            Text(
              "Sholawat Tabassam",
              style: TextStyle(
                letterSpacing: 4.0,
                fontSize: 15,
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[850],
        actions: [
          IconButton(
            icon: GestureDetector(
                child: Icon(selected585
                    ? Icons.bookmark
                    : Icons.bookmark_add_outlined)),
            onPressed: () {
              setState(() {
                selected585 = !selected585;
                if (selected585 == true) {
                } else {}
              });
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            isVisible = !isVisible;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/584.jpeg"),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Visibility(
        visible: isVisible,
        child: Container(
          height: 40,
          color: audiobar,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(play585 ? Icons.pause : Icons.play_arrow),
                onPressed: () {
                  setState(() {
                    play585 = !play585;
                    if (play585 == true) {
                      showDialog<String>(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) => AlertDialog(
                          backgroundColor: Colors.amber,
                          title: Text(
                            'Notice :',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                  'Make sure you pause the audio before navigate or change to another page,'),
                              SizedBox(height: 10),
                              const Text(
                                  'This Application is still on development and it may have some error on it,'),
                              SizedBox(height: 10),
                              const Text(
                                  'It will cause an error if you navigate to another page without pause the audio,'),
                              SizedBox(height: 10),
                              const Text(
                                  'If that happen, only ways to stop it you need to close the app,'),
                              SizedBox(height: 10),
                              const Text(
                                  'Each pages has their own audio. You need to do the same thing in another page,'),
                              SizedBox(height: 10),
                              const Text('Sorry for the problem appear.'),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Text(
                                    'Thank You!!!',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.black),
                                onPressed: () {
                                  Navigator.pop(context, 'Cancel');
                                },
                                child: const Text('OK'))
                          ],
                        ),
                      );
                      _playFile();
                    } else {
                      _stopFile();
                    }
                  });
                },
              ),
              VerticalDivider(
                width: 15,
                color: Colors.white,
                thickness: 2,
                endIndent: 4,
                indent: 4,
              ),
              Text('Az Zahir',
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class P586 extends StatefulWidget {
  const P586({Key? key}) : super(key: key);

  @override
  State<P586> createState() => _P586State();
}

class _P586State extends State<P586> {
  AudioCache audioCache = AudioCache();
  PlayerState audioPlayerState = PlayerState.PAUSED;
  AudioPlayer audioPlayer = AudioPlayer();
  void _playFile() async {
    audioPlayer = await audioCache.play('585.mp3',
        stayAwake: true, mode: PlayerMode.MEDIA_PLAYER);
    // assign player here
  }

  void _stopFile() {
    audioPlayer.pause();
    // stop the file like this
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      extendBody: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
        ),
        title: Column(
          children: const [
            Text(
              "مَنْ أَنَا",
              style: TextStyle(fontFamily: 'Anton', letterSpacing: 4.0),
            ),
            Text(
              "Sholawat Man Ana",
              style: TextStyle(
                letterSpacing: 4.0,
                fontSize: 15,
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[850],
        actions: [
          IconButton(
            icon: GestureDetector(
                child: Icon(selected586
                    ? Icons.bookmark
                    : Icons.bookmark_add_outlined)),
            onPressed: () {
              setState(() {
                selected586 = !selected586;
                if (selected586 == true) {
                } else {}
              });
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            isVisible = !isVisible;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/585.jpeg"),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Visibility(
        visible: isVisible,
        child: Container(
          height: 40,
          color: audiobar,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(play586 ? Icons.pause : Icons.play_arrow),
                onPressed: () {
                  setState(() {
                    play586 = !play586;
                    if (play586 == true) {
                      showDialog<String>(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) => AlertDialog(
                          backgroundColor: Colors.amber,
                          title: Text(
                            'Notice :',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                  'Make sure you pause the audio before navigate or change to another page,'),
                              SizedBox(height: 10),
                              const Text(
                                  'This Application is still on development and it may have some error on it,'),
                              SizedBox(height: 10),
                              const Text(
                                  'It will cause an error if you navigate to another page without pause the audio,'),
                              SizedBox(height: 10),
                              const Text(
                                  'If that happen, only ways to stop it you need to close the app,'),
                              SizedBox(height: 10),
                              const Text(
                                  'Each pages has their own audio. You need to do the same thing in another page,'),
                              SizedBox(height: 10),
                              const Text('Sorry for the problem appear.'),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Text(
                                    'Thank You!!!',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.black),
                                onPressed: () {
                                  Navigator.pop(context, 'Cancel');
                                },
                                child: const Text('OK'))
                          ],
                        ),
                      );
                      _playFile();
                    } else {
                      _stopFile();
                    }
                  });
                },
              ),
              VerticalDivider(
                width: 15,
                color: Colors.white,
                thickness: 2,
                endIndent: 4,
                indent: 4,
              ),
              Text('Az Zahir',
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class P587 extends StatefulWidget {
  const P587({Key? key}) : super(key: key);

  @override
  State<P587> createState() => _P587State();
}

class _P587State extends State<P587> {
  AudioCache audioCache = AudioCache();
  PlayerState audioPlayerState = PlayerState.PAUSED;
  AudioPlayer audioPlayer = AudioPlayer();
  void _playFile() async {
    audioPlayer = await audioCache.play('587.mp3',
        stayAwake: true, mode: PlayerMode.MEDIA_PLAYER);
    // assign player here
  }

  void _stopFile() {
    audioPlayer.pause();
    // stop the file like this
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      extendBody: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
        ),
        title: Column(
          children: const [
            Text(
              "ا ربي أنت الهادي",
              style: TextStyle(fontFamily: 'Anton', letterSpacing: 4.0),
            ),
            Text(
              "Sholawat Ya Robbi Antalhadi",
              style: TextStyle(
                letterSpacing: 4.0,
                fontSize: 15,
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[850],
        actions: [
          IconButton(
            icon: GestureDetector(
                child: Icon(selected587
                    ? Icons.bookmark
                    : Icons.bookmark_add_outlined)),
            onPressed: () {
              setState(() {
                selected587 = !selected587;
                if (selected587 == true) {
                } else {}
              });
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            isVisible = !isVisible;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/587.jpeg"),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Visibility(
        visible: isVisible,
        child: Container(
          height: 40,
          color: audiobar,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(play587 ? Icons.pause : Icons.play_arrow),
                onPressed: () {
                  setState(() {
                    play587 = !play587;
                    if (play587 == true) {
                      showDialog<String>(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) => AlertDialog(
                          backgroundColor: Colors.amber,
                          title: Text(
                            'Notice :',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                  'Make sure you pause the audio before navigate or change to another page,'),
                              SizedBox(height: 10),
                              const Text(
                                  'This Application is still on development and it may have some error on it,'),
                              SizedBox(height: 10),
                              const Text(
                                  'It will cause an error if you navigate to another page without pause the audio,'),
                              SizedBox(height: 10),
                              const Text(
                                  'If that happen, only ways to stop it you need to close the app,'),
                              SizedBox(height: 10),
                              const Text(
                                  'Each pages has their own audio. You need to do the same thing in another page,'),
                              SizedBox(height: 10),
                              const Text('Sorry for the problem appear.'),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Text(
                                    'Thank You!!!',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.black),
                                onPressed: () {
                                  Navigator.pop(context, 'Cancel');
                                },
                                child: const Text('OK'))
                          ],
                        ),
                      );
                      _playFile();
                    } else {
                      _stopFile();
                    }
                  });
                },
              ),
              VerticalDivider(
                width: 15,
                color: Colors.white,
                thickness: 2,
                endIndent: 4,
                indent: 4,
              ),
              Text('Az Zahir',
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class P588 extends StatefulWidget {
  const P588({Key? key}) : super(key: key);

  @override
  State<P588> createState() => _P588State();
}

class _P588State extends State<P588> {
  AudioCache audioCache = AudioCache();
  PlayerState audioPlayerState = PlayerState.PAUSED;
  AudioPlayer audioPlayer = AudioPlayer();
  void _playFile() async {
    audioPlayer = await audioCache.play('588.mp3',
        stayAwake: true, mode: PlayerMode.MEDIA_PLAYER);
    // assign player here
  }

  void _stopFile() {
    audioPlayer.pause();
    // stop the file like this
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      extendBody: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
        ),
        title: Column(
          children: const [
            Text(
              "Surah Al-Mutaffifin",
              style: TextStyle(fontFamily: 'Anton', letterSpacing: 2.0),
            ),
            Text(
              "Page 588,Juzuk 30",
              style: TextStyle(
                letterSpacing: 4.0,
                fontSize: 15,
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[850],
        actions: [
          IconButton(
            icon: GestureDetector(
                child: Icon(selected588
                    ? Icons.bookmark
                    : Icons.bookmark_add_outlined)),
            onPressed: () {
              setState(() {
                selected588 = !selected588;
                if (selected588 == true) {
                } else {}
              });
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            isVisible = !isVisible;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/588.jpeg"),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Visibility(
        visible: isVisible,
        child: Container(
          height: 40,
          color: audiobar,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(play588 ? Icons.pause : Icons.play_arrow),
                onPressed: () {
                  setState(() {
                    play588 = !play588;
                    if (play588 == true) {
                      showDialog<String>(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) => AlertDialog(
                          backgroundColor: Colors.amber,
                          title: Text(
                            'Notice :',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                  'Make sure you pause the audio before navigate or change to another page,'),
                              SizedBox(height: 10),
                              const Text(
                                  'This Application is still on development and it may have some error on it,'),
                              SizedBox(height: 10),
                              const Text(
                                  'It will cause an error if you navigate to another page without pause the audio,'),
                              SizedBox(height: 10),
                              const Text(
                                  'If that happen, only ways to stop it you need to close the app,'),
                              SizedBox(height: 10),
                              const Text(
                                  'Each pages has their own audio. You need to do the same thing in another page,'),
                              SizedBox(height: 10),
                              const Text('Sorry for the problem appear.'),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Text(
                                    'Thank You!!!',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.black),
                                onPressed: () {
                                  Navigator.pop(context, 'Cancel');
                                },
                                child: const Text('OK'))
                          ],
                        ),
                      );
                      _playFile();
                    } else {
                      _stopFile();
                    }
                  });
                },
              ),
              VerticalDivider(
                width: 15,
                color: Colors.white,
                thickness: 2,
                endIndent: 4,
                indent: 4,
              ),
              Text('Az Zahir',
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class P589 extends StatefulWidget {
  const P589({Key? key}) : super(key: key);

  @override
  State<P589> createState() => _P589State();
}

class _P589State extends State<P589> {
  AudioCache audioCache = AudioCache();
  PlayerState audioPlayerState = PlayerState.PAUSED;
  AudioPlayer audioPlayer = AudioPlayer();
  void _playFile() async {
    audioPlayer = await audioCache.play('589.mp3',
        stayAwake: true, mode: PlayerMode.MEDIA_PLAYER);
    // assign player here
  }

  void _stopFile() {
    audioPlayer.pause();
    // stop the file like this
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      extendBody: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
        ),
        title: Column(
          children: const [
            Text(
              "Surah Al-Inshiqaq",
              style: TextStyle(fontFamily: 'Anton', letterSpacing: 4.0),
            ),
            Text(
              "Page 589,Juzuk 30",
              style: TextStyle(
                letterSpacing: 4.0,
                fontSize: 15,
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[850],
        actions: [
          IconButton(
            icon: GestureDetector(
                child: Icon(selected589
                    ? Icons.bookmark
                    : Icons.bookmark_add_outlined)),
            onPressed: () {
              setState(() {
                selected589 = !selected589;
                if (selected589 == true) {
                } else {}
              });
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            isVisible = !isVisible;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/589.jpeg"),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Visibility(
        visible: isVisible,
        child: Container(
          height: 40,
          color: audiobar,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(play589 ? Icons.pause : Icons.play_arrow),
                onPressed: () {
                  setState(() {
                    play589 = !play589;
                    if (play589 == true) {
                      showDialog<String>(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) => AlertDialog(
                          backgroundColor: Colors.amber,
                          title: Text(
                            'Notice :',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                  'Make sure you pause the audio before navigate or change to another page,'),
                              SizedBox(height: 10),
                              const Text(
                                  'This Application is still on development and it may have some error on it,'),
                              SizedBox(height: 10),
                              const Text(
                                  'It will cause an error if you navigate to another page without pause the audio,'),
                              SizedBox(height: 10),
                              const Text(
                                  'If that happen, only ways to stop it you need to close the app,'),
                              SizedBox(height: 10),
                              const Text(
                                  'Each pages has their own audio. You need to do the same thing in another page,'),
                              SizedBox(height: 10),
                              const Text('Sorry for the problem appear.'),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Text(
                                    'Thank You!!!',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.black),
                                onPressed: () {
                                  Navigator.pop(context, 'Cancel');
                                },
                                child: const Text('OK'))
                          ],
                        ),
                      );
                      _playFile();
                    } else {
                      _stopFile();
                    }
                  });
                },
              ),
              VerticalDivider(
                width: 15,
                color: Colors.white,
                thickness: 2,
                endIndent: 4,
                indent: 4,
              ),
              Text('Az Zahir',
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class P590 extends StatefulWidget {
  const P590({Key? key}) : super(key: key);

  @override
  State<P590> createState() => _P590State();
}

class _P590State extends State<P590> {
  AudioCache audioCache = AudioCache();
  PlayerState audioPlayerState = PlayerState.PAUSED;
  AudioPlayer audioPlayer = AudioPlayer();
  void _playFile() async {
    audioPlayer = await audioCache.play('590.mp3',
        stayAwake: true, mode: PlayerMode.MEDIA_PLAYER);
    // assign player here
  }

  void _stopFile() {
    audioPlayer.pause();
    // stop the file like this
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      extendBody: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
        ),
        title: Column(
          children: const [
            Text(
              "Surah Al-Buruj",
              style: TextStyle(fontFamily: 'Anton', letterSpacing: 4.0),
            ),
            Text(
              "Page 590,Juzuk 30",
              style: TextStyle(
                letterSpacing: 4.0,
                fontSize: 15,
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[850],
        actions: [
          IconButton(
            icon: GestureDetector(
                child: Icon(selected590
                    ? Icons.bookmark
                    : Icons.bookmark_add_outlined)),
            onPressed: () {
              setState(() {
                selected590 = !selected590;
                if (selected590 == true) {
                } else {}
              });
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            isVisible = !isVisible;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/590.jpeg"),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Visibility(
        visible: isVisible,
        child: Container(
          height: 40,
          color: audiobar,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(play590 ? Icons.pause : Icons.play_arrow),
                onPressed: () {
                  setState(() {
                    play590 = !play590;
                    if (play590 == true) {
                      showDialog<String>(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) => AlertDialog(
                          backgroundColor: Colors.amber,
                          title: Text(
                            'Notice :',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                  'Make sure you pause the audio before navigate or change to another page,'),
                              SizedBox(height: 10),
                              const Text(
                                  'This Application is still on development and it may have some error on it,'),
                              SizedBox(height: 10),
                              const Text(
                                  'It will cause an error if you navigate to another page without pause the audio,'),
                              SizedBox(height: 10),
                              const Text(
                                  'If that happen, only ways to stop it you need to close the app,'),
                              SizedBox(height: 10),
                              const Text(
                                  'Each pages has their own audio. You need to do the same thing in another page,'),
                              SizedBox(height: 10),
                              const Text('Sorry for the problem appear.'),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Text(
                                    'Thank You!!!',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.black),
                                onPressed: () {
                                  Navigator.pop(context, 'Cancel');
                                },
                                child: const Text('OK'))
                          ],
                        ),
                      );
                      _playFile();
                    } else {
                      _stopFile();
                    }
                  });
                },
              ),
              VerticalDivider(
                width: 15,
                color: Colors.white,
                thickness: 2,
                endIndent: 4,
                indent: 4,
              ),
              Text('Az Zahir',
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class P591 extends StatefulWidget {
  const P591({Key? key}) : super(key: key);

  @override
  State<P591> createState() => _P591State();
}

class _P591State extends State<P591> {
  AudioCache audioCache = AudioCache();
  PlayerState audioPlayerState = PlayerState.PAUSED;
  AudioPlayer audioPlayer = AudioPlayer();
  void _playFile() async {
    audioPlayer = await audioCache.play('591.mp3',
        stayAwake: true, mode: PlayerMode.MEDIA_PLAYER);
    // assign player here
  }

  void _stopFile() {
    audioPlayer.pause();
    // stop the file like this
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      extendBody: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
        ),
        title: Column(
          children: const [
            Text(
              "Surah At-Tariq",
              style: TextStyle(fontFamily: 'Anton', letterSpacing: 4.0),
            ),
            Text(
              "Page 591,Juzuk 30",
              style: TextStyle(
                letterSpacing: 4.0,
                fontSize: 15,
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[850],
        actions: [
          IconButton(
            icon: GestureDetector(
                child: Icon(selected591
                    ? Icons.bookmark
                    : Icons.bookmark_add_outlined)),
            onPressed: () {
              setState(() {
                selected591 = !selected591;
                if (selected591 == true) {
                } else {}
              });
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            isVisible = !isVisible;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/591.jpeg"),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Visibility(
        visible: isVisible,
        child: Container(
          height: 40,
          color: audiobar,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(play591 ? Icons.pause : Icons.play_arrow),
                onPressed: () {
                  setState(() {
                    play591 = !play591;
                    if (play591 == true) {
                      showDialog<String>(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) => AlertDialog(
                          backgroundColor: Colors.amber,
                          title: Text(
                            'Notice :',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                  'Make sure you pause the audio before navigate or change to another page,'),
                              SizedBox(height: 10),
                              const Text(
                                  'This Application is still on development and it may have some error on it,'),
                              SizedBox(height: 10),
                              const Text(
                                  'It will cause an error if you navigate to another page without pause the audio,'),
                              SizedBox(height: 10),
                              const Text(
                                  'If that happen, only ways to stop it you need to close the app,'),
                              SizedBox(height: 10),
                              const Text(
                                  'Each pages has their own audio. You need to do the same thing in another page,'),
                              SizedBox(height: 10),
                              const Text('Sorry for the problem appear.'),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Text(
                                    'Thank You!!!',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.black),
                                onPressed: () {
                                  Navigator.pop(context, 'Cancel');
                                },
                                child: const Text('OK'))
                          ],
                        ),
                      );
                      _playFile();
                    } else {
                      _stopFile();
                    }
                  });
                },
              ),
              VerticalDivider(
                width: 15,
                color: Colors.white,
                thickness: 2,
                endIndent: 4,
                indent: 4,
              ),
              Text('Az Zahir',
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class P592 extends StatefulWidget {
  const P592({Key? key}) : super(key: key);

  @override
  State<P592> createState() => _P592State();
}

class _P592State extends State<P592> {
  AudioCache audioCache = AudioCache();
  PlayerState audioPlayerState = PlayerState.PAUSED;
  AudioPlayer audioPlayer = AudioPlayer();
  void _playFile() async {
    audioPlayer = await audioCache.play('592.mp3',
        stayAwake: true, mode: PlayerMode.MEDIA_PLAYER);
    // assign player here
  }

  void _stopFile() {
    audioPlayer.pause();
    // stop the file like this
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      extendBody: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
        ),
        title: Column(
          children: const [
            Text(
              "Surah Al-Ghashiyah",
              style: TextStyle(fontFamily: 'Anton', letterSpacing: 3.0),
            ),
            Text(
              "Page 592,Juzuk 30",
              style: TextStyle(
                letterSpacing: 4.0,
                fontSize: 15,
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[850],
        actions: [
          IconButton(
            icon: GestureDetector(
                child: Icon(selected592
                    ? Icons.bookmark
                    : Icons.bookmark_add_outlined)),
            onPressed: () {
              setState(() {
                selected592 = !selected592;
                if (selected592 == true) {
                } else {}
              });
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            isVisible = !isVisible;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/592.jpeg"),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Visibility(
        visible: isVisible,
        child: Container(
          height: 40,
          color: audiobar,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(play592 ? Icons.pause : Icons.play_arrow),
                onPressed: () {
                  setState(() {
                    play592 = !play592;
                    if (play592 == true) {
                      showDialog<String>(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) => AlertDialog(
                          backgroundColor: Colors.amber,
                          title: Text(
                            'Notice :',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                  'Make sure you pause the audio before navigate or change to another page,'),
                              SizedBox(height: 10),
                              const Text(
                                  'This Application is still on development and it may have some error on it,'),
                              SizedBox(height: 10),
                              const Text(
                                  'It will cause an error if you navigate to another page without pause the audio,'),
                              SizedBox(height: 10),
                              const Text(
                                  'If that happen, only ways to stop it you need to close the app,'),
                              SizedBox(height: 10),
                              const Text(
                                  'Each pages has their own audio. You need to do the same thing in another page,'),
                              SizedBox(height: 10),
                              const Text('Sorry for the problem appear.'),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Text(
                                    'Thank You!!!',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.black),
                                onPressed: () {
                                  Navigator.pop(context, 'Cancel');
                                },
                                child: const Text('OK'))
                          ],
                        ),
                      );
                      _playFile();
                    } else {
                      _stopFile();
                    }
                  });
                },
              ),
              VerticalDivider(
                width: 15,
                color: Colors.white,
                thickness: 2,
                endIndent: 4,
                indent: 4,
              ),
              Text('Az Zahir',
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class P593 extends StatefulWidget {
  const P593({Key? key}) : super(key: key);

  @override
  State<P593> createState() => _P593State();
}

class _P593State extends State<P593> {
  AudioCache audioCache = AudioCache();
  PlayerState audioPlayerState = PlayerState.PAUSED;
  AudioPlayer audioPlayer = AudioPlayer();
  void _playFile() async {
    audioPlayer = await audioCache.play('593.mp3',
        stayAwake: true, mode: PlayerMode.MEDIA_PLAYER);
    // assign player here
  }

  void _stopFile() {
    audioPlayer.pause();
    // stop the file like this
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      extendBody: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
        ),
        title: Column(
          children: const [
            Text(
              "Surah Al-Fajr",
              style: TextStyle(fontFamily: 'Anton', letterSpacing: 4.0),
            ),
            Text(
              "Page 593,Juzuk 30",
              style: TextStyle(
                letterSpacing: 4.0,
                fontSize: 15,
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[850],
        actions: [
          IconButton(
            icon: GestureDetector(
                child: Icon(selected593
                    ? Icons.bookmark
                    : Icons.bookmark_add_outlined)),
            onPressed: () {
              setState(() {
                selected593 = !selected593;
                if (selected593 == true) {
                } else {}
              });
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            isVisible = !isVisible;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/593.jpeg"),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Visibility(
        visible: isVisible,
        child: Container(
          height: 40,
          color: audiobar,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(play593 ? Icons.pause : Icons.play_arrow),
                onPressed: () {
                  setState(() {
                    play593 = !play593;
                    if (play593 == true) {
                      showDialog<String>(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) => AlertDialog(
                          backgroundColor: Colors.amber,
                          title: Text(
                            'Notice :',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                  'Make sure you pause the audio before navigate or change to another page,'),
                              SizedBox(height: 10),
                              const Text(
                                  'This Application is still on development and it may have some error on it,'),
                              SizedBox(height: 10),
                              const Text(
                                  'It will cause an error if you navigate to another page without pause the audio,'),
                              SizedBox(height: 10),
                              const Text(
                                  'If that happen, only ways to stop it you need to close the app,'),
                              SizedBox(height: 10),
                              const Text(
                                  'Each pages has their own audio. You need to do the same thing in another page,'),
                              SizedBox(height: 10),
                              const Text('Sorry for the problem appear.'),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Text(
                                    'Thank You!!!',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.black),
                                onPressed: () {
                                  Navigator.pop(context, 'Cancel');
                                },
                                child: const Text('OK'))
                          ],
                        ),
                      );
                      _playFile();
                    } else {
                      _stopFile();
                    }
                  });
                },
              ),
              VerticalDivider(
                width: 15,
                color: Colors.white,
                thickness: 2,
                endIndent: 4,
                indent: 4,
              ),
              Text('Az Zahir',
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class P594 extends StatefulWidget {
  const P594({Key? key}) : super(key: key);

  @override
  State<P594> createState() => _P594State();
}

class _P594State extends State<P594> {
  AudioCache audioCache = AudioCache();
  PlayerState audioPlayerState = PlayerState.PAUSED;
  AudioPlayer audioPlayer = AudioPlayer();
  void _playFile() async {
    audioPlayer = await audioCache.play('594.mp3',
        stayAwake: true, mode: PlayerMode.MEDIA_PLAYER);
    // assign player here
  }

  void _stopFile() {
    audioPlayer.pause();
    // stop the file like this
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      extendBody: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
        ),
        title: Column(
          children: const [
            Text(
              "Surah Al-Balad",
              style: TextStyle(fontFamily: 'Anton', letterSpacing: 4.0),
            ),
            Text(
              "Page 594,Juzuk 30",
              style: TextStyle(
                letterSpacing: 4.0,
                fontSize: 15,
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[850],
        actions: [
          IconButton(
            icon: GestureDetector(
                child: Icon(selected594
                    ? Icons.bookmark
                    : Icons.bookmark_add_outlined)),
            onPressed: () {
              setState(() {
                selected594 = !selected594;
                if (selected594 == true) {
                } else {}
              });
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            isVisible = !isVisible;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/594.jpeg"),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Visibility(
        visible: isVisible,
        child: Container(
          height: 40,
          color: audiobar,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(play594 ? Icons.pause : Icons.play_arrow),
                onPressed: () {
                  setState(() {
                    play594 = !play594;
                    if (play594 == true) {
                      showDialog<String>(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) => AlertDialog(
                          backgroundColor: Colors.amber,
                          title: Text(
                            'Notice :',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                  'Make sure you pause the audio before navigate or change to another page,'),
                              SizedBox(height: 10),
                              const Text(
                                  'This Application is still on development and it may have some error on it,'),
                              SizedBox(height: 10),
                              const Text(
                                  'It will cause an error if you navigate to another page without pause the audio,'),
                              SizedBox(height: 10),
                              const Text(
                                  'If that happen, only ways to stop it you need to close the app,'),
                              SizedBox(height: 10),
                              const Text(
                                  'Each pages has their own audio. You need to do the same thing in another page,'),
                              SizedBox(height: 10),
                              const Text('Sorry for the problem appear.'),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Text(
                                    'Thank You!!!',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.black),
                                onPressed: () {
                                  Navigator.pop(context, 'Cancel');
                                },
                                child: const Text('OK'))
                          ],
                        ),
                      );
                      _playFile();
                    } else {
                      _stopFile();
                    }
                  });
                },
              ),
              VerticalDivider(
                width: 15,
                color: Colors.white,
                thickness: 2,
                endIndent: 4,
                indent: 4,
              ),
              Text('Az Zahir',
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class P595 extends StatefulWidget {
  const P595({Key? key}) : super(key: key);

  @override
  State<P595> createState() => _P595State();
}

class _P595State extends State<P595> {
  AudioCache audioCache = AudioCache();
  PlayerState audioPlayerState = PlayerState.PAUSED;
  AudioPlayer audioPlayer = AudioPlayer();
  void _playFile() async {
    audioPlayer = await audioCache.play('595.mp3',
        stayAwake: true, mode: PlayerMode.MEDIA_PLAYER);
    // assign player here
  }

  void _stopFile() {
    audioPlayer.pause();
    // stop the file like this
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      extendBody: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
        ),
        title: Column(
          children: const [
            Text(
              "Surah Ash-Shams",
              style: TextStyle(fontFamily: 'Anton', letterSpacing: 4.0),
            ),
            Text(
              "Page 595,Juzuk 30",
              style: TextStyle(
                letterSpacing: 4.0,
                fontSize: 15,
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[850],
        actions: [
          IconButton(
            icon: GestureDetector(
                child: Icon(selected595
                    ? Icons.bookmark
                    : Icons.bookmark_add_outlined)),
            onPressed: () {
              setState(() {
                selected595 = !selected595;
                if (selected595 == true) {
                } else {}
              });
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            isVisible = !isVisible;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/595.jpeg"),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Visibility(
        visible: isVisible,
        child: Container(
          height: 40,
          color: audiobar,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(play595 ? Icons.pause : Icons.play_arrow),
                onPressed: () {
                  setState(() {
                    play595 = !play595;
                    if (play595 == true) {
                      showDialog<String>(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) => AlertDialog(
                          backgroundColor: Colors.amber,
                          title: Text(
                            'Notice :',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                  'Make sure you pause the audio before navigate or change to another page,'),
                              SizedBox(height: 10),
                              const Text(
                                  'This Application is still on development and it may have some error on it,'),
                              SizedBox(height: 10),
                              const Text(
                                  'It will cause an error if you navigate to another page without pause the audio,'),
                              SizedBox(height: 10),
                              const Text(
                                  'If that happen, only ways to stop it you need to close the app,'),
                              SizedBox(height: 10),
                              const Text(
                                  'Each pages has their own audio. You need to do the same thing in another page,'),
                              SizedBox(height: 10),
                              const Text('Sorry for the problem appear.'),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Text(
                                    'Thank You!!!',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.black),
                                onPressed: () {
                                  Navigator.pop(context, 'Cancel');
                                },
                                child: const Text('OK'))
                          ],
                        ),
                      );
                      _playFile();
                    } else {
                      _stopFile();
                    }
                  });
                },
              ),
              VerticalDivider(
                width: 15,
                color: Colors.white,
                thickness: 2,
                endIndent: 4,
                indent: 4,
              ),
              Text('Az Zahir',
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class P596 extends StatefulWidget {
  const P596({Key? key}) : super(key: key);

  @override
  State<P596> createState() => _P596State();
}

class _P596State extends State<P596> {
  AudioCache audioCache = AudioCache();
  PlayerState audioPlayerState = PlayerState.PAUSED;
  AudioPlayer audioPlayer = AudioPlayer();
  void _playFile() async {
    audioPlayer = await audioCache.play('596.mp3',
        stayAwake: true, mode: PlayerMode.MEDIA_PLAYER);
    // assign player here
  }

  void _stopFile() {
    audioPlayer.pause();
    // stop the file like this
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      extendBody: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
        ),
        title: Column(
          children: const [
            Text(
              "Surah Ad-Dhuha",
              style: TextStyle(fontFamily: 'Anton', letterSpacing: 4.0),
            ),
            Text(
              "Page 596,Juzuk 30",
              style: TextStyle(
                letterSpacing: 4.0,
                fontSize: 15,
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[850],
        actions: [
          IconButton(
            icon: GestureDetector(
                child: Icon(selected596
                    ? Icons.bookmark
                    : Icons.bookmark_add_outlined)),
            onPressed: () {
              setState(() {
                selected596 = !selected596;
                if (selected596 == true) {
                } else {}
              });
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            isVisible = !isVisible;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/596.jpeg"),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Visibility(
        visible: isVisible,
        child: Container(
          height: 40,
          color: audiobar,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(play596 ? Icons.pause : Icons.play_arrow),
                onPressed: () {
                  setState(() {
                    play596 = !play596;
                    if (play596 == true) {
                      showDialog<String>(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) => AlertDialog(
                          backgroundColor: Colors.amber,
                          title: Text(
                            'Notice :',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                  'Make sure you pause the audio before navigate or change to another page,'),
                              SizedBox(height: 10),
                              const Text(
                                  'This Application is still on development and it may have some error on it,'),
                              SizedBox(height: 10),
                              const Text(
                                  'It will cause an error if you navigate to another page without pause the audio,'),
                              SizedBox(height: 10),
                              const Text(
                                  'If that happen, only ways to stop it you need to close the app,'),
                              SizedBox(height: 10),
                              const Text(
                                  'Each pages has their own audio. You need to do the same thing in another page,'),
                              SizedBox(height: 10),
                              const Text('Sorry for the problem appear.'),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Text(
                                    'Thank You!!!',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.black),
                                onPressed: () {
                                  Navigator.pop(context, 'Cancel');
                                },
                                child: const Text('OK'))
                          ],
                        ),
                      );
                      _playFile();
                    } else {
                      _stopFile();
                    }
                  });
                },
              ),
              VerticalDivider(
                width: 15,
                color: Colors.white,
                thickness: 2,
                endIndent: 4,
                indent: 4,
              ),
              Text('Az Zahir',
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class P597 extends StatefulWidget {
  const P597({Key? key}) : super(key: key);

  @override
  State<P597> createState() => _P597State();
}

class _P597State extends State<P597> {
  AudioCache audioCache = AudioCache();
  PlayerState audioPlayerState = PlayerState.PAUSED;
  AudioPlayer audioPlayer = AudioPlayer();
  void _playFile() async {
    audioPlayer = await audioCache.play('597.mp3',
        stayAwake: true, mode: PlayerMode.MEDIA_PLAYER);
    // assign player here
  }

  void _stopFile() {
    audioPlayer.pause();
    // stop the file like this
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      extendBody: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
        ),
        title: Column(
          children: const [
            Text(
              "Surah At-Tin",
              style: TextStyle(fontFamily: 'Anton', letterSpacing: 4.0),
            ),
            Text(
              "Page 597,Juzuk 30",
              style: TextStyle(
                letterSpacing: 4.0,
                fontSize: 15,
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[850],
        actions: [
          IconButton(
            icon: GestureDetector(
                child: Icon(selected597
                    ? Icons.bookmark
                    : Icons.bookmark_add_outlined)),
            onPressed: () {
              setState(() {
                selected597 = !selected597;
                if (selected597 == true) {
                } else {}
              });
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            isVisible = !isVisible;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/597.jpeg"),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Visibility(
        visible: isVisible,
        child: Container(
          height: 40,
          color: audiobar,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(play597 ? Icons.pause : Icons.play_arrow),
                onPressed: () {
                  setState(() {
                    play597 = !play597;
                    if (play597 == true) {
                      showDialog<String>(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) => AlertDialog(
                          backgroundColor: Colors.amber,
                          title: Text(
                            'Notice :',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                  'Make sure you pause the audio before navigate or change to another page,'),
                              SizedBox(height: 10),
                              const Text(
                                  'This Application is still on development and it may have some error on it,'),
                              SizedBox(height: 10),
                              const Text(
                                  'It will cause an error if you navigate to another page without pause the audio,'),
                              SizedBox(height: 10),
                              const Text(
                                  'If that happen, only ways to stop it you need to close the app,'),
                              SizedBox(height: 10),
                              const Text(
                                  'Each pages has their own audio. You need to do the same thing in another page,'),
                              SizedBox(height: 10),
                              const Text('Sorry for the problem appear.'),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Text(
                                    'Thank You!!!',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.black),
                                onPressed: () {
                                  Navigator.pop(context, 'Cancel');
                                },
                                child: const Text('OK'))
                          ],
                        ),
                      );
                      _playFile();
                    } else {
                      _stopFile();
                    }
                  });
                },
              ),
              VerticalDivider(
                width: 15,
                color: Colors.white,
                thickness: 2,
                endIndent: 4,
                indent: 4,
              ),
              Text('Az Zahir',
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class P598 extends StatefulWidget {
  const P598({Key? key}) : super(key: key);

  @override
  State<P598> createState() => _P598State();
}

class _P598State extends State<P598> {
  AudioCache audioCache = AudioCache();
  PlayerState audioPlayerState = PlayerState.PAUSED;
  AudioPlayer audioPlayer = AudioPlayer();
  void _playFile() async {
    audioPlayer = await audioCache.play('598.mp3',
        stayAwake: true, mode: PlayerMode.MEDIA_PLAYER);
    // assign player here
  }

  void _stopFile() {
    audioPlayer.pause();
    // stop the file like this
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      extendBody: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
        ),
        title: Column(
          children: const [
            Text(
              "Surah Al-Qadr",
              style: TextStyle(fontFamily: 'Anton', letterSpacing: 4.0),
            ),
            Text(
              "Page 598,Juzuk 30",
              style: TextStyle(
                letterSpacing: 4.0,
                fontSize: 15,
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[850],
        actions: [
          IconButton(
            icon: GestureDetector(
                child: Icon(selected598
                    ? Icons.bookmark
                    : Icons.bookmark_add_outlined)),
            onPressed: () {
              setState(() {
                selected598 = !selected598;
                if (selected598 == true) {
                } else {}
              });
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            isVisible = !isVisible;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/598.jpeg"),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Visibility(
        visible: isVisible,
        child: Container(
          height: 40,
          color: audiobar,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(play598 ? Icons.pause : Icons.play_arrow),
                onPressed: () {
                  setState(() {
                    play598 = !play598;
                    if (play598 == true) {
                      showDialog<String>(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) => AlertDialog(
                          backgroundColor: Colors.amber,
                          title: Text(
                            'Notice :',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                  'Make sure you pause the audio before navigate or change to another page,'),
                              SizedBox(height: 10),
                              const Text(
                                  'This Application is still on development and it may have some error on it,'),
                              SizedBox(height: 10),
                              const Text(
                                  'It will cause an error if you navigate to another page without pause the audio,'),
                              SizedBox(height: 10),
                              const Text(
                                  'If that happen, only ways to stop it you need to close the app,'),
                              SizedBox(height: 10),
                              const Text(
                                  'Each pages has their own audio. You need to do the same thing in another page,'),
                              SizedBox(height: 10),
                              const Text('Sorry for the problem appear.'),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Text(
                                    'Thank You!!!',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.black),
                                onPressed: () {
                                  Navigator.pop(context, 'Cancel');
                                },
                                child: const Text('OK'))
                          ],
                        ),
                      );
                      _playFile();
                    } else {
                      _stopFile();
                    }
                  });
                },
              ),
              VerticalDivider(
                width: 15,
                color: Colors.white,
                thickness: 2,
                endIndent: 4,
                indent: 4,
              ),
              Text('Az Zahir',
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class P599 extends StatefulWidget {
  const P599({Key? key}) : super(key: key);

  @override
  State<P599> createState() => _P599State();
}

class _P599State extends State<P599> {
  AudioCache audioCache = AudioCache();
  PlayerState audioPlayerState = PlayerState.PAUSED;
  AudioPlayer audioPlayer = AudioPlayer();
  void _playFile() async {
    audioPlayer = await audioCache.play('599.mp3',
        stayAwake: true, mode: PlayerMode.MEDIA_PLAYER);
    // assign player here
  }

  void _stopFile() {
    audioPlayer.pause();
    // stop the file like this
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      extendBody: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
        ),
        title: Column(
          children: const [
            Text(
              "Surah Az-Zalzalah",
              style: TextStyle(fontFamily: 'Anton', letterSpacing: 4.0),
            ),
            Text(
              "Page 599,Juzuk 30",
              style: TextStyle(
                letterSpacing: 4.0,
                fontSize: 15,
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[850],
        actions: [
          IconButton(
            icon: GestureDetector(
                child: Icon(selected599
                    ? Icons.bookmark
                    : Icons.bookmark_add_outlined)),
            onPressed: () {
              setState(() {
                selected599 = !selected599;
                if (selected599 == true) {
                } else {}
              });
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            isVisible = !isVisible;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/599.jpeg"),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Visibility(
        visible: isVisible,
        child: Container(
          height: 40,
          color: audiobar,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(play599 ? Icons.pause : Icons.play_arrow),
                onPressed: () {
                  setState(() {
                    play599 = !play599;
                    if (play599 == true) {
                      showDialog<String>(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) => AlertDialog(
                          backgroundColor: Colors.amber,
                          title: Text(
                            'Notice :',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                  'Make sure you pause the audio before navigate or change to another page,'),
                              SizedBox(height: 10),
                              const Text(
                                  'This Application is still on development and it may have some error on it,'),
                              SizedBox(height: 10),
                              const Text(
                                  'It will cause an error if you navigate to another page without pause the audio,'),
                              SizedBox(height: 10),
                              const Text(
                                  'If that happen, only ways to stop it you need to close the app,'),
                              SizedBox(height: 10),
                              const Text(
                                  'Each pages has their own audio. You need to do the same thing in another page,'),
                              SizedBox(height: 10),
                              const Text('Sorry for the problem appear.'),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Text(
                                    'Thank You!!!',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.black),
                                onPressed: () {
                                  Navigator.pop(context, 'Cancel');
                                },
                                child: const Text('OK'))
                          ],
                        ),
                      );
                      _playFile();
                    } else {
                      _stopFile();
                    }
                  });
                },
              ),
              VerticalDivider(
                width: 15,
                color: Colors.white,
                thickness: 2,
                endIndent: 4,
                indent: 4,
              ),
              Text('Az Zahir',
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class P600 extends StatefulWidget {
  const P600({Key? key}) : super(key: key);

  @override
  State<P600> createState() => _P600State();
}

class _P600State extends State<P600> {
  AudioCache audioCache = AudioCache();
  PlayerState audioPlayerState = PlayerState.PAUSED;
  AudioPlayer audioPlayer = AudioPlayer();
  void _playFile() async {
    audioPlayer = await audioCache.play('600.mp3',
        stayAwake: true, mode: PlayerMode.MEDIA_PLAYER);
    // assign player here
  }

  void _stopFile() {
    audioPlayer.pause();
    // stop the file like this
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      extendBody: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
        ),
        title: Column(
          children: const [
            Text(
              "Surah Al-Qari'ah",
              style: TextStyle(fontFamily: 'Anton', letterSpacing: 4.0),
            ),
            Text(
              "Page 600,Juzuk 30",
              style: TextStyle(
                letterSpacing: 4.0,
                fontSize: 15,
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[850],
        actions: [
          IconButton(
            icon: GestureDetector(
                child: Icon(selected600
                    ? Icons.bookmark
                    : Icons.bookmark_add_outlined)),
            onPressed: () {
              setState(() {
                selected600 = !selected600;
                if (selected600 == true) {
                } else {}
              });
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            isVisible = !isVisible;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/600.jpeg"),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Visibility(
        visible: isVisible,
        child: Container(
          height: 40,
          color: audiobar,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(play600 ? Icons.pause : Icons.play_arrow),
                onPressed: () {
                  setState(() {
                    play600 = !play600;
                    if (play600 == true) {
                      showDialog<String>(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) => AlertDialog(
                          backgroundColor: Colors.amber,
                          title: Text(
                            'Notice :',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                  'Make sure you pause the audio before navigate or change to another page,'),
                              SizedBox(height: 10),
                              const Text(
                                  'This Application is still on development and it may have some error on it,'),
                              SizedBox(height: 10),
                              const Text(
                                  'It will cause an error if you navigate to another page without pause the audio,'),
                              SizedBox(height: 10),
                              const Text(
                                  'If that happen, only ways to stop it you need to close the app,'),
                              SizedBox(height: 10),
                              const Text(
                                  'Each pages has their own audio. You need to do the same thing in another page,'),
                              SizedBox(height: 10),
                              const Text('Sorry for the problem appear.'),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Text(
                                    'Thank You!!!',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.black),
                                onPressed: () {
                                  Navigator.pop(context, 'Cancel');
                                },
                                child: const Text('OK'))
                          ],
                        ),
                      );
                      _playFile();
                    } else {
                      _stopFile();
                    }
                  });
                },
              ),
              VerticalDivider(
                width: 15,
                color: Colors.white,
                thickness: 2,
                endIndent: 4,
                indent: 4,
              ),
              Text('Az Zahir',
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class P601 extends StatefulWidget {
  const P601({Key? key}) : super(key: key);

  @override
  State<P601> createState() => _P601State();
}

class _P601State extends State<P601> {
  AudioCache audioCache = AudioCache();
  PlayerState audioPlayerState = PlayerState.PAUSED;
  AudioPlayer audioPlayer = AudioPlayer();
  void _playFile() async {
    audioPlayer = await audioCache.play('601.mp3',
        stayAwake: true, mode: PlayerMode.MEDIA_PLAYER);
    // assign player here
  }

  void _stopFile() {
    audioPlayer.pause();
    // stop the file like this
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      extendBody: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
        ),
        title: Column(
          children: const [
            Text(
              "Surah Al-Asr",
              style: TextStyle(fontFamily: 'Anton', letterSpacing: 4.0),
            ),
            Text(
              "Page 601,Juzuk 30",
              style: TextStyle(
                letterSpacing: 4.0,
                fontSize: 15,
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[850],
        actions: [
          IconButton(
            icon: GestureDetector(
                child: Icon(selected601
                    ? Icons.bookmark
                    : Icons.bookmark_add_outlined)),
            onPressed: () {
              setState(() {
                selected601 = !selected601;
                if (selected601 == true) {
                } else {}
              });
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            isVisible = !isVisible;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/601.jpeg"),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Visibility(
        visible: isVisible,
        child: Container(
          height: 40,
          color: audiobar,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(play601 ? Icons.pause : Icons.play_arrow),
                onPressed: () {
                  setState(() {
                    play601 = !play601;
                    if (play601 == true) {
                      showDialog<String>(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) => AlertDialog(
                          backgroundColor: Colors.amber,
                          title: Text(
                            'Notice :',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                  'Make sure you pause the audio before navigate or change to another page,'),
                              SizedBox(height: 10),
                              const Text(
                                  'This Application is still on development and it may have some error on it,'),
                              SizedBox(height: 10),
                              const Text(
                                  'It will cause an error if you navigate to another page without pause the audio,'),
                              SizedBox(height: 10),
                              const Text(
                                  'If that happen, only ways to stop it you need to close the app,'),
                              SizedBox(height: 10),
                              const Text(
                                  'Each pages has their own audio. You need to do the same thing in another page,'),
                              SizedBox(height: 10),
                              const Text('Sorry for the problem appear.'),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Text(
                                    'Thank You!!!',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.black),
                                onPressed: () {
                                  Navigator.pop(context, 'Cancel');
                                },
                                child: const Text('OK'))
                          ],
                        ),
                      );
                      _playFile();
                    } else {
                      _stopFile();
                    }
                  });
                },
              ),
              VerticalDivider(
                width: 15,
                color: Colors.white,
                thickness: 2,
                endIndent: 4,
                indent: 4,
              ),
              Text('Az Zahir',
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class P602 extends StatefulWidget {
  const P602({Key? key}) : super(key: key);

  @override
  State<P602> createState() => _P602State();
}

class _P602State extends State<P602> {
  AudioCache audioCache = AudioCache();
  PlayerState audioPlayerState = PlayerState.PAUSED;
  AudioPlayer audioPlayer = AudioPlayer();
  void _playFile() async {
    audioPlayer = await audioCache.play('602.mp3',
        stayAwake: true, mode: PlayerMode.MEDIA_PLAYER);
    // assign player here
  }

  void _stopFile() {
    audioPlayer.pause();
    // stop the file like this
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      extendBody: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
        ),
        title: Column(
          children: const [
            Text(
              "Surah Al-Quraysh",
              style: TextStyle(fontFamily: 'Anton', letterSpacing: 4.0),
            ),
            Text(
              "Page 602,Juzuk 30",
              style: TextStyle(
                letterSpacing: 4.0,
                fontSize: 15,
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[850],
        actions: [
          IconButton(
            icon: GestureDetector(
                child: Icon(selected602
                    ? Icons.bookmark
                    : Icons.bookmark_add_outlined)),
            onPressed: () {
              setState(() {
                selected602 = !selected602;
                if (selected602 == true) {
                } else {}
              });
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            isVisible = !isVisible;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/602.jpeg"),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Visibility(
        visible: isVisible,
        child: Container(
          height: 40,
          color: audiobar,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(play602 ? Icons.pause : Icons.play_arrow),
                onPressed: () {
                  setState(() {
                    play602 = !play602;
                    if (play602 == true) {
                      showDialog<String>(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) => AlertDialog(
                          backgroundColor: Colors.amber,
                          title: Text(
                            'Notice :',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                  'Make sure you pause the audio before navigate or change to another page,'),
                              SizedBox(height: 10),
                              const Text(
                                  'This Application is still on development and it may have some error on it,'),
                              SizedBox(height: 10),
                              const Text(
                                  'It will cause an error if you navigate to another page without pause the audio,'),
                              SizedBox(height: 10),
                              const Text(
                                  'If that happen, only ways to stop it you need to close the app,'),
                              SizedBox(height: 10),
                              const Text(
                                  'Each pages has their own audio. You need to do the same thing in another page,'),
                              SizedBox(height: 10),
                              const Text('Sorry for the problem appear.'),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Text(
                                    'Thank You!!!',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.black),
                                onPressed: () {
                                  Navigator.pop(context, 'Cancel');
                                },
                                child: const Text('OK'))
                          ],
                        ),
                      );
                      _playFile();
                    } else {
                      _stopFile();
                    }
                  });
                },
              ),
              VerticalDivider(
                width: 15,
                color: Colors.white,
                thickness: 2,
                endIndent: 4,
                indent: 4,
              ),
              Text('Az Zahir',
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class P603 extends StatefulWidget {
  const P603({Key? key}) : super(key: key);

  @override
  State<P603> createState() => _P603State();
}

class _P603State extends State<P603> {
  AudioCache audioCache = AudioCache();
  PlayerState audioPlayerState = PlayerState.PAUSED;
  AudioPlayer audioPlayer = AudioPlayer();
  void _playFile() async {
    audioPlayer = await audioCache.play('603.mp3',
        stayAwake: true, mode: PlayerMode.MEDIA_PLAYER);
    // assign player here
  }

  void _stopFile() {
    audioPlayer.pause();
    // stop the file like this
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      extendBody: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
        ),
        title: Column(
          children: const [
            Text(
              "Surah Al-Kafirun",
              style: TextStyle(fontFamily: 'Anton', letterSpacing: 4.0),
            ),
            Text(
              "Page 603,Juzuk 30",
              style: TextStyle(
                letterSpacing: 4.0,
                fontSize: 15,
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[850],
        actions: [
          IconButton(
            icon: GestureDetector(
                child: Icon(selected603
                    ? Icons.bookmark
                    : Icons.bookmark_add_outlined)),
            onPressed: () {
              setState(() {
                selected603 = !selected603;
                if (selected603 == true) {
                } else {}
              });
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            isVisible = !isVisible;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/603.jpeg"),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Visibility(
        visible: isVisible,
        child: Container(
          height: 40,
          color: audiobar,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(play603 ? Icons.pause : Icons.play_arrow),
                onPressed: () {
                  setState(() {
                    play603 = !play603;
                    if (play603 == true) {
                      showDialog<String>(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) => AlertDialog(
                          backgroundColor: Colors.amber,
                          title: Text(
                            'Notice :',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                  'Make sure you pause the audio before navigate or change to another page,'),
                              SizedBox(height: 10),
                              const Text(
                                  'This Application is still on development and it may have some error on it,'),
                              SizedBox(height: 10),
                              const Text(
                                  'It will cause an error if you navigate to another page without pause the audio,'),
                              SizedBox(height: 10),
                              const Text(
                                  'If that happen, only ways to stop it you need to close the app,'),
                              SizedBox(height: 10),
                              const Text(
                                  'Each pages has their own audio. You need to do the same thing in another page,'),
                              SizedBox(height: 10),
                              const Text('Sorry for the problem appear.'),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Text(
                                    'Thank You!!!',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.black),
                                onPressed: () {
                                  Navigator.pop(context, 'Cancel');
                                },
                                child: const Text('OK'))
                          ],
                        ),
                      );
                      _playFile();
                    } else {
                      _stopFile();
                    }
                  });
                },
              ),
              VerticalDivider(
                width: 15,
                color: Colors.white,
                thickness: 2,
                endIndent: 4,
                indent: 4,
              ),
              Text('Az Zahir',
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class P604 extends StatefulWidget {
  const P604({Key? key}) : super(key: key);

  @override
  State<P604> createState() => _P604State();
}

class _P604State extends State<P604> {
  AudioCache audioCache = AudioCache();
  PlayerState audioPlayerState = PlayerState.PAUSED;
  AudioPlayer audioPlayer = AudioPlayer();
  void _playFile() async {
    audioPlayer = await audioCache.play('604.mp3',
        stayAwake: true, mode: PlayerMode.MEDIA_PLAYER);
    // assign player here
  }

  void _stopFile() {
    audioPlayer.pause();
    // stop the file like this
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      extendBody: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
        ),
        title: Column(
          children: const [
            Text(
              "Surah Al-Ikhlas",
              style: TextStyle(fontFamily: 'Anton', letterSpacing: 4.0),
            ),
            Text(
              "Page 604,Juzuk 30",
              style: TextStyle(
                letterSpacing: 4.0,
                fontSize: 15,
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[850],
        actions: [
          IconButton(
            icon: GestureDetector(
                child: Icon(selected604
                    ? Icons.bookmark
                    : Icons.bookmark_add_outlined)),
            onPressed: () {
              setState(() {
                selected604 = !selected604;
                if (selected604 == true) {
                } else {}
              });
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            isVisible = !isVisible;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/604.jpeg"),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Visibility(
        visible: isVisible,
        child: Container(
          height: 40,
          color: audiobar,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(play604 ? Icons.pause : Icons.play_arrow),
                onPressed: () {
                  setState(() {
                    play604 = !play604;
                    if (play604 == true) {
                      showDialog<String>(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) => AlertDialog(
                          backgroundColor: Colors.amber,
                          title: Text('Notice :',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold)),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                  'Make sure you pause the audio before navigate or change to another page,'),
                              SizedBox(height: 10),
                              const Text(
                                  'This Application is still on development and it may have some error on it,'),
                              SizedBox(height: 10),
                              const Text(
                                  'It will cause an error if you navigate to another page without pause the audio,'),
                              SizedBox(height: 10),
                              const Text(
                                  'If that happen, only ways to stop it you need to close the app,'),
                              SizedBox(height: 10),
                              const Text(
                                  'Each pages has their own audio. You need to do the same thing in another page,'),
                              SizedBox(height: 10),
                              const Text('Sorry for the problem appear.'),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Text(
                                    'Thank You!!!',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.black),
                                onPressed: () {
                                  Navigator.pop(context, 'Cancel');
                                },
                                child: const Text('OK'))
                          ],
                        ),
                      );
                      _playFile();
                    } else {
                      _stopFile();
                    }
                  });
                },
              ),
              VerticalDivider(
                width: 15,
                color: Colors.white,
                thickness: 2,
                endIndent: 4,
                indent: 4,
              ),
              Text('Az Zahir',
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
