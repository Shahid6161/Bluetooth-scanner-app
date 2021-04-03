import 'package:bluetooth_scan_app/screens/device_details.dart';
import 'package:flutter/material.dart';

import 'package:bluetooth_scan_app/screens/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
          title: 'Bluetooth Scan App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              scaffoldBackgroundColor: Colors.purple[50],
              appBarTheme: AppBarTheme(
                color: Colors.deepPurple[300],
                titleTextStyle: TextStyle(
                  color: Colors.purple[50],
                  fontFamily: 'QuickSand',
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              fontFamily: 'OpenSand',
              textTheme: TextTheme(
                headline1: TextStyle(
                    color: Colors.purple[900],
                    fontFamily: 'OpenSans',
                    // fontWeight: FontWeight.w700,
                    fontSize: 18),
                subtitle1: TextStyle(
                    color: Colors.purple[900].withOpacity(0.6),
                    fontFamily: 'OpenSans',
                    // fontWeight: FontWeight.w700,
                    fontSize: 14),
                headline2: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                    color: Colors.purple[600]),
                subtitle2: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.purple[400]),
              )
              //primarySwatch: Colors.blue,
              ),
          home: HomePage(),
          initialRoute: '/',
          routes: {
            DeviceDetails.nameRoute: (context) =>
                DeviceDetails(ModalRoute.of(context).settings.arguments),
          });
}
