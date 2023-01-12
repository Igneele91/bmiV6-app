import 'package:bmi_app_flutter/calculator/bmi_calculator_page.dart';
import 'package:bmi_app_flutter/history/bmi_history_page.dart';
import 'package:bmi_app_flutter/rating/bmi_rating_page.dart';
import 'package:flutter/material.dart';

import '../calculator/home_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const SizedBox(
            height: 110.0,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'BMI App Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              )
            },
          ),
          ListTile(
            leading: const Icon(Icons.calculate),
            title: const Text('BMI Calculator'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const BmiCalculatorPage()),
              )
            },
          ),
          ListTile(
            leading: const Icon(Icons.format_list_numbered_rtl),
            title: const Text('BMI Rating'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BmiRatingPage()),
              )
            },
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('BMI History'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BmiHistoryPage()),
              )
            },
          ),
        ],
      ),
    );
  }
}
