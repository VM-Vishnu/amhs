import 'package:flutter/material.dart';
import 'package:amhs/cardButton.dart';

class CategoryDetails {
  String catName = '';
  int catID = -1;
  int weight = -1;
  int cost = -1;
  String location = '';
}

List<List<CategoryDetails>> catDetails = [[], [], [], [], [], []];
List<List<String>> catName = [[], [], [], [], [], []];
//List<List<Widget>> container = [[], [], [], [], [], []];

class Ctainer extends ChangeNotifier {
  List<List<Widget>> container = [[], [], [], [], [], []];
  void create(int listNum, int indexNum) {
    container[listNum - 1].add(
      CardButton(indexNum: indexNum, listNum: listNum),
    );
    notifyListeners();
  }
}
