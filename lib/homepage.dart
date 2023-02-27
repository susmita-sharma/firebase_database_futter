import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // text fields' controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _designationController = TextEditingController();

  final CollectionReference _productss =
  FirebaseFirestore.instance.collection('employees');


  // This function is triggered when the floatting button or one of the edit buttons is pressed
  // Adding a product if no documentSnapshot is passed
  // If documentSnapshot != null then update an existing product
  Future<void> _createOrUpdate([DocumentSnapshot? documentSnapshot]) async {
    String action = 'create';
    if (documentSnapshot != null) {
      action = 'update';
      _nameController.text = documentSnapshot['name'];
      _ageController.text = documentSnapshot['age'].toString();
      _emailController.text = documentSnapshot['email'];
      _idController.text = documentSnapshot['id'].toString();
      _designationController.text = documentSnapshot['designation'].toString();
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
                // prevent the soft keyboard from covering text fields
                bottom: MediaQuery
                    .of(ctx)
                    .viewInsets
                    .bottom + 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
                  controller: _ageController,
                  decoration: const InputDecoration(
                    labelText: 'Age',
                  ),
                ),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                TextField(
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: false),
                  controller: _idController,
                  decoration: const InputDecoration(
                    labelText: 'Employee ID',
                  ),
                ),
                TextField(
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
                  controller: _designationController,
                  decoration: const InputDecoration(
                    labelText: 'Designation',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: Text(action == 'create' ? 'Create' : 'Update'),
                  onPressed: () async {
                    final String? name = _nameController.text;
                    final double? age =
                    double.tryParse(_ageController.text);
                    final String? email = _emailController.text;
                    final double? id = double.tryParse(_idController.text);
                    final double? designation = double.tryParse(
                        _designationController.text);
                    if (name != null && age != null && email != null &&
                        id != null && designation != null) {
                      if (action == 'create') {
                        // Persist a new product to Firestore
                        await _productss.add({
                          "name": name,
                          "age": age,
                          "email": email,
                          "id": id,
                          "designation": designation
                        });
                      }

                      if (action == 'update') {
                        // Update the product
                        await _productss
                            .doc(documentSnapshot!.id)
                            .update({
                          "name": name,
                          "age": age,
                          "email": email,
                          "id": id,
                          "designation": designation
                        });
                      }

                      // Clear the text fields
                      _nameController.text = '';
                      _ageController.text = '';
                      _emailController.text = '';
                      _idController.text = '';
                      _designationController.text = '';

                      // Hide the bottom sheet
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  // Deleteing a product by id
  Future<void> _deleteEmployee(String employeeId) async {
    await _productss.doc(employeeId).delete();

    // Show a snackbar
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('You have successfully deleted an employee detail')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nepal Telecom'),
      ),
      // Using StreamBuilder to display all products from Firestore in real-time
      body: StreamBuilder(
        stream: _productss.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                streamSnapshot.data!.docs[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: Text(documentSnapshot['id'].toString()),
                    title: Text(documentSnapshot['name']),
                    subtitle: Text(documentSnapshot['age'].toString()),
                    trailing: SizedBox(
                      width: 150,
                      child: Row(
                        children: [
                          /*Column(
                            children: [
                              Text(documentSnapshot['id'].toString()),
                              Text(documentSnapshot['designation'].toString()),
                              Text(documentSnapshot['email']),
                            ],
                          ),*/
                          // Press this button to edit a single product
                          IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () =>
                                  _createOrUpdate(documentSnapshot)),
                          // This icon button is used to delete a single product
                          IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () =>
                                  _deleteEmployee(documentSnapshot.id)),
                          IconButton(
                            icon: const Icon(Icons.more_vert),
                            onPressed: () {
                              _deleteEmployee(documentSnapshot.id);
                              //Text(documentSnapshot['designation'].toString());
                            },

                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      // Add new product
      floatingActionButton: FloatingActionButton(
        onPressed: () => _createOrUpdate(),
        child: const Icon(Icons.add),
      ),
    );
  }
}