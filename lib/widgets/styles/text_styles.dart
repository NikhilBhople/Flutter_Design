import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppStyles {
  TextStyle textLinkStyle() {
    return TextStyle(
      fontWeight: FontWeight.normal,
      color: Colors.blue,
      fontSize: 18,
    );
  }

  TextStyle textStyle22BlackBold() {
    return TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontSize: 22,
    );
  }

  TextStyle textStyle18BlackBold() {
    return TextStyle(
        fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black);
  }

  TextStyle textStyleDescription() {
    return TextStyle(fontSize: 14, color: Colors.grey);
  }

  TextStyle textStyle14BlackBold() {
    return TextStyle(
        color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold);
  }

  TextStyle textStyle18WhiteBold() {
    return TextStyle(
        color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold);
  }

  TextStyle textStyle14White() {
    return TextStyle(color: Colors.white, fontSize: 14,);
  }
}
