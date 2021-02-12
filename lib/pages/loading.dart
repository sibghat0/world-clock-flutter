import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setUpWorldTime() async{
    WorldTime ins = WorldTime(location: 'Kolkata', flag: 'India', url: 'Asia/Kolkata');
    await ins.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments:  {
      'location' : ins.location,
      'flag' : ins.flag,
      'time' : ins.time,
      'isDaytime' : ins.isDaytime,
    });
    // print(ins.time);
    // setState(() {
    //   time = ins.time;
    // });
  }

  // void getData() async {
  //   Response response = await get(
  //       'https://jsonplaceholder.typicode.com/todos/1');
  //   Map data = jsonDecode(response.body);
  //   print(data['title']);
  // }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: Center(
        child: SpinKitFoldingCube(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
