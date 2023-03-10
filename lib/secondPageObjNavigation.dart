
import 'package:flutter/material.dart';


class Person {
  final String name;
  final int age;

  Person({required this.name, required this.age});
}


class SecondPage extends StatelessWidget {
  final Person person;

  const SecondPage({required this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: Center(
        child: Text("Name: ${person.name}\nAge: ${person.age}"),
      ),
    );
  }
}



