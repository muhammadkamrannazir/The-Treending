// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:treending/Login/sign%20in.dart';

import 'Model/user_model.dart';
import 'dashboard.dart';

class Sign_Up extends StatefulWidget {
  const Sign_Up({super.key});

  @override
  State<Sign_Up> createState() => _Sign_UpState();
}

class _Sign_UpState extends State<Sign_Up> {
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
    final fullnamefeild = TextFormField(
      autofocus: false,
      controller: fullnameController,
      onSaved: (value) {
        fullnameController.text = value!;
      },
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
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 15.h),
        hintText: "Name",
      ),
    );
    //--------------------------------user Name
    final usernamefeild = TextFormField(
      autofocus: false,
      controller: usernameController,
      onSaved: (value) {
        usernameController.text = value!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter user Name");
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 15.h),
        hintText: "Last Name",
      ),
    );
    //--------------------------------Email
    final emailfeild = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        emailController.text = value!;
      },
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
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 15.h),
        hintText: "E-mail",
      ),
    );
    //--------------------------------Password
    final passwordfeild = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: passwordController,
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
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 15.h),
        hintText: "Password",
      ),
    );
    //--------------------------------Confirm Password
    final confirmpassword = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: confirmpasswordController,
      onSaved: (value) {
        confirmpasswordController.text = value!;
      },
      validator: (value) {
        if (confirmpasswordController.text != passwordController.text) {
          return "Password dont Match";
        }
        return null;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 15.h),
        hintText: "Confirm Password",
      ),
    );
    //--------------------------------Button

    final loginbutton = SizedBox(
      height: MediaQuery.of(context).size.height / 18,
      width: MediaQuery.of(context).size.width / 1.8,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
          ),
        ),
        onPressed: () {
          signUp(emailController.text, passwordController.text);
        },
        child: Text(
          'Sign Up',
          style: TextStyle(color: Colors.white, fontSize: 20.sp),
        ),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 1.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height / 30),
                  fullnamefeild,
                  // SizedBox(height: MediaQuery.of(context).size.height / 30),
                  // usernamefeild,
                  SizedBox(height: MediaQuery.of(context).size.height / 30),
                  emailfeild,
                  SizedBox(height: MediaQuery.of(context).size.height / 30),
                  passwordfeild,
                  SizedBox(height: MediaQuery.of(context).size.height / 30),
                  confirmpassword,
                  SizedBox(height: MediaQuery.of(context).size.height / 20),
                  loginbutton,
                  SizedBox(height: MediaQuery.of(context).size.height / 60),
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
    Get.to(() => HomeScreen());
  }
}
