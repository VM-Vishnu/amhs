import 'package:flutter/material.dart';
import 'package:amhs/cardButton.dart';

class CategoryDetails {
  String catName = '';
  int catID = -1;
  int weight = -1;
  int cost = -1;
  String location = '';
}

List<CategoryDetails> catDetails = [];
List<List<String>> catName = [[], [], [], [], [], []];
List<List<Widget>> container = [[], [], [], [], [], []];

// class Ctainer extends ChangeNotifier {
//   List<List<Widget>> container = [[], [], [], [], [], []];
//   void create(int num,int indexNum) {
//     container[num - 1].add(
//       CardButton(id: indexNum),
//     );
//     notifyListeners();
//   }  
// }
