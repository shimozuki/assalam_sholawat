import 'package:flutter/material.dart';
import 'package:flutter_quran/main.dart';

class Splash2 extends StatelessWidget {
  static final routeName = 'splash2';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 200,
              width: 200,
              child: Image.asset('assets/logo.png'),
            ),
            Text(
              'Assalam Sholawat',
              style: TextStyle(
                  color: Color.fromARGB(255, 236, 234, 234),
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Assalam Sholawat merupakan aplikasi sholawat yang di rancang oleh Adzan naufal Adzkarai yang bertujuan untuk membaca dan mendengarkan sholawat',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromARGB(255, 236, 234, 234),
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
                width: 150,
                child: ElevatedButton.icon(
                  label: Text(
                    'Home',
                  ),
                  icon: Icon(Icons.home),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Home()));
                  },
                ))
          ],
        ),
      ),
    );
  }
}
