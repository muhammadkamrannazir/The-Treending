// ignore_for_file: prefer_const_constructors, camel_case_types, file_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

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
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 1.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 60.h),
                  //--------------------------------Email
                  TextFormField(
                    autofocus: false,
                    controller: emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(hintText: 'E-mail'),
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
                  ),
                  SizedBox(height: 50.h),
                  //------------------------------Password
                  TextFormField(
                    autofocus: false,
                    obscureText: true,
                    controller: passwordcontroller,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(hintText: 'Password'),
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
                  ),
                  SizedBox(height: 50.h),
                  //------------------------------Button
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 18,
                    width: MediaQuery.of(context).size.width / 1.8,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(
                          Colors.blue,
                        ),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      child: Text(
                        'Sign In',
                        style: TextStyle(color: Colors.white, fontSize: 20.sp),
                      ),
                      onPressed:
                          () => signIn(
                            emailcontroller.text,
                            passwordcontroller.text,
                          ),
                    ),
                  ),
                  SizedBox(height: 5.h),

                  // TextButton(
                  //   onPressed: () {},
                  //   child: const Text(
                  //     'Forgot Password?',
                  //     style: TextStyle(
                  //       decoration: TextDecoration.underline,
                  //       color: Colors.black,
                  //       fontSize: 16.0,
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: 10),
                  // Text(
                  //   'Or',
                  //   style: TextStyle(
                  //     color: Colors.black,
                  //     fontSize: 16.0,
                  //     fontFamily: 'WorkSansMedium',
                  //   ),
                  // ),
                  // SizedBox(height: 20),
                  // TextButton.icon(
                  //   style: TextButton.styleFrom(
                  //     textStyle: const TextStyle(color: Colors.black),
                  //     backgroundColor: Colors.white,
                  //     shape: RoundedRectangleBorder(
                  //       side: BorderSide(color: Colors.grey),
                  //       borderRadius: BorderRadius.circular(24.0),
                  //     ),
                  //   ),
                  //   onPressed: () => {},
                  //   icon: Icon(Icons.adaptive.flip_camera),
                  //   label: const Text(
                  //     'Sign in with google',
                  //     style: TextStyle(color: Colors.black),
                  //   ),
                  // ),
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
