import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:treending/Login/dashboard.dart';
import 'package:treending/Login/tabs.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // backgroundColor: Colors.black,
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (c, userSnapshot) {
            if (userSnapshot.hasData) {
              return Dashboard();
 }
            return Tabs();
          },
        ),
      ),
    );
  }
}
