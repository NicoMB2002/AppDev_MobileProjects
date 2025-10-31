import 'dart:ffi';

import 'package:flutter/material.dart';


enum Options {search, upload, copy, exit}

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var _popupMenuItemIndex = 0; // initially I want the default index at 0
  Color _changeColorAccordingToMenuItem = Colors.red;
  var appBarHeight = AppBar().preferredSize.height; // Use the App bar class to control the container height

  //build it

  _buildAppBar() {
    return AppBar(
      title: Text('Popup Menu', style: TextStyle(color: Colors.white, fontSize: 16.0),),
      actions: [
        PopupMenuButton(
          onSelected: (value) {
            _onMenuItemSelected(value as int);
          },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0)
              ),
            ),
            itemBuilder: (context) => [
              //function to design each item so that we could customize
              _buildPopupItem('search', Icons.search, Options.search.index),
              _buildPopupItem('upload', Icons.upload, Options.upload.index),
              _buildPopupItem('copy', Icons.copy, Options.copy.index),
              _buildPopupItem('exit', Icons.exit_to_app, Options.exit.index),


            ]
        )
      ],
    );
  }

  PopupMenuItem _buildPopupItem(String title, IconData iconData, int position) {
    return PopupMenuItem(
      value: position,
        child: Row(
          children: [
            Icon(
              iconData,
              color: Colors.black,
            ),
            Text(title)
          ],
        )
    );
  }

  _onMenuItemSelected (int value) {
    setState(() {
      _popupMenuItemIndex = value;
    });

    if(value == Options.search.index) {
      _changeColorAccordingToMenuItem = Colors.red;
    } else if (value == Options.upload.index) {
      _changeColorAccordingToMenuItem = Colors.greenAccent;
    } else if (value == Options.copy.index) {
      _changeColorAccordingToMenuItem = Colors.blueAccent;
    } else {
      _changeColorAccordingToMenuItem = Colors.orangeAccent;
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _buildAppBar(),
        body: Container(
          color: _changeColorAccordingToMenuItem,
        ),
      ),
    );
  }
}
