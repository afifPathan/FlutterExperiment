import 'package:flutter/material.dart';

class SingleItemSelectionList extends StatefulWidget {
  @override
  _SingleItemSelectionListState createState() => _SingleItemSelectionListState();
}

class _SingleItemSelectionListState extends State<SingleItemSelectionList> {

  int _selectedIndex = -1;
  var isFavorite = false;

  final List<String> _listViewData = [
    "Here's One!",
    "Here's Two!",
    "Here's Three!",
    "Here's Four!",
    "Here's Five!",
    "Here's Six!",
    "Here's Seven!",
    "Here's Eight!",
    "Here's Nine!",
    "Here's Ten!",
    "Here's Eleven!",
    "Here's Twele!",
    "Here's Thirteen!",
    "Here's Fourteen!",
    "Here's Fifteen!",
    "Here's Sixteen!",
    "Here's Seventeen!",
    "Here's Eighteen!",
  ];


  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selected ListView'),
      ),
      body: ListView.builder(

        itemCount: _listViewData.length,
        itemBuilder: (context, index) => Container(
          color: _selectedIndex != null && _selectedIndex == index
              ? Colors.orange
              : Colors.white,

          child: ListTile(
              leading: Container(
                padding: EdgeInsets.only(right: 12.0),
                decoration: new BoxDecoration(
                    border: new Border(
                        right: new BorderSide(width: 1.0, color: Colors.white24))),
                child: Icon(Icons.favorite, color: _selectedIndex != null && _selectedIndex == index
                    ? Colors.black
                    : Colors.grey),
              ),


            title: Text(_listViewData[index], style: new TextStyle(fontSize: _selectedIndex != null && _selectedIndex == index
                ? 20.0
                : 14.0, color: _selectedIndex != null && _selectedIndex == index
                ? Colors.black
                : Colors.grey)),
            onTap: () => _onSelected(index),
          ),
        ),
      ),
    );
  }
}
