import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text('Gorgeous Login'),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'You registered successfuly',
            style: TextStyle(fontSize: 35,color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
