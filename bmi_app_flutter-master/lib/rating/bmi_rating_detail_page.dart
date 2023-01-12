import 'package:bmi_app_flutter/util/bmi_rating.dart';
import 'package:flutter/material.dart';

class BmiRatingDetailPage extends StatefulWidget {
  final BMIRating rating;

  const BmiRatingDetailPage({Key? key, required this.rating}) : super(key: key);

  @override
  State<BmiRatingDetailPage> createState() => _BmiRatingDetailPageState();
}

class _BmiRatingDetailPageState extends State<BmiRatingDetailPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Rating Detail'),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 150),
          Center(
            child: Text(
              widget.rating.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          const SizedBox(height: 25),
          Center(
            child: Text(
              'Values from ${widget.rating.low.toStringAsFixed(2)} to less than ${widget.rating.high.toStringAsFixed(2)}.',
              style: const TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
