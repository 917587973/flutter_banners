import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

import 'custom_carousel.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  List<String> images = new List();
  @override
  Widget build(BuildContext context) {
    images.add('https://image.shutterstock.com/image-photo/mountains-under-mist-morning-amazing-260nw-1725825019.jpg');
    images.add('https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg');
    images.add('https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8aHVtYW58ZW58MHx8MHw%3D&ixlib=rb-1.2.1&w=1000&q=80');
    images.add('https://image.shutterstock.com/image-photo/surreal-image-african-elephant-wearing-260nw-1365289022.jpg');
    return MaterialApp(
        title: 'Flutter',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          platform: TargetPlatform.iOS,
        ),
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          '/': (context) =>
              Container(
              height:MediaQuery.of (context).size.height,
              color: Colors.white,
              child: Column(
                  children: <Widget>[
                    SizedBox(
                      width: double.infinity,
                      height: 400,
                      child: CustomCarousel(imageUrls: images),
                    )
                  ]))
        });
  }
}
