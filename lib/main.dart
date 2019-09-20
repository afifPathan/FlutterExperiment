import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_app/home/ListStoredData.dart';
import 'package:flutter_app/home/SingleItemSelectionList.dart';
import 'package:flutter_app/home/MultiItemSelectionList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(primarySwatch: Colors.orange, brightness: Brightness.light),
      home: MyHomePage(title: 'Flutter Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.lightGreenAccent, Colors.orange])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(100.0))),
                  textColor: Colors.black,
                  padding: EdgeInsets.all(15.0),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SingleItemSelectionList()),
                    );
                  },
                  child: const Text('Single Item Selection List',
                      style: TextStyle(fontSize: 20)),
                  color: Colors.white10,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(100.0))),
                  textColor: Colors.black,
                  padding: EdgeInsets.all(15.0),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MultiItemSelectionList()),
                    );
                  },
                  child: const Text('Multiple Item Selection List',
                      style: TextStyle(fontSize: 20)),
                  color: Colors.white10,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.navigate_next),
        label: Text("Add Data In List"),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(100.0))),
        backgroundColor: Colors.lightGreenAccent,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ListStoredData()),
          );
        },
      ),
    );
  }
}



