import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:page_view_indicator/page_view_indicator.dart';

class ViewPager extends StatefulWidget {
  @override
  _ViewPagerState createState() => _ViewPagerState();
}

class _ViewPagerState extends State<ViewPager> {
  static const length = 3;
  final pageIndexNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[

            Expanded(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  PageView.builder(
                    onPageChanged: (index) => pageIndexNotifier.value = index,
                    itemCount: length,
                    itemBuilder: (context, index) {
                      return Container(color :Colors.accents[index]);
                    },
                  ),
                  _buildExample3()
                ],
              ),
            ),
            Container(
              height: 200,
              color: Colors.green,
            )
          ],
        ),
      ),
    );
  }

  PageViewIndicator _buildExample1() {
    return PageViewIndicator(
      pageIndexNotifier: pageIndexNotifier,
      length: length,
      normalBuilder: (animationController, index) => Circle(
        size: 8.0,
        color: Colors.black87,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 12.0,
          color: Colors.tealAccent,
        ),
      ),
    );
  }

  PageViewIndicator _buildExample2() {
    return PageViewIndicator(
      pageIndexNotifier: pageIndexNotifier,
      length: length,
      normalBuilder: (animationController, index) => Circle(
        size: 8.0,
        color: Colors.black87,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 8.0,
          color: Colors.tealAccent,
        ),
      ),
    );
  }

  PageViewIndicator _buildExample3() {
    return PageViewIndicator(
      pageIndexNotifier: pageIndexNotifier,
      length: length,
      normalBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Icon(Icons.star, color: Colors.black87, size: 10.0),
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Icon(Icons.favorite, color:Colors.tealAccent, size: 12.0),
      ),
    );
  }
}
