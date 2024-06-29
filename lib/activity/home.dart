import 'dart:convert';

import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {



  @override
  void initstate(){
    super.initState();
    print("this is a init state");
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    print('set state called');
  }

  @override
  Widget build(BuildContext context) {
    Map info = ModalRoute.of(context)!.settings.arguments;



    return Scaffold(
      appBar: AppBar(
        title: Text('Home Activity'),
      ),
      body: Column(
        children: <Widget> [
          FloatingActionButton(
              onPressed: () {},
          ),
          Text(info["temp_value"])
        ],
      ),
    );
  }
}
