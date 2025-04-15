// ignore_for_file: prefer_const_constructors, duplicate_ignore
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Login/tabs.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // options: FirebaseOptions(
    //   apiKey: "AIzaSyDYXJ2ylisknujhBCBz1Pd2vEI2RDkCNUw",
    //   authDomain: "itour-login-only.firebaseapp.com",
    //   projectId: "itour-login-only",
    //   storageBucket: "itour-login-only.appspot.com",
    //   messagingSenderId: "724248870891",
    //   appId: "1:724248870891:web:2e988d0eb362026fe5e3ae",
    // ),
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // backgroundColor: Colors.black,
        body: Tabs(),
      ),
    );
  }
}
