import 'package:firstapp/widgets/exclusive_hotels.dart';
import 'package:firstapp/widgets/top_destination.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyfirstApp());

class MyfirstApp extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<MyfirstApp> {
  int _selectedIcon = 0;
  List<IconData> icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.bicycle,
    FontAwesomeIcons.train,
  ];

  Widget _buildIcons(int position) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIcon = position;
        });
      },
      child: Container(
        height: 60,
        width: 60,
        child: Icon(
          icons[position],
          size: 25,
          color: _selectedIcon == position
              ? Theme.of(context).primaryColor
              : Colors.black26,
        ),
        decoration: BoxDecoration(
            color:
                _selectedIcon == position ? Colors.blue[100] : Colors.white,
            borderRadius: BorderRadius.circular(35)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: SafeArea(
              child: Container(
                color: Colors.grey[200],
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 30.0),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 50.0),
                      child: Text("Which place you want to visit?",
                          style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: icons
                          .asMap()
                          .entries
                          .map(
                            (MapEntry map) => _buildIcons(map.key),
                      )
                          .toList(),
                    ),
                    SizedBox(height: 30),
                    TopDestination(),
                    SizedBox(height: 30),
                    ExclusiveHotels(),
                  ],
                ),
              )),
        ));
  }
}
