import 'package:flutter/material.dart';

import 'my_controller.dart';
import 'second_page.dart';

class FirstPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FirstPageState();
  }
}

class _FirstPageState extends State<FirstPage> {
  MyController _myController;

  @override
  void initState() {
    super.initState();
    _myController = MyController(0);
    _myController.addListener(_onListener);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onListener() {
    print("First Page Listener ${_myController.value}");
  }

  void _onTap() {
    _myController.value = 1;
  }

  void _onSecondPageOpen() {
    Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => SecondPage(myController: _myController),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          InkWell(
            onTap: _onTap,
            child: Container(
              height: 100,
              alignment: Alignment.center,
              child: Text("TAP To change controller"),
            ),
          ),
          SizedBox(height: 20,),
          InkWell(
            onTap: _onSecondPageOpen,
            child: Container(
              height: 100,
              alignment: Alignment.center,
              child: Text("TAP To Open SECOND"),
            ),
          )
        ],
      ),
    );
  }
}