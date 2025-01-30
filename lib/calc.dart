import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextEditingController? _num1Controller;
  TextEditingController? _num2Controller;
  var _result = 0.0;

  @override
  void initState() {
    super.initState();
    _num1Controller = TextEditingController();
    _num2Controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _num1Controller!.dispose();
    _num2Controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: height * 0.4,
            decoration: const BoxDecoration(
              color: Color(0xff00a0a8),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: height * 0.1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _num1Controller,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xfffef5ec),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(width: 0.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide:
                            const BorderSide(color: Colors.black, width: 3),
                          ),
                          hintText: "Num 1",
                          hintStyle: const TextStyle(color: Colors.grey),
                        ),
                      ),
                      SizedBox(height: height * 0.01),
                      TextFormField(
                        controller: _num2Controller,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xfffef5ec),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(width: 0.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide:
                            const BorderSide(color: Colors.black, width: 3),
                          ),
                          hintText: "Num 2",
                          hintStyle: const TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: height * 0.075),
            child: Row(
              children: [
                Container(
                  height: height * 0.05,
                  width: width * 0.2,
                  color: const Color(0xff00a0a8),
                ),
                Expanded(
                    child: Center(
                        child: Text("Result: ${_result.toStringAsFixed(2)}"))),
                Container(
                  height: height * 0.05,
                  width: width * 0.2,
                  color: const Color(0xff00a0a8),
                ),
              ],
            ),
          ),
          Container(
            height: height * 0.4,
            decoration: const BoxDecoration(
              color: Color(0xff00a0a8),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FloatingActionButton(
                    backgroundColor: Color(0xff00c4ce),
                    onPressed: () {
                      setState(() {
                        _result =
                            double.parse(_num1Controller!.text.toString()) +
                                double.parse(_num2Controller!.text.toString());
                      });
                    },
                    child: const Text("+", style: TextStyle(fontSize: 24,color: Colors.white)),
                  ),
                  FloatingActionButton(
                    backgroundColor: Color(0xff00c4ce),
                    onPressed: () {
                      setState(() {
                        _result =
                            double.parse(_num1Controller!.text.toString()) -
                                double.parse(_num2Controller!.text.toString());
                      });
                    },
                    child: const Text("-", style: TextStyle(fontSize: 24,color: Colors.white)),
                  ),
                  FloatingActionButton(backgroundColor: Color(0xff00c4ce),
                    onPressed: () {
                      setState(() {
                        _result =
                            double.parse(_num1Controller!.text.toString()) *
                                double.parse(_num2Controller!.text.toString());
                      });
                    },
                    child: const Text("x", style: TextStyle(fontSize: 24,color: Colors.white)),
                  ),
                  FloatingActionButton(
                    backgroundColor: Color(0xff00c4ce),
                    onPressed: () {
                      setState(() {
                        _result =
                            double.parse(_num1Controller!.text.toString()) /
                                double.parse(_num2Controller!.text.toString());
                      });
                    },
                    child: const Text("÷", style: TextStyle(fontSize: 24,color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}