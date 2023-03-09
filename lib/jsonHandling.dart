
// main.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
   runApp(const MyApp());
    }
class Person {
  final int id;
  final String name;
  final int age;

  Person(this.id, this.name,this.age);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nepal Telecom',
      home: HomePage(),

    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List <Person> _person = [];

  @override
  void initState() {
     loadJsonData().then((Person) {
      setState(() {
        _person = Person;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Our App'),
      ),
      body: ListView.builder(
        itemCount: _person.length,
        itemBuilder: (context, index) {
          final person = _person[index];
          return ListTile(
            title: Text(person.name),
            subtitle: Text('Age: ${person.age}'),
          );
        },
      ),
    );
  }
}
Future <List<Person>> loadJsonData() async {
  final jsonString = await rootBundle.loadString("assets/data.json");
  List<dynamic> jsonList = json.decode(jsonString);

  // List<dynamic> jsonString = [
  //   {"id": 1, "name": "Suwan", "age": 29},
  //   {"id": 2, "name": "Susmita", "age": 40},
  //   {"id": 3, "name": "Sanjib", "age": 5},
  //   {"id": 4, "name": "Barbara", "age": 35}
  // ];
  print("@@@@ trying to map");
// Convert JSON list to list of Person instances
  List<Person> personList = jsonList.map((json) => Person(json["id"], json["name"], json["age"])).toList();
  print(personList);
  return personList;
 }




