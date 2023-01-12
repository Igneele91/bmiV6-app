import 'bmi_rating.dart';

class BMI {
  static final List<BMIRating> bmiRatings = [
    BMIRating("very severely underweight", -999.0, 15.0),
    BMIRating("severely underweight", 15.0, 16.0),
    BMIRating("moderately underweight", 16.0, 17.0),
    BMIRating("slightly underweight", 17.0, 18.5),
    BMIRating("normal (healthy weight)", 18.5, 25.0),
    BMIRating("overweight", 25.0, 30.0),
    BMIRating("moderately obese (class I)", 30.0, 35.0),
    BMIRating("severely obese (class II)", 35.0, 40.0),
    BMIRating("very severely obese (class III)", 40.0, 999.0)
  ];

  static double compute(double height, double weight) {
    return weight / (height * height);
  }

  static BMIRating rate(double bmi) {
    return bmiRatings.firstWhere((element) => bmi < element.high);
  }
}
