
import 'package:flutter/material.dart';
import 'secondPageObjNavigation.dart';


class FirstPageObj extends StatelessWidget {
  const FirstPageObj({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        print('@@button pressed');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SecondPage(person: Person(name: "John", age: 25)),
          ),
        );
      },
      child: Text("Go to Second Page"),
    );
  }
}




