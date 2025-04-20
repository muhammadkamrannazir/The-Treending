// ignore_for_file: prefer_const_constructors, camel_case_types, file_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:treending/utils/styles.dart';
import 'package:treending/widgets/button.dart';
import 'package:treending/widgets/textfiled.dart';

import '../dashboard/dashboard.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: PADDING,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 118.h),
                  //--------------------------------Email
                  CustomTextField(
                    hintText: 'E mail',
                    controller: emailcontroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("Please Enter Email");
                      }
                      String pattern = r'\w+@\w+\.\w+';
                      if (!RegExp(pattern).hasMatch(value)) {
                        return 'Invalid Email format';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      emailcontroller.text = value!;
                    },
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 20.h),
                  //------------------------------Password
                  CustomTextField(
                    hintText: 'Password',
                    controller: passwordcontroller,
                    obscureText: true,
                    validator: (value) {
                      RegExp regex = RegExp(r'^.{6,}$');
                      if (value!.isEmpty) {
                        return ("Please Enter Password");
                      }
                      if (!regex.hasMatch(value)) {
                        return ("Please Enter Valid Password(Min 6 character)");
                      }
                      return null;
                    },
                    onSaved: (value) {
                      passwordcontroller.text = value!;
                    },
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SizedBox(height: 245.h),
                  //------------------------------Button
                  CustomButton(
                    name: 'Sign In',
                    onPressed:
                        () => signIn(
                          emailcontroller.text,
                          passwordcontroller.text,
                        ),
                  ),
                  SizedBox(height: 5.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then(
            (uid) => {
              Fluttertoast.showToast(msg: "Login Successful"),
              Get.to(HomeScreen()),
            },
          )
          // ignore: body_might_complete_normally_catch_error
          .catchError((e) {
            Fluttertoast.showToast(msg: e!.message);
          });
    }
  }
}
