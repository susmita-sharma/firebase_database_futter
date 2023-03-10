
import 'package:flutter/material.dart';
import 'firstPageObjNavigation.dart';




class SecondPage extends StatelessWidget {
  final Person person;

  const SecondPage({required this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee Detail Page"),
      ),
      body: Center(
        child: Text("Name: ${person.name}\nAge: ${person.age} \nEmployeeID : ${person.id} " ),
      ),
    );
  }
}



