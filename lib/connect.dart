// import 'package:flutter/material.dart';
// import 'dashboard.dart';

// class ConnectPage extends StatefulWidget {
//   @override
//   _ConnectPageState createState() => _ConnectPageState();
// }

// class _ConnectPageState extends State<ConnectPage> {
//   // This widget is the root of your application.
//   TextStyle style = TextStyle(fontFamily: 'Open Sans');

//   @override
//   Widget _buildConnectDialog(BuildContext context) {
//     var cancelButton = FlatButton(
//     child: Text(
//       "Cancel",
//       style: style.copyWith(
//         color: Colors.grey,
//         fontSize: 18, 
//         fontWeight: FontWeight.bold),
//       ),
//       onPressed: () => Navigator.pop(context),
//       );
//     var continueButton = FlatButton(
//       child: Text(
//         "Accept",
//         style: style.copyWith(
//           color: Colors.blue,
//           fontSize: 18, 
//           fontWeight: FontWeight.bold),
//         ),
//       onPressed: () {
//       // Navigator.push(
//       //   context, 
//       //   MaterialPageRoute(
//       //     builder: (context) => DashboardPage(),
//       //   )
//       // );
//       },
//     );
//   // set up the AlertDialog
//     AlertDialog alert = AlertDialog(
//       title: Text(
//         "Connect to Brake",
//         style: style.copyWith(
//           color: Colors.black,
//           fontSize: 20, 
//           fontWeight: FontWeight.bold),
//         ),
//       content: Text("Please enable Bluetooth to pair your device with Brake\n"),
//       actions: [
//         cancelButton,
//         continueButton,
//       ],
//     );
//   // show the dialog
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return alert;
//       },
//     );
//   }
// }