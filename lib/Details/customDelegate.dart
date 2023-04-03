import 'package:amhs/Details/categoryDetails.dart';
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
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var name in catName[intIndex - 1]) {
      if (name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(name);
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
    List<String> matchQuery = [];
    for (var name in catName[intIndex - 1]) {
      if (name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(name);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        int value =
            catName[intIndex - 1].indexWhere((book) => book.contains(result));

        return ListTile(
          title: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/catDisplayScreen', arguments: {
                  'indexNum': value + 1,
                  'listNum': intIndex,
                });
              },
              child: Text(result)),
        );
      },
    );
  }
}
