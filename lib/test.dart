// //profile
//       Padding(
//         padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Center(
//               child: CircleAvatar(
//                 backgroundImage: AssetImage('assets/sky.jpg'),
//                 radius: 40.0,
//               ),
//             ),
//             Divider(
//               height: 90.0,
//               color: Colors.grey[800],
//             ),
//             Text(
//               'NAME',
//               style: TextStyle(
//                 color: Colors.grey,
//                 letterSpacing: 2.0,
//               ),
//             ),
//             SizedBox(height: 10.0),
//             Text(
//               'Chun-Li',
//               style: TextStyle(
//                 color: Colors.amberAccent[200],
//                 fontSize: 28.0,
//                 letterSpacing: 2.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 30.0),
//             Text(
//               'Current level',
//               style: TextStyle(
//                 color: Colors.grey,
//                 letterSpacing: 2.0,
//               ),
//             ),
//             Text(
//               '$level',
//               style: TextStyle(
//                 color: Colors.amberAccent[200],
//                 fontSize: 28.0,
//                 letterSpacing: 2.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 30.0),
//             Row(
//               children: <Widget>[
//                 Icon(
//                   Icons.email,
//                   color: Colors.amber,
//                 ),
//                 SizedBox(width: 10.0),
//                 Text(
//                   'chunli@gmail.com',
//                   style: TextStyle(
//                     color: Colors.grey[400],
//                     fontSize: 18.0,
//                     letterSpacing: 1.0,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),

//       // act as space
//       // SizedBox(height: 10.0,), vertical
//       //SizedBox(width: 10.0,),  horizontal

//       Row(
//         children: <Widget>[
//           Expanded(child: Image.asset('assets/sky.jpg')),
//           Expanded(
//             flex: 3,
//             child: Container(
//               child: Text('1'),
//               padding: EdgeInsets.all(30.0),
//               color: Colors.cyan,
//             ),
//           ),
//           Expanded(
//             flex: 2,
//             child: Container(
//               child: Text('2'),
//               padding: EdgeInsets.all(30.0),
//               color: Colors.amber,
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: Container(
//               child: Text('3'),
//               padding: EdgeInsets.all(30.0),
//               color: Colors.red[400],
//             ),
//           ),
//         ],
//       ),

//       // WIDGET COLUMN :
//       Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           Row(
//             children: const [
//               Text('World'),
//               Text('Hello'),
//             ],
//           ),
//           Container(
//             padding: EdgeInsets.all(20.0),
//             color: Colors.cyan,
//             child: Text('one'),
//           ),
//           Container(
//             padding: EdgeInsets.all(30.0),
//             color: Colors.blue,
//             child: Text('two'),
//           ),
//           Container(
//             padding: EdgeInsets.all(40.0),
//             color: Colors.red,
//             child: Text('three'),
//           ),
//         ],
//       ),

//       // WIDGET ROW :
//       Row(
//         // adjust kedudukan content
//         mainAxisAlignment: MainAxisAlignment.center, //x-axis
//         crossAxisAlignment: CrossAxisAlignment.end, //y-axis
//         //act as array
//         children: <Widget>[
//           Text('Hello World'),
//           ElevatedButton(
//             onPressed: () {},
//             style: ElevatedButton.styleFrom(
//               primary: Colors.amber,
//             ),
//             child: Text('Click Me'),
//           ),
//           Container(
//             color: Colors.cyan,
//             padding: EdgeInsets.all(30.0),
//             child: Text('Inside Container'),
//           ),
//         ],
//       ),

//       // WIDGET PADDING :
//       Padding(
//         child: Text('Widget Padding'),
//         padding: EdgeInsets.all(40.0),
//       ),

//       // WIDGET CONTAINER :
//       Container(
//         padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
//         color: Colors.grey[400],
//         child: Text('Widget Container'),
//         margin: EdgeInsets.all(30.0),
//       ),

//        // WIDGET CENTER APP :
//        Center(
//        // TEXT :
//         child: Text(
//           'Widget Center',
//           style: TextStyle(
//             fontSize: 50,
//             fontFamily: 'Anton',
//             color: Colors.blue[600],
//           ),
//         ),

//        // IMAGE :
//         asset dari file/ network dari link
//         child: Image.asset('assets/sky.jpg'),

//        // ICON :
//         child: Icon(
//           Icons.airport_shuttle,
//           color: Colors.lightBlue,
//           size: 50,
//         ),

//        // BUTTON :
//         child: ElevatedButton(
//           onPressed: () {
//             debugPrint('Walawoeh');
//           },
//           child: Text('Enter'),
//           style: ElevatedButton.styleFrom(
//             primary: Colors.green,
//           ),
//         ),
//         child: ElevatedButton.icon(
//           onPressed: () {},
//           icon: Icon(
//             Icons.mail,
//           ),
//           label: Text('Mail Me'),
//           style: ElevatedButton.styleFrom(
//             primary: Colors.amber,
//           ),
//         ),
//         child: IconButton(
//           onPressed: () {
//             debugPrint('You Click Me!');
//           },
//           icon: Icon(
//             Icons.alternate_email,
//           ),
//           color: Colors.amber,
//         ),
//       ),

//       floatingActionButton: FloatingActionButton(
//         child: Text('Click'),
//         backgroundColor: Colors.red[600],
//         onPressed: () {},
//       ),