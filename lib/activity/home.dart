import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  void getData() async
  {
    // Get Data
    Response response= await get("");
    // print(response.body);
    Map data= jsonDecode(response.body); // json se hum ek single data le skte h
    // print(data);
    print(data['date']);
  }

  int counter=1;
  @override
  void initstate(){
    super.initState();
    getData();
    print("this is a init state");
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Home Activity"),
    );
  }
}
