
import 'package:flutter/material.dart';
import 'secondPageObjNavigation.dart';
import 'firstPageObjNavigation.dart';

void main  ()  {

  runApp(const MyApp());
}

late final Person personObj;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        initialRoute: 'firstPageObjNavigation',
        routes: {
          'firstPageObjNavigation': (context) => const FirstPageObj(),
          'secondPage': (context) => SecondPage( person: personObj),
        },
        debugShowCheckedModeBanner: false,
      title: 'Nepal Telecom',
    );

  }
}


