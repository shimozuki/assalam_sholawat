// ignore_for_file: unused_local_variable, unused_import

import 'package:flutter/material.dart';
import 'package:adhan_dart/adhan_dart.dart';
import 'package:flutter_quran/var.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'var.dart';
import 'package:intl/intl.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

List months = [
  "Jan",
  "Feb",
  "March",
  "Jan",
  "April",
  "May",
  "Jun",
  "July",
  "Aug",
  "Sep",
  "Oct",
  "Nov",
  "Dis"
];

class _MyAppState extends State<MyApp> {
  late PrayerTimes prayerTimes;
  late DateTime date;
  late Coordinates coordinates;
  late CalculationParameters params;

  @override
  void initState() {
    coordinates = Coordinates(5.6552872, 100.4084468);
    date = DateTime.now();
    params = CalculationMethod.Singapore();
    prayerTimes = PrayerTimes(coordinates, date, params, precision: true);
    super.initState();
  }

  String timePresenter(DateTime dateTime) {
    String timeInString = "";
    bool isGreaterThan12 = dateTime.hour > 12;
    String prefix = dateTime.hour > 11 ? "pm" : "am";
    int hour = isGreaterThan12 ? dateTime.hour - 12 : dateTime.hour;
    int minute = dateTime.minute;
    String hourInString = hour.toString().length == 1 ? "0$hour" : "$hour";
    String minuteInString =
        minute.toString().length == 1 ? "0$minute" : "$minute";

    return "$hourInString : $minuteInString $prefix";
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var waktoButton = waktuButton;
      DateTime? subuh = prayerTimes.fajr!.toLocal();
      DateTime? syuruk = prayerTimes.sunrise!.toLocal();
      DateTime? zuhur = prayerTimes.dhuhr!.toLocal();
      DateTime? asar = prayerTimes.asr!.toLocal();
      DateTime? maghrib = prayerTimes.maghrib!.toLocal();
      DateTime? isyak = prayerTimes.isha!.toLocal();

      return Scaffold(
        backgroundColor: bgcolor,
        appBar: AppBar(
          backgroundColor: Colors.grey[850],
          elevation: 0.0,
          title: Text(
            'Solat Time',
            style: TextStyle(fontFamily: 'Anton', letterSpacing: 4.0),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
          child: ListView(
            children: <Widget>[
              Column(
                children: [
                  Text(
                    "${(DateFormat('EEEE').format(date))} \n${date.day} ${months[date.month]} ${date.year}",
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 30,
                      letterSpacing: 3.0,
                      fontFamily: 'Anton',
                      shadows: [
                        Shadow(
                          offset: Offset(3, 1),
                          color: (Colors.grey[900])!,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  waktuButton(
                    icon: Icons.nightlight_round,
                    waktoTime: timePresenter(subuh.add(Duration(minutes: 11))),
                    waktoName: 'Subuh',
                  ),
                  waktuButton(
                    icon: Icons.wb_sunny,
                    waktoTime:
                        timePresenter(syuruk.subtract(Duration(minutes: 1))),
                    waktoName: 'Syuruk',
                  ),
                  waktuButton(
                    icon: Icons.wb_sunny,
                    waktoTime: timePresenter(zuhur.add(Duration(minutes: 1))),
                    waktoName: 'Zuhur',
                  ),
                  waktuButton(
                    icon: Icons.wb_sunny,
                    waktoTime: timePresenter(asar.add(Duration(minutes: 2))),
                    waktoName: 'Asar',
                  ),
                  waktuButton(
                    icon: Icons.nightlight,
                    waktoTime: timePresenter(maghrib.add(Duration(minutes: 2))),
                    waktoName: 'Maghrib',
                  ),
                  waktuButton(
                    icon: Icons.nightlight,
                    waktoTime: timePresenter(isyak.add(Duration(minutes: 1))),
                    waktoName: "Isha'",
                  ),
                  Container(),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}

Widget waktuButton({
  required String waktoName,
  required String waktoTime,
  required IconData icon,
}) {
  return Card(
    color: commontext,
    child: ListTile(
      leading: Icon(
        icon,
        color: Colors.amber,
      ),
      title: Column(
        children: [
          Text(waktoName, style: TextStyle(color: bgcolor)),
          Text(waktoTime, style: TextStyle(color: bgcolor)),
        ],
      ),
    ),
  );
}

// class WaktoButton extends StatelessWidget {
//   const WaktoButton({
//     Key? key,
//     required this.height,
//     required this.width,
//     required this.waktoName,
//     required this.waktoTime,
//   }) : super(key: key);
//   final double height;
//   final double width;
//   final String waktoName;
//   final String waktoTime;

//   @override
//   Widget build(BuildContext context) {
//     throw UnimplementedError();
//   }
// }
