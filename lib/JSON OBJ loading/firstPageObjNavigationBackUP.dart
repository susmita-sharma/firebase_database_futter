// import 'package:flutter/material.dart';
// import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
//
// class Person {
//   final String name;
//   final int age;
//   final int id;
//
//   Person({required this.name, required this.age, required this.id});
// }
//
// class FirstPageObj extends StatefulWidget {
//   const FirstPageObj({Key? key}) : super(key: key);
//
//   @override
//   State<FirstPageObj> createState() => _FirstPageObj();
// }
//
// class _FirstPageObj extends State<FirstPageObj> {
//   // This holds a list of fiction users
//   // You can use data fetched from a database or a server as well
//
//   List<Map<String, dynamic>> _allUsers = [
//     {"id": 7781, "name": "Suwan", "age": 29},
//     {"id": 7780, "name": "Susmita", "age": 40},
//     {"id": 3312, "name": "Sanjib", "age": 5},
//     {"id": 2932, "name": "Barbara", "age": 35},
//     {"id": 1353, "name": "Candy", "age": 21},
//     {"id": 2374, "name": "Colin", "age": 55},
//     {"id": 1234, "name": "Audra", "age": 30},
//     {"id": 9212, "name": "Banana", "age": 14},
//     {"id": 7843, "name": "Caversky", "age": 100},
//     {"id": 1010, "name": "Becky", "age": 32}
//   ];
//
//   // This list holds the data for the list view
//   List<Map<String, dynamic>> _foundUsers = [];
//   @override
//   initState() {
//     // at the beginning, all users are shown
//     _foundUsers = _allUsers;
//     super.initState();
//   }
//
//   // This function is called whenever the text field changes
//   void _runFilter(dynamic enteredKeyword) {
//     int? userInt = int.tryParse(enteredKeyword);
//     print(userInt);
//
//     List<Map<String, dynamic>> results = [];
//     if (enteredKeyword.isEmpty) {
//       // if the search field is empty or only contains white-space, we'll display all users
//       results = _allUsers;
//     } else if (userInt != null) {
//       results = _allUsers
//           .where((userData) =>
//               (userData['id'].toString()).contains(enteredKeyword.toString()))
//           .toList();
//     } else {
//       // else (enteredKeyword.isString) { } elseif { userData["id"] }
//       results = _allUsers
//           .where((userData) => userData["name"]
//               .toLowerCase()
//               .contains(enteredKeyword.toLowerCase()))
//           .toList();
//       // we use the toLowerCase() method to make it case-insensitive
//     }
//
//     // Refresh the UI
//     setState(() {
//       _foundUsers = results;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Nepal Telecom'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10),
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 20,
//             ),
//             TextField(
//               onChanged: (value) => _runFilter(value),
//               decoration: const InputDecoration(
//                   labelText: 'Search', suffixIcon: Icon(Icons.search)),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Expanded(
//               child: _foundUsers.isNotEmpty
//                   ? ListView.builder(
//                       itemCount: _foundUsers.length,
//                       itemBuilder: (context, index) => Card(
//                         key: ValueKey(_foundUsers[index]["id"]),
//                         color: Colors.amberAccent,
//                         elevation: 4,
//                         margin: const EdgeInsets.symmetric(vertical: 10),
//                         child: ListTile(
//                           leading: Text(
//                             (index + 1).toString(),
//                             style: const TextStyle(fontSize: 24),
//                           ),
//                           title: Text(_foundUsers[index]['name']),
//                           subtitle: Text(
//                               '${_foundUsers[index]["age"].toString()} years old'),
//                           trailing: IconButton(
//                             icon: Icon(Icons.man),
//                             onPressed: () {
//                               print('@@button pressed');
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => SecondPage(
//                                       person: Person(
//                                           name: _foundUsers[index]['name'],
//                                           age: _foundUsers[index]["age"],
//                                           id: _foundUsers[index]['id'])),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                       ),
//                     )
//                   : const Text(
//                       'No results found',
//                       style: TextStyle(fontSize: 24),
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// _callNumber() async {
//   print('@@_callNumber is called');
//   const number = '9851141621'; //set the number here
//   bool? res = await FlutterPhoneDirectCaller.callNumber(number);
// }
