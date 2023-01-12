import 'package:bmi_app_flutter/database/sql_helper.dart';
import 'package:bmi_app_flutter/layout/custom_drawer.dart';
import 'package:bmi_app_flutter/rating/bmi_rating_detail_page.dart';
import 'package:bmi_app_flutter/util/bmi.dart';
import 'package:flutter/material.dart';

class BmiCalculatorResultPage extends StatefulWidget {
  final double height;
  final double weight;

  const BmiCalculatorResultPage(
      {Key? key, required this.height, required this.weight})
      : super(key: key);

  @override
  State<BmiCalculatorResultPage> createState() =>
      _BmiCalculatorResultPageState();
}

class _BmiCalculatorResultPageState extends State<BmiCalculatorResultPage> {
  @override
  void dispose() {
    super.dispose();
  }

  Future<void> storeBmi() async {
    await SQLHelper.createItem(widget.height, widget.weight);

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: Colors.lightGreen,
      content: Text(
        'BMI Data saved.',
        textAlign: TextAlign.center,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final bmi = BMI.compute(widget.height / 100, widget.weight);
    final rating = BMI.rate(bmi);

    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator Result'),
      ),
      drawer: const CustomDrawer(),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 150, left: 20, right: 20),
            child: Row(
              children: <Widget>[
                const Expanded(
                    flex: 1,
                    child: Text(
                      'Your Height:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                Expanded(
                  flex: 1,
                  child: Text(widget.height.toStringAsFixed(2) + " cm"),
                )
              ],
            ),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: <Widget>[
                const Expanded(
                    flex: 1,
                    child: Text(
                      'Your Weight:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                Expanded(
                  flex: 1,
                  child: Text(widget.weight.toStringAsFixed(2) + " kg"),
                )
              ],
            ),
          ),
          const SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: <Widget>[
                const Expanded(
                    flex: 1,
                    child: Text(
                      'Your BMI:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                Expanded(
                  flex: 1,
                  child: Text(bmi.toStringAsFixed(2) + " (rounded)"),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: <Widget>[
                const Expanded(
                    flex: 1,
                    child: Text(
                      'Your Rating:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                Expanded(
                  flex: 1,
                  child: Text(rating.name),
                )
              ],
            ),
          ),
          Expanded(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 150),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    child: const Text('Show Details'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                BmiRatingDetailPage(rating: rating)),
                      );
                    },
                  ),
                  ElevatedButton(
                    child: const Text('Save My BMI'),
                    onPressed: () => storeBmi(),
                  )
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}
