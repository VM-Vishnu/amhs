import 'package:flutter/material.dart';

class Dimensions {
  String name="";
  var row=-1;
  var col=-1;
  //Dimensions({this.row = -1, this.col = -1, this.name = "Random"});
}
 //Dimensions dimensions=Dimensions();
List<Dimensions> d = [];

int count=0;

class MQuerry{
  var width;
    var height;
  void init(BuildContext context){
    
     MediaQueryData _mediaQuery=MediaQuery.of(context);
     width=_mediaQuery.size.width;
     height=_mediaQuery.size.height;

  }
}