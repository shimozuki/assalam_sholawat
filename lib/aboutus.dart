// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'var.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MaterialApp(home: About()));

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  _launchURL(String url) async {
    await launch(url);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgcolor,
        appBar: AppBar(
          title: Text(
            'About',
            style: TextStyle(fontFamily: 'Anton', letterSpacing: 4.0),
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.grey[850],
        ),
        body: ListView(
          children: <Widget>[
            Center(
              child: Image(
                image: AssetImage('assets/myq4.png'),
                width: 200,
                height: 200,
              ),
            ),
            Divider(
              height: 10,
              color: commontext,
              thickness: 5,
              indent: 10,
              endIndent: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'About Me :',
                    style: TextStyle(
                      fontFamily: 'Anton',
                      fontSize: 20,
                      letterSpacing: 5,
                      color: commontext,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'This app was built by me, Ikmal. I have been an internship for 6 months at Total Configure. My basic on javascript, java, and dart is very poor. I built this app from scratch and by the time I develop this app, I learn more about the related language.',
                    style: TextStyle(
                      fontSize: 15,
                      letterSpacing: 3,
                      color: commontext,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Apps :',
                    style: TextStyle(
                      fontFamily: 'Anton',
                      fontSize: 20,
                      letterSpacing: 5,
                      color: commontext,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "This app is built for internship task purposes only. It contains only Juz Amma' or Juz 30 and additional solah time at the sidebar. It's still in early development. It may have some problem at some parts. If do, please contact me through social media down below.",
                    style: TextStyle(
                      fontSize: 15,
                      letterSpacing: 3,
                      color: commontext,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Sources :',
                    style: TextStyle(
                      fontFamily: 'Anton',
                      fontSize: 20,
                      letterSpacing: 5,
                      color: commontext,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Image sources from app named 'Quran for Android' created by quran.com. The audio sources from surahquran.com.",
                    style: TextStyle(
                      fontSize: 15,
                      letterSpacing: 3,
                      color: commontext,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Social Media :',
                    style: TextStyle(
                      fontFamily: 'Anton',
                      fontSize: 20,
                      letterSpacing: 5,
                      color: commontext,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      ElevatedButton.icon(
                        style:
                            ElevatedButton.styleFrom(primary: Colors.blue[700]),
                        icon: Icon(Icons.facebook),
                        label: Text('Ikmal Ismail'),
                        onPressed: () {
                          _launchURL("https://www.facebook.com/ikmalismail69");
                        },
                      ),
                      SizedBox(width: 10),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(primary: Colors.red),
                        icon: Icon(Icons.camera_alt_rounded),
                        label: Text('1kml1m'),
                        onPressed: () {
                          _launchURL("https://www.instagram.com/1kml1m");
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
