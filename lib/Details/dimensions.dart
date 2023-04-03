import 'package:flutter/material.dart';

class Dimensions {
  String name = "";
  var row = -1;
  var col = -1;
  
}


List<Dimensions> d = [];
List<List<Color>> color = [[], [], [], []];
bool value = true;
int count = 0;
var width;
var height;

class MQuerry {
  void init(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    width = mediaQuery.size.width;
    height = mediaQuery.size.height;
  }
}
