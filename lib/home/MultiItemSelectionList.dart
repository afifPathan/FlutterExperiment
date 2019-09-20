import 'dart:math';

import 'package:flutter/material.dart';

class MultiItemSelectionList extends StatefulWidget {
  @override
  _MultiItemSelectionListState createState() => new _MultiItemSelectionListState();
}

class _MultiItemSelectionListState extends State<MultiItemSelectionList> {

  int _selectedIndex = -1;
  var isFavorite = false;

  var backgroundColor;

  List<int> favoriteItems = List();

  final List<String> _listViewData = [
    "One!",
    "Two!",
    "Three!",
    "Four!",
    "Five!",
    "Six!",
    "Seven!",
    "Eight!",
    "Nine!",
    "Ten!",
    "Eleven!",
    "Twele!",
    "Thirteen!",
    "Fourteen!",
    "Fifteen!",
    "Sixteen!",
    "Seventeen!",
    "Eighteen!",
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selected ListView'),
      ),
      body: ListView.builder(
        itemCount: _listViewData.length,
        itemBuilder: (context, index) => Container(
          color: favouriteColor(index),
          child: ListTile(
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.black))),
              child: favoriteIcon(index),
            ),


            title: favoriteText(index, _listViewData[index]),
            onTap: () => _onSelected(index),
          ),
        ),
      ),
    );
  }

  Widget favoriteIcon(int index){
    if(favoriteItems.contains(index)){
      return Icon(Icons.favorite, color: Colors.red);
    }else{
      return Icon(Icons.favorite_border, color: Colors.red);
    }
  }

  Widget favoriteText(int index, String text){
    if(favoriteItems.contains(index)){
      return Text(text, style: new TextStyle(fontSize:20.0, color: Colors.white, fontWeight: FontWeight.bold));
    }else{
      return Text(text, style: new TextStyle(fontSize:14.0, color: Colors.black));
    }
  }

  _onSelected(int index) {
    if(favoriteItems.contains(index)){
      favoriteItems.remove(index);
    }else {
      favoriteItems.add(index);
    }
    setState((){});
  }

  favouriteColor(int index) {
    if(favoriteItems.contains(index)){
      backgroundColor = Colors.black;
      return backgroundColor;
    }else{
      backgroundColor = Colors.white;
      return backgroundColor;
    }
    return backgroundColor;
  }

}
