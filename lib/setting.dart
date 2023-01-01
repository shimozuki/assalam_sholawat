// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'var.dart';

void main() => runApp(MaterialApp(home: Setting()));

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        title: Text(
          'Setting',
          style: TextStyle(
            letterSpacing: 4.0,
            fontFamily: 'Anton',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
        child: ListView(
          children: <Widget>[
            Theme(
              child: CheckboxListTile(
                title: Text(
                  'Change Mode Light',
                  style: TextStyle(fontSize: 20, color: commontext),
                ),
                value: mode,
                onChanged: (value) => setState(() {
                  mode = value!;
                  if (value == true) {
                    bgcolor = Colors.white;
                    commontext = Colors.black;
                    checkColor = Colors.black;
                    solattext = Colors.black;
                  } else {
                    bgcolor = Colors.grey[900];
                    commontext = Colors.white;
                    checkColor = Colors.white;
                    solattext = Colors.grey[200];
                  }
                }),
              ),
              data: ThemeData(
                primarySwatch: Colors.amber,
                unselectedWidgetColor: checkColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
