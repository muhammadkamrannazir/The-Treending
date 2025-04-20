// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:treending/utils/styles.dart';
import 'package:treending/widgets/button.dart';
import 'package:treending/widgets/text.dart';
import 'package:treending/widgets/textfiled.dart';

import 'Model/user_model.dart';
import '../dashboard/dashboard.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    //--------------------------------full Name
    final fullnamefeild = CustomTextField(
      hintText: 'hintText',
      controller: fullnameController,
      validator: (value) {
        RegExp regex = RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("Please Enter full Name");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter Valid Name");
        }
        return null;
      },
      onSaved: (value) {
        fullnameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.name,
    );
    //--------------------------------Email
    final emailfeild = CustomTextField(
      hintText: 'hintText',
      controller: usernameController,
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
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
    );
    //--------------------------------Password
    final passwordfeild = CustomTextField(
      hintText: "Password",
      controller: passwordController,
      textInputAction: TextInputAction.next,
      obscureText: true,
      onSaved: (value) {
        passwordController.text = value!;
      },
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
    );
    //--------------------------------Confirm Password
    final confirmpassword = CustomTextField(
      hintText: 'Confirm Password',
      controller: confirmpasswordController,
      obscureText: true,
      validator: (value) {
        if (confirmpasswordController.text != passwordController.text) {
          return "Password dont Match";
        }
        return null;
      },
      onSaved: (value) {
        confirmpasswordController.text = value!;
      },
      textInputAction: TextInputAction.done,
    );
    //--------------------------------Button

    final loginbutton = CustomButton(
      name: 'Sign Up',
      onPressed: () {
        signUp(emailController.text, passwordController.text);
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: PADDING,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(height: 40.h),
                  fullnamefeild,
                  // SizedBox(height: MediaQuery.of(context).size.height / 30),
                  // usernamefeild,
                  SizedBox(height: 20.h),
                  emailfeild,
                  SizedBox(height: 20.h),
                  passwordfeild,
                  SizedBox(height: 20.h),
                  confirmpassword,
                  SizedBox(height: 170.h),
                  loginbutton,
                  SizedBox(height: 20.h),
                  // Text(
                  //   'Or',
                  //   style: TextStyle(
                  //     color: Colors.black,
                  //     fontSize: 16.0,
                  //     fontFamily: 'WorkSansMedium',
                  //   ),
                  // ),
                  // SizedBox(height: MediaQuery.of(context).size.height / 60),
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
                  //   icon: const Icon(Icons.g_mobiledata),
                  //   label: const Text(
                  //     'Sign up with google',
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

  signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((uid) => {postDetailsToFirebase()})
          .catchError((e) {
            Fluttertoast.showToast(msg: e!.message);
            return <dynamic>{};
          });
    }
  }

  //postDetailsToFirebase
  postDetailsToFirebase() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.fullName = fullnameController.text;
    // userModel.userName = usernameController.text;

    await firebaseFirestore
        .collection('users')
        .doc(user.uid)
        .set(userModel.tomap());
    Fluttertoast.showToast(msg: "Account created successfully :)");
    Get.off(() => HomeScreen());
  }
}
