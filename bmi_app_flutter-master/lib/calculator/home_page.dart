import 'package:bmi_app_flutter_v6/calculator/bmi_calculator_page.dart';
import 'package:bmi_app_flutter_v6/layout/custom_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text('BMI App'),
        backgroundColor: Colors.brown,
      ),
      drawer: const CustomDrawer(),
      body: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(32),
            child: Text(
              'Body Mass Index',
              style: TextStyle(fontSize: 28, color: Colors.white),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(32),
            child: Text(
              'The body mass index (BMI) or Quetelet index is a value derived from the mass (or weight) and height of an individual. The BMI is defined as the body mass divided by the square of the body height, and is universally expressed in units of kg/m2, resulting from mass in kilograms and height in metres.',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 150),
                child: ElevatedButton(
                  child: const Text(
                    'Open BMI Calculator',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BmiCalculatorPage()),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
