import 'package:flutter/material.dart';

import 'data_intent.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  double result = 0.0;

  @override
  void initState() {
    super.initState();
    double weight = DataIntent.getWeight()!;
    double height = DataIntent.getHeight()! / 100;
    result = weight / (height * height);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: const Color(0xff0a0e21),
      appBar: AppBar(
        backgroundColor: const Color(0xff0a0e21),
        title: const Text(
          "BMI Calculator",
          style: TextStyle(color: Colors.white, fontSize: 26),
        ),
        centerTitle: true,
        leading: const BackButton(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Your Result",
                style: TextStyle(color: Colors.white, fontSize: 46),
              ),
              SizedBox(
                height: height / 20,
              ),
              Container(
                height: height / 1.8,
                width: width / 1.2,
                decoration: BoxDecoration(
                  color: const Color(0xff1d1e33),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      getCategoryText(result),
                      style: TextStyle(
                          color: getCategoryColor(result),
                          fontSize: 36,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      result.toStringAsFixed(2),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 70,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      getFeedbackMessage(result),
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text(
          "Re-Calculate",
          style: TextStyle(color: Colors.white, fontSize: 26),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          fixedSize: const Size(double.infinity, 75),
          shape: const RoundedRectangleBorder(),
        ),
      ),
    );
  }
}

String getCategoryText(double result) {
  if (result > 35) return "EXTREMELY OBESE";
  if (result > 30) return "OBESE";
  if (result > 25) return "OVERWEIGHT";
  if (result > 18.5) return "NORMAL";
  return "UNDERWEIGHT";
}

Color getCategoryColor(double result) {
  if (result > 35) return Colors.redAccent;
  if (result > 30) return Colors.orange;
  if (result > 25) return Colors.yellow;
  if (result > 18.5) return Colors.yellowAccent;
  return Colors.green;
}

String getFeedbackMessage(double result) {
  if (result > 35) {
    return "Your body weight is extremely high. It's important to consult with a healthcare professional to work on a healthy lifestyle plan.";
  } else if (result > 30) {
    return "You are in the obese range. Consider incorporating regular exercise and a balanced diet to improve your health.";
  } else if (result > 25) {
    return "You are slightly overweight. Staying active and eating nutritious foods can help achieve a healthier weight.";
  } else if (result > 18.5) {
    return "You have a normal body weight. Great job maintaining a healthy lifestyle! Keep it up!";
  } else {
    return "Your weight is below normal. A healthcare provider can help ensure you’re meeting your nutritional needs.";
  }
}
