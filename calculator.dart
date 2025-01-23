import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String output = "0";
  String input = "";
  double num1 = 0;
  double num2 = 0;
  String operator = "";

  void _buttonPressed(String value) {
    setState(() {
      if (value == "C") {
        output = "0";
        input = "";
        num1 = 0;
        num2 = 0;
        operator = "";
      } else if (value == "+" || value == "-" || value == "x" || value == "/") {
        num1 = double.tryParse(input) ?? 0;
        operator = value;
        input = "";
      } else if (value == "=") {
        num2 = double.tryParse(input) ?? 0;
        if (operator == "+") {
          output = (num1 + num2).toString();
        } else if (operator == "-") {
          output = (num1 - num2).toString();
        } else if (operator == "x") {
          output = (num1 * num2).toString();
        } else if (operator == "/") {
          output = num2 != 0 ? (num1 / num2).toString() : "Error";
        }
        input = "";
      } else {
        input += value;
        output = input;
      }
    });
  }

  List calculator = [
    "C",
    "+/-",
    "%",
    "/",
    "7",
    "8",
    "9",
    "x",
    "4",
    "5",
    "6",
    "-",
    "1",
    "2",
    "3",
    "+",
    "0",
    ".",
    "=",
  ];

  Widget _buildButton(String text, {Color color = Colors.blue}) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => _buttonPressed(text),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.all(15.0),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Calculator',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Text(
                output,
                style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
            itemCount: calculator.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 60,
                  width: 60,
                  child: Center(
                    child: Text(
                      "${calculator[index]}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  margin: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              );
            },
          ),
          // Row(
          //   children: [
          //     _buildButton("C", color: Colors.green),
          //     _buildButton("+/-", color: Colors.grey),
          //     _buildButton("%", color: Colors.grey),
          //     _buildButton("/", color: Colors.grey),
          //   ],
          // ),
          // Row(
          //   children: [
          //     _buildButton("7", color: Colors.grey),
          //     _buildButton("8", color: Colors.grey),
          //     _buildButton("9", color: Colors.grey),
          //     _buildButton("x", color: Colors.grey),
          //   ],
          // ),
          // Row(
          //   children: [
          //     _buildButton("4", color: Colors.grey),
          //     _buildButton("5", color: Colors.grey),
          //     _buildButton("6", color: Colors.grey),
          //     _buildButton("-", color: Colors.grey),
          //   ],
          // ),
          // Row(
          //   children: [
          //     _buildButton("1", color: Colors.grey),
          //     _buildButton("2", color: Colors.grey),
          //     _buildButton("3", color: Colors.grey),
          //     _buildButton("+", color: Colors.grey),
          //   ],
          // ),
          // Row(
          //   children: [
          //     _buildButton("0", color: Colors.grey),
          //     _buildButton(".", color: Colors.grey),
          //     _buildButton("=", color: Colors.grey),
          //   ],
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          //   child:
          // ),
        ],
      ),
    );
  }
}
