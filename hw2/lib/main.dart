import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CalculatorUI(),
    );
  }
}

class CalculatorUI extends StatefulWidget {
  const CalculatorUI({super.key});

  @override
  State<CalculatorUI> createState() => _CalculatorUIState();
}

class _CalculatorUIState extends State<CalculatorUI> {
  String displayText = "0";
  String input = "";

  void onButtonPress(String value) {
    setState(() {
      if (value == "C") {
        input = "";
        displayText = "0";
      } else {
        input += value;
        displayText = input;
      }
    });
  }

  Widget buildButton(String text, Color color) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () => onButtonPress(text),
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: const EdgeInsets.symmetric(vertical: 22),
            shape: const CircleBorder(),
            elevation: 0,
          ),
          child: Text(
            text,
            style: const TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF4A90E2), Color(0xFF357ABD)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(20),
              child: Text(
                displayText,
                style: const TextStyle(color: Colors.white, fontSize: 60),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      buildButton("7", const Color(0xFF6FA8DC)),
                      buildButton("8", const Color(0xFF6FA8DC)),
                      buildButton("9", const Color(0xFF6FA8DC)),
                      buildButton("/", const Color(0xFF5B8ED1)),
                    ],
                  ),
                  Row(
                    children: [
                      buildButton("4", const Color(0xFF6FA8DC)),
                      buildButton("5", const Color(0xFF6FA8DC)),
                      buildButton("6", const Color(0xFF6FA8DC)),
                      buildButton("*", const Color(0xFF5B8ED1)),
                    ],
                  ),
                  Row(
                    children: [
                      buildButton("1", const Color(0xFF6FA8DC)),
                      buildButton("2", const Color(0xFF6FA8DC)),
                      buildButton("3", const Color(0xFF6FA8DC)),
                      buildButton("-", const Color(0xFF5B8ED1)),
                    ],
                  ),
                  Row(
                    children: [
                      buildButton("0", const Color(0xFF6FA8DC)),
                      buildButton("%", const Color(0xFF82B4E7)),
                      buildButton("C", const Color(0xFF82B4E7)),
                      buildButton("+", const Color(0xFF5B8ED1)),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: ElevatedButton(
                            onPressed: () => onButtonPress("="),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 22),
                              backgroundColor: const Color(0xFF5B8ED1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              elevation: 0,
                            ),
                            child: const Text(
                              "=",
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}