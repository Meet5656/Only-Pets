import 'package:flutter/material.dart';

class searchscreen extends SearchDelegate {
  List<String> Searchitem = [
    "apple",
    "banana",
    "mango",
    "orange",

  ];
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchquery = [];
    for (var fruit in Searchitem) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) ;
      {
        matchquery.add(fruit);
      }
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        var result = matchquery[index];
        return ListTile(
          title: Text(result),
        );
      },
      itemCount: matchquery.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchquery = Searchitem.where((Searchitem) {
      final result = Searchitem.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();

    // for (var fruit in Searchitem) {
    //   if (fruit.toLowerCase().contains(query.toLowerCase())) ;
    //   {
    //     matchquery.add(fruit);
    //   }
    // }
    return ListView.builder(
      itemBuilder: (context, index) {
        var result = matchquery[index];
        return ListTile(
          title: Text(result),
          onTap: () {
            query = result;
          },
        );
      },
      itemCount: matchquery.length,
    );
  }
}
