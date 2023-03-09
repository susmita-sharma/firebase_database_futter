import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';


void main  ()  {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nepal Telecom',
      home:Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: _callNumber,
            child: Text('Call Number'),
          ),
        ),
      ));
  }
}

_callNumber() async{
  const number = '9851141621'; //set the number here
  bool? res = await FlutterPhoneDirectCaller.callNumber(number);
}