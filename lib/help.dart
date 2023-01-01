// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'var.dart';
import 'page.dart';

void main() => runApp(MaterialApp(
      home: Help(),
      title: 'Flutter',
      routes: {
        Pages.routeName: (context) => Pages(),
      },
    ));

class Help extends StatelessWidget {
  const Help({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgcolor,
        appBar: AppBar(
          title: Text(
            'Help',
            style: TextStyle(fontFamily: 'Anton', letterSpacing: 4.0),
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.grey[850],
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
          child: ListView(
            children: <Widget>[
              Text(
                'How do I play audio?',
                style: TextStyle(
                  color: commontext,
                  fontSize: 20,
                  letterSpacing: 5,
                  fontFamily: 'Anton',
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Open any Quran page. You need to click on page first and the audio bar will appear. At the bottom, you will notice a play button and click it to play the audio.',
                style: TextStyle(
                  color: commontext,
                  fontSize: 15,
                  letterSpacing: 3,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'How can I jump to certain page?',
                style: TextStyle(
                  color: commontext,
                  fontSize: 20,
                  letterSpacing: 5,
                  fontFamily: 'Anton',
                ),
              ),
              SizedBox(height: 10),
              Text(
                'At the top left of the app, there is a sidebar button and click it. It will show a list of items and click search and a prompt box will pop up and put the page you want. The page still count as index number which means start from 0 until 22 for Juz Amma only.',
                style: TextStyle(
                  color: commontext,
                  fontSize: 15,
                  letterSpacing: 3,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'How do bookmark a page?',
                style: TextStyle(
                  color: commontext,
                  fontSize: 20,
                  letterSpacing: 5,
                  fontFamily: 'Anton',
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Open any Quran page. At the top right of the page, there is a bookmark button and you can click on it to bookmark the page you want.Then, you can open the sidebar and click the bookmark button to see your bookmarks',
                style: TextStyle(
                  color: commontext,
                  fontSize: 15,
                  letterSpacing: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Bookmark extends StatefulWidget {
  const Bookmark({Key? key}) : super(key: key);

  @override
  _BookmarkState createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  List<Widget> marking = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        title: Text(
          'Bookmark',
          style: TextStyle(fontFamily: 'Anton', letterSpacing: 4.0),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[850],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     setState(() {
      //     });
      //   },
      //   child: Icon(Icons.add),
      //   backgroundColor: Colors.amber,
      // ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
        child: ListView(
          children: [
            callBookmark(),
            callBookmark(),
          ],
        ),
      ),
    );
  }

  callBookmark() {
    var array = [
      selected582,
      selected583,
      selected584,
      selected585,
      selected586,
      selected587,
      selected588,
      selected589,
      selected590,
      selected591,
      selected592,
      selected593,
      selected594,
      selected595,
      selected596,
      selected597,
      selected598,
      selected599,
      selected600,
      selected601,
      selected602,
      selected603,
      selected604
    ];

    var start2 = 581;
    // List<Widget> marking = [];
    for (var i = 0; i < array.length; i++) {
      start2 += 1;
      if (array[i] == true) {
        // marking = [
        return bookmark(
          icon: Icons.bookmark,
          text: 'Juzuk 30',
          text2: i,
          number: start2,
          onPressed: () {
            Navigator.pushNamed(
              context,
              Pages.routeName,
              arguments: ScreenArguments(i),
            );
          },
        );
        // ];
      }
      // return marking;
    }
    return Center(
      child: Text(
        'No Bookmark Yet',
        style: TextStyle(
          color: commontext,
          fontSize: marktextsize,
        ),
      ),
    );
  }
}

Widget bookmark({
  required String text,
  required int text2,
  required IconData icon,
  required int number,
  VoidCallback? onPressed,
}) {
  return Card(
    color: Colors.grey[700],
    child: ListTile(
      leading: Icon(
        icon,
        color: Colors.amber,
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
          Text(
            text2.toString(),
            style: TextStyle(color: Colors.grey, letterSpacing: 2),
          ),
        ],
      ),
      trailing: Text(
        number.toString(),
        style: TextStyle(
          color: Colors.amber,
        ),
      ),
      onTap: onPressed,
    ),
  );
}
