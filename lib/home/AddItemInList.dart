import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/home/ListStoredData.dart';
import 'package:flutter_app/home/User.dart';
import 'package:flutter/widgets.dart';

import 'Utils.dart';

class AddItemInList extends StatefulWidget {
  @override
  _AddItemInListState createState() => _AddItemInListState();
}

class _AddItemInListState extends State<AddItemInList> {
  final TextEditingController test = new TextEditingController();
  final TextEditingController username = new TextEditingController();
  final TextEditingController email = new TextEditingController();
  final TextEditingController address = new TextEditingController();
  final TextEditingController mobile = new TextEditingController();
  final TextEditingController password = new TextEditingController();

  var strUsername, strEmail, strAddress, strMobile, strPassword;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(0.0),
      content: SingleChildScrollView(child: addcard()),
    );
  }

  Widget addcard() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          alignment: AlignmentDirectional.center,
          width: double.infinity,
          height: 60,
          color: Colors.green,
          child: labletxt(),
        ),
        Container(
          child: Column(
            children: <Widget>[
              usernametxt(),
              emailtxt(),
              mobiletxt(),
              addresstxt(),
              passwordtxt(),
            ],
          ),
        ),
        Container(
          width: double.maxFinite,
          color: Colors.green,
          child: addbtn(),
        ),
      ],
    );
  }

  Widget labletxt() {
    return Text(
      "Add Item",
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 30.0, color: Colors.white),
    );
  }

  Widget usernametxt() {
    return TextField(
      controller: username,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Username",
        hintText: "Username",
        prefixIcon: Icon(Icons.perm_identity),
      ),
    );
  }

  Widget emailtxt() {
    return TextField(
      controller: email,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Email",
        prefixIcon: Icon(Icons.email),
      ),
    );
  }

  Widget mobiletxt() {
    return TextField(
      controller: mobile,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        labelText: "Mobile",
        hintText: "Mobile",
        prefixIcon: Icon(Icons.phone),
      ),
    );
  }

  Widget addresstxt() {
    return TextField(
      controller: address,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Address",
        hintText: "Address",
        prefixIcon: Icon(Icons.home),
      ),
    );
  }

  Widget passwordtxt() {
    return TextField(
      controller: password,
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Password",
        prefixIcon: Icon(Icons.lock),
      ),
    );
  }

  Widget addbtn() {
    return FlatButton(
        child: const Text('Add',
            style: TextStyle(fontSize: 18.0, color: Colors.white)),
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
            Utils.usersUtils.add(new User(
                strUsername, strEmail, strMobile, strAddress, strPassword));
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
        });
  }

  Widget canclebtn() {
    return FlatButton(
      child: const Text('Cancle',
          style: TextStyle(fontSize: 18.0, color: Colors.white)),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ListStoredData()),
        );
      },
    );
  }
}
