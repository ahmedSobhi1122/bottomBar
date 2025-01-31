import 'package:bottombar/result_screen.dart';
import 'package:flutter/material.dart';

import 'data_intent.dart';

class CalculateBmiScreen extends StatefulWidget {
  const CalculateBmiScreen({super.key});

  @override
  State<CalculateBmiScreen> createState() => _CalculateBmiScreenState();
}

class _CalculateBmiScreenState extends State<CalculateBmiScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: const Color(0xff0a0e21),
      appBar: AppBar(
        backgroundColor: const Color(0xff0a0e21),
        title: const Text(
          "BMI Calculator",
          style: TextStyle(color: Colors.white, fontSize: 26),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height / 30,
            ),
            const Selected(),
            SizedBox(
              height: height / 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    const Weight(),
                    SizedBox(height: height / 40),
                    const Age(),
                  ],
                ),
                const CustomSlider(),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          if (DataIntent.notNull()) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ResultScreen(),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Please fill all the fields'),
                duration: Duration(seconds: 2),
              ),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          fixedSize: Size(double.infinity, 75),
          shape: RoundedRectangleBorder(),
        ),
        child: const Text(
          "Calculate",
          style: TextStyle(color: Colors.white, fontSize: 26),
        ),
      ),
    );
  }
}

class Weight extends StatefulWidget {
  const Weight({
    super.key,
  });

  @override
  State<Weight> createState() => _WeightState();
}

class _WeightState extends State<Weight> {
  double weight = DataIntent.getWeight() ?? 77.0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Container(
      height: height / 4.2,
      width: width / 2.5,
      decoration: BoxDecoration(
        color: Color(0xff1d1e33),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Weight",
            style: TextStyle(color: Colors.white38, fontSize: 20),
          ),
          Text(
            "${weight.round()}",
            style: TextStyle(color: Colors.white, fontSize: 26),
          ),
          SizedBox(height: height / 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    if (weight > 0.0) weight--;
                    DataIntent.pushWeight(weight: weight);
                  });
                },
                shape: const CircleBorder(),
                child: const Icon(
                  Icons.remove,
                  size: 30,
                  color: Colors.white,
                ),
                backgroundColor: Colors.red,
              ),
              SizedBox(width: 10),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    weight++;
                    DataIntent.pushWeight(weight: weight);
                  });
                },
                shape: const CircleBorder(),
                child: const Icon(
                  Icons.add,
                  size: 30,
                  color: Colors.white,
                ),
                backgroundColor: Colors.red,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Age extends StatefulWidget {
  const Age({
    super.key,
  });

  @override
  State<Age> createState() => _AgeState();
}

class _AgeState extends State<Age> {
  double age = DataIntent.getAge() ?? 18;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Container(
      height: height / 4.2,
      width: width / 2.5,
      decoration: BoxDecoration(
        color: Color(0xff1d1e33),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Age",
            style: TextStyle(color: Colors.white38, fontSize: 20),
          ),
          Text(
            "${age.round()}",
            style: TextStyle(color: Colors.white, fontSize: 26),
          ),
          SizedBox(height: height / 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    if (age > 0.0) age--;
                    DataIntent.pushAge(age: age);
                  });
                },
                shape: const CircleBorder(),
                child: const Icon(
                  Icons.remove,
                  size: 30,
                  color: Colors.white,
                ),
                backgroundColor: Colors.red,
              ),
              SizedBox(width: 10),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    age++;
                    DataIntent.pushAge(age: age);
                  });
                },
                shape: const CircleBorder(),
                child: const Icon(
                  Icons.add,
                  size: 30,
                  color: Colors.white,
                ),
                backgroundColor: Colors.red,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomSlider extends StatefulWidget {
  const CustomSlider({
    super.key,
  });

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double val = DataIntent.getHeight() ?? 77;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Container(
      width: width / 2.5,
      height: height / 2,
      decoration: BoxDecoration(
        color: Color(0xff1d1e33),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          SizedBox(
            height: height / 20,
          ),
          const Text(
            "height",
            style: TextStyle(color: Colors.white38, fontSize: 20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${val.round()}",
                style: const TextStyle(color: Colors.white, fontSize: 26),
              ),
              const Text(
                "cm",
                style: TextStyle(color: Colors.white, fontSize: 16),
              )
            ],
          ),
          Expanded(
            child: RotatedBox(
              quarterTurns: 1,
              child: Slider(
                value: val,
                min: 0,
                max: 210,
                divisions: 210,
                onChanged: (value) {
                  setState(() {
                    val = value;
                    DataIntent.pushHeight(height: value);
                  });
                },
                label: "${val.round()}",
                inactiveColor: Colors.white38,
                activeColor: Colors.red,
                thumbColor: Colors.red,
              ),
            ),
          ),
          SizedBox(
            height: height / 20,
          ),
        ],
      ),
    );
  }
}

class Selected extends StatefulWidget {
  const Selected({
    super.key,
  });

  @override
  State<Selected> createState() => _SelectedState();
}

class _SelectedState extends State<Selected> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              DataIntent.pushType(type: "Male");
              selected = false;
            });
          },
          child: Container(
            height: 200,
            width: width / 2.5,
            decoration: BoxDecoration(
              color: selected ? Color(0xff1d1e33) : Color(0xff111328),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.3),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.male_rounded,
                  size: 80,
                  color: Colors.white,
                ),
                Text(
                  "Male",
                  style: TextStyle(color: Colors.white38, fontSize: 20),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              DataIntent.pushType(type: "Female");
              selected = true;
            });
          },
          child: Container(
            width: width / 2.5,
            height: 200,
            decoration: BoxDecoration(
              color: selected ? Color(0xff111328) : Color(0xff1d1e33),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.3),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.female_rounded,
                  size: 80,
                  color: Colors.white,
                ),
                Text(
                  "Female",
                  style: TextStyle(color: Colors.white38, fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
