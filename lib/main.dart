import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'pages/home/home_page.dart';

void main() => runApp(TravelApplication());

class TravelApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],

        // Define the default font family.
        fontFamily: 'Georgia',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.black),
          headline2: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
          headline3: TextStyle(fontSize: 14.0, color: Colors.grey),
        ),
      ),
      home: HomePage(),
    );
  }
}
