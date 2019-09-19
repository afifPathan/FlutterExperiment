import 'package:flutter/material.dart';
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
          ThemeData(primarySwatch: Colors.green, brightness: Brightness.light),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                textColor: Colors.white,
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
                color: Colors.green,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                textColor: Colors.white,
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
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.navigate_next),
        label: Text("Add Data In List"),
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
