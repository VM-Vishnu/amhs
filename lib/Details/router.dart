import 'package:amhs/Screens/catDisplayScreen.dart';
import 'package:amhs/Screens/homeScreen.dart';
import 'package:amhs/Screens/secondPage.dart';
import 'package:flutter/material.dart';
import 'package:amhs/Screens/catScreen.dart';
import 'package:amhs/Screens/thirdScreen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/second':
        var data = settings.arguments as int;
        return MaterialPageRoute(builder: (_) => SecondPage(data));
      case '/third':
        var data = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (_) => ThirdPage(
                  listNum: data['index'],
                  value: data['value'],
                ));

      case '/catScreen':
        var data = settings.arguments as Map;

        return MaterialPageRoute(
            builder: (_) => CatScreen(
                  indexNum: data['indexNum'],
                  listNum: data['listNum'],
                ));
      case '/catDisplayScreen':
        var data = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (_) => CatDisplayScreen(
                  indexNum: data['indexNum'],
                  listNum: data['listNum'],
                ));
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
