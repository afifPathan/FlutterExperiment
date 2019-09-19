import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/home/Utils.dart';

import 'AddItemInList.dart';

class ListStoredData extends StatefulWidget {
  @override
  DyanmicList createState() => DyanmicList();
}

class DyanmicList extends State<ListStoredData> {
  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("List Data"),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.add_circle),
                color: Colors.white,
                tooltip: "test",
                iconSize: 30.0,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AddItemInList();
                      });
                }),
          ],
        ),
        body: new Column(
          children: <Widget>[
            Expanded(
                child: Align(
              alignment: Alignment.topCenter,
              child: ListView.builder(
                  reverse: true,
                  //ForReverseOrder
                  shrinkWrap: true,
                  //ForReverseOrder
                  dragStartBehavior: DragStartBehavior.start,
                  //ForReverseOrder
                  itemCount: Utils.usersUtils.length,
                  itemBuilder: (BuildContext ctxt, int position) {
                    if (Utils.usersUtils == null) {
                      return Center(
                          child: Text("No Data",
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 30.0, color: Colors.green)));
                    } else {
                      return Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        12.0, 12.0, 12.0, 6.0),
                                    child: Text(
                                      Utils.usersUtils[position].name,
                                      style: TextStyle(
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        12.0, 6.0, 12.0, 12.0),
                                    child: Text(
                                      Utils.usersUtils[position].address,
                                      style: TextStyle(fontSize: 18.0),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text(
                                      "5m",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.star_border,
                                        size: 35.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            height: 2.0,
                            color: Colors.grey,
                          )
                        ],
                      );
                    }
                  }),
            )),
          ].reversed.toList(), //ForReverseOrder
        ));
  }
}
