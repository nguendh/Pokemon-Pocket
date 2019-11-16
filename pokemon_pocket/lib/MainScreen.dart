import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MasterScreen.dart';

const title = "Pokemon Pocket";

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: MasterScreen());
  }
}
