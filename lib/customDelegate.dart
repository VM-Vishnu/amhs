import 'package:amhs/categoryDetails.dart';
import 'package:flutter/material.dart';

class CustomDelegate extends SearchDelegate {
  var intIndex;
  CustomDelegate({@required this.intIndex});
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    List<String> matchQuery = [];
    for (var name in catName[intIndex]) {
      if (name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(name);
        print(intIndex);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    List<String> matchQuery = [];
    for (var name in catName[intIndex]) {
      if (name.toLowerCase().contains(query.toLowerCase())) {
        print(intIndex);
        matchQuery.add(name);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        int value = catName[intIndex].indexWhere((book) => book.contains(result));
        print("value is  $value");
        return ListTile(
          title: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/catDisplayScreen',
                    arguments: value+1);
              },
              child: Text(result)),
        );
      },
    );
  }
}
