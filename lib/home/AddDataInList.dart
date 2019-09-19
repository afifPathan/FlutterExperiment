import 'package:flutter/material.dart';
import 'package:flutter_app/home/ListStoredData.dart';
import 'package:flutter_app/home/Utils.dart';

import 'User.dart';

class AddDataInList extends StatefulWidget {
  @override
  _AddDataInListState createState() => _AddDataInListState();
}

class _AddDataInListState extends State<AddDataInList> {

  final TextEditingController test = new TextEditingController();
  final TextEditingController username = new TextEditingController();
  final TextEditingController email = new TextEditingController();
  final TextEditingController address = new TextEditingController();
  final TextEditingController mobile = new TextEditingController();
  final TextEditingController password = new TextEditingController();

  var strUsername, strEmail, strAddress, strMobile, strPassword;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Add Data"),
        ),
        body: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: test,
                decoration: InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            new TextField(
              controller: username,
              decoration: new InputDecoration.collapsed(
                hintText: 'Enter Username',
                border: InputBorder.none,
              ),
              onSubmitted: (text) {
                //strUsername = text;
              },
              textInputAction: TextInputAction.next,
            ),
            new TextField(
              controller: email,
              decoration: new InputDecoration.collapsed(
                hintText: 'Enter Email',
                border: InputBorder.none,
              ),
              onSubmitted: (text) {},
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
            ),
            new TextField(
              controller: mobile,
              decoration: new InputDecoration.collapsed(
                hintText: 'Enter Mobile',
                border: InputBorder.none,
              ),
              onSubmitted: (text) {},
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.phone,
            ),
            new TextField(
              controller: address,
              decoration: new InputDecoration.collapsed(
                hintText: 'Enter Address',
                border: InputBorder.none,
              ),
              onSubmitted: (text) {},
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
            ),
            new TextField(
              controller: password,
              obscureText: true,
              decoration: new InputDecoration.collapsed(
                hintText: 'Enter password',
                border: InputBorder.none,
              ),
              onSubmitted: (text) {
                // strPassword = text;
              },
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.visiblePassword,
            ),
            Padding(padding: EdgeInsets.all(4.5)),
            Center(
              child: RaisedButton(
                onPressed: () {
                  strUsername = username.text;
                  strEmail = email.text;
                  strMobile = mobile.text;
                  strAddress = address.text;
                  strPassword = password.text;

                  if (strUsername.length == 0) {
                    Utils.showToast("Enter User Name");
                  } else if (strEmail.length == 0) {
                    Utils.showToast("Enter Email");
                  } else if (strMobile.length == 0) {
                    Utils.showToast("Enter Mobile No");
                  } else if (strAddress.length == 0) {
                    Utils.showToast("Enter Address");
                  } else if (strPassword.length == 0) {
                    Utils.showToast("Enter Password");
                  } else {
                    Utils.usersUtils.add(new User(strUsername, strEmail,
                        strMobile, strAddress, strPassword));

                    address.clear();
                    mobile.clear();
                    email.clear();
                    username.clear();
                    password.clear();
                    setState(() {});

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ListStoredData()),
                    );
                  }
                },
                child: const Text('Add Data', style: TextStyle(fontSize: 20)),
                color: Colors.green,
              ),
            ),
          ],
        ));
  }
}
