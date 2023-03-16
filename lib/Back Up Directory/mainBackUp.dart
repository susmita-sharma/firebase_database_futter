


// main.dart
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
   runApp(const MyApp());
    }
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Remove the debug banner
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
  // This holds a list of fiction users
  // You can use data fetched from a database or a server as well

  List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "name": "Suwan", "age": 29},
    {"id": 2, "name": "Susmita", "age": 40},
    {"id": 3, "name": "Sanjib", "age": 5},
    {"id": 4, "name": "Barbara", "age": 35},
    {"id": 5, "name": "Candy", "age": 21},
    {"id": 6, "name": "Colin", "age": 55},
    {"id": 7, "name": "Audra", "age": 30},
    {"id": 8, "name": "Banana", "age": 14},
    {"id": 9, "name": "Caversky", "age": 100},
    {"id": 10, "name": "Becky", "age": 32}
  ];


  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = _allUsers;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
          user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kindacode.com'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                  labelText: 'Search', suffixIcon: Icon(Icons.search)),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                itemCount: _foundUsers.length,
                itemBuilder: (context, index) => Card(
                  key: ValueKey(_foundUsers[index]["id"]),
                  color: Colors.amberAccent,
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: Text(
                      _foundUsers[index]["id"].toString(),
                      style: const TextStyle(fontSize: 24),
                    ),
                    title: Text(_foundUsers[index]['name']),
                    subtitle: Text(
                        '${_foundUsers[index]["age"].toString()} years old'),
                  ),
                ),
              )
                  : const Text(
                'No results found',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// import 'package:firebase_database_futter/csvfileLoad.dart';
// import 'package:firebase_database_futter/homepage.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'firstpage.dart';
// import 'homepage.dart';
// import 'loginscreen.dart';
// import 'signup.dart';
// import 'welcomescreen.dart';
// import 'csvfileLoad.dart';
//
// void main  () async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       initialRoute: 'welcome_screen',
//       routes: {
//         'homepage': (context) => const HomePage(),
//         'welcome_screen': (context) => WelcomeScreen(),
//         'registration_screen': (context) => RegistrationScreen(),
//         'login_screen': (context) => LoginScreen(),
//         'first_page': (context) => FirstPage(),
//         'csv_load' : (context) => CsvLoadPage(),
//       },
//       debugShowCheckedModeBanner: false,
//       title: 'Nepal Telecom',
//     );
//   }
// }


















// // main.dart
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// void main() {
//    runApp(const MyApp());
//     }
// class Person {
//   final int id;
//   final String name;
//   final int age;
//
//   Person(this.id, this.name,this.age);
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Nepal Telecom',
//       home: HomePage(),
//
//     );
//   }
// }
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//
//   List <Person> _person = [];
//
//   @override
//   void initState() {
//      loadJsonData().then((Person) {
//       setState(() {
//         _person = Person;
//       });
//     });
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Our App'),
//       ),
//       body: ListView.builder(
//         itemCount: _person.length,
//         itemBuilder: (context, index) {
//           final person = _person[index];
//           return ListTile(
//             title: Text(person.name),
//             subtitle: Text('Age: ${person.age}'),
//           );
//         },
//       ),
//     );
//   }
// }
// Future <List<Person>> loadJsonData() async {
//   final jsonString = await rootBundle.loadString("assets/data.json");
//   List<dynamic> jsonList = json.decode(jsonString);
//
//   // List<dynamic> jsonString = [
//   //   {"id": 1, "name": "Suwan", "age": 29},
//   //   {"id": 2, "name": "Susmita", "age": 40},
//   //   {"id": 3, "name": "Sanjib", "age": 5},
//   //   {"id": 4, "name": "Barbara", "age": 35}
//   // ];
//   print("@@@@ trying to map");
// // Convert JSON list to list of Person instances
//   List<Person> personList = jsonList.map((json) => Person(json["id"], json["name"], json["age"])).toList();
//   print(personList);
//   return personList;
//  }
//
//
//
//
