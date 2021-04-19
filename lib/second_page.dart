import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'my_controller.dart';

class SecondPage extends StatefulWidget {
  final MyController myController;

  const SecondPage({Key key, this.myController}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SecondPageState();
  }
}

class _SecondPageState extends State<SecondPage> {

  @override
  void initState() {
    widget.myController.addListener(_onListener);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onListener() {
    print("Second Page Listener ${widget.myController.value}");
  }

  void _onTap() {
    widget.myController.value = 2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: _onTap,
          child: Container(
            height: 100,
            alignment: Alignment.center,
            child: Text("TAP tp change controller"),
          ),
        ),
      ),
    );
  }
}