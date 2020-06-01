import 'package:flutter/material.dart';

import 'widgets/exclusive_hotels.dart';
import 'widgets/top_destination.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _bottomNavigationPosition = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.grey[200],
          child: ListView(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 50.0),
                child: Text("Which place you want to visit?",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
              ),
              SizedBox(height: 30),
              TopDestination(),
              SizedBox(height: 30),
              ExclusiveHotels(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavigationPosition,
        items: [
          BottomNavigationBarItem(
            title: Text("Home"),
            icon: Icon(
              Icons.home,
              size: 30,
            ),
          ),
          BottomNavigationBarItem(
            title: Text("Favorite"),
            icon: Icon(
              Icons.favorite,
              size: 30,
            ),
          ),
          BottomNavigationBarItem(
            title: Text("Profile"),
            icon: Icon(
              Icons.supervisor_account,
              size: 30,
            ),
          ),
        ],
        onTap: ((int position) {
          setState(() {
            _bottomNavigationPosition = position;
          });
        }),
      ),
    );
  }
}
