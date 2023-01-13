import 'package:flutter/material.dart';

import '../layout/custom_drawer.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text('BMI Apssp'),
        backgroundColor: Colors.brown,
      ),
      drawer: const CustomDrawer(),
      body: Column(
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.all(32),
            child: Text(
              'Body Mass Indesssex',
              style: TextStyle(fontSize: 28, color: Colors.white),
            ),
          ),


        ],
      ),
    );
  }
}
