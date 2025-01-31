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
    _num1Controller?.dispose();
    _num2Controller?.dispose();
    super.dispose();
  }

  double _parseInput(String value) {
    return double.tryParse(value) ?? 0.0;
  }

  void _calculate(String operation) {
    setState(() {
      double num1 = _parseInput(_num1Controller!.text);
      double num2 = _parseInput(_num2Controller!.text);

      switch (operation) {
        case "+":
          _result = num1 + num2;
          break;
        case "-":
          _result = num1 - num2;
          break;
        case "x":
          _result = num1 * num2;
          break;
        case "÷":
          _result = (num2 == 0) ? double.infinity : num1 / num2;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;

    return Column(
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTextField(_num1Controller!, "Num 1"),
                SizedBox(height: height * 0.02),
                _buildTextField(_num2Controller!, "Num 2"),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: height * 0.05),
          child: Text(
            "Result: ${_result.toStringAsFixed(2)}",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            decoration: const BoxDecoration(
              color: Color(0xff00a0a8),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 35,
              mainAxisSpacing: 40,
              padding: const EdgeInsets.all(40),
              children: [
                _buildButton("+"),
                _buildButton("-"),
                _buildButton("x"),
                _buildButton("÷"),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.black26, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.black, width: 2),
        ),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
      ),
    );
  }

  Widget _buildButton(String operation) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        padding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      onPressed: () => _calculate(operation),
      child: Text(operation, style: const TextStyle(fontSize: 24)),
    );
  }
}
