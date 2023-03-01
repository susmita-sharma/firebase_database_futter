import 'package:firebase_database_futter/homepage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firstpage.dart';
import 'homepage.dart';
import 'loginscreen.dart';
import 'signup.dart';
import 'welcomescreen.dart';
import 'readcsv.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp(

  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      initialRoute: 'welcome_screen',
      routes: {
        'homepage': (context) => const HomePage(),
        'welcome_screen': (context) => WelcomeScreen(),
        'registration_screen': (context) => RegistrationScreen(),
        'login_screen': (context) => LoginScreen(),
        'first_page': (context) => FirstPage(),
        'data_page' : (context) => Csvpage(),
      },




      // routes: {
      //  HomePage.routeName: (context) => HomePage(),
      //}, // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Nepal Telecom',
      home: FirstPage(),
    );
  }
}
