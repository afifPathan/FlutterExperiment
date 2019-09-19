import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/home/AddDataInList.dart';
import 'package:flutter_app/home/Utils.dart';
import 'package:flutter_app/main.dart';

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
                iconSize: 30.0,
                onPressed: () {

                  showDialog(
                      context: context,
                      builder: (context) {
                        return AddItemInList();
                      });

                  /*Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddItemInList()),
                  );*/
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
                      shrinkWrap: true,
                      dragStartBehavior: DragStartBehavior.start,
                      itemCount: Utils.usersUtils.length,
                      itemBuilder: (BuildContext ctxt, int position) {
                        if (Utils.usersUtils == null) {
                          return Center(child: Text("No Data"));
                        } else {
                          return GestureDetector(
                            onTap: () {},
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                            ),
                          );
                        }
                      }),
                )),
          ].reversed.toList(),
        ));
  }
}
