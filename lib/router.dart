import 'package:amhs/catDisplayScreen.dart';
import 'package:amhs/homeScreen.dart';
import 'package:amhs/secondPage.dart';
import 'package:flutter/material.dart';
import 'package:amhs/catScreen.dart';
import 'package:amhs/thirdScreen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/second':
        var data = settings.arguments as int;
        return MaterialPageRoute(builder: (_) => SecondPage(data));
      case '/third':
        var data = settings.arguments as int;
        return MaterialPageRoute(builder: (_) => ThirdPage(index: data));
      // break;
      case '/catScreen':
        var data = settings.arguments as Map;
        //Arguments args = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => CatScreen(
                  indexNum: data['indexNum'],
                  listNum: data['listNum'],
                ));
      case '/catDisplayScreen':
        var data=settings.arguments as int;
        return MaterialPageRoute(builder: (_) => CatDisplayScreen(index:data));
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}

class Arguments {
  final int indexNum;
  final int listNum;
  Arguments(this.indexNum, this.listNum);
}
