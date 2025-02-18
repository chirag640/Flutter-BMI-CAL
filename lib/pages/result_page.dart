import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final double bmiResult;
  final String bmiCategory;

  const ResultPage({super.key, required this.bmiResult, required this.bmiCategory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "BMI Calculator",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text(
                "Your Body Mass Index",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                elevation: 5,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Text(
                        "BMI Result",
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        bmiResult.toStringAsFixed(2), // Display BMI value
                        style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.indigo),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        bmiCategory, // Display BMI Category
                        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "BMI Categories:",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      const Text("• Underweight: BMI < 18.5", style: TextStyle(fontSize: 16)),
                      const Text("• Normal weight: BMI 18.5–24.9", style: TextStyle(fontSize: 16)),
                      const Text("• Overweight: BMI 25–29.9", style: TextStyle(fontSize: 16)),
                      const Text("• Obesity: BMI 30+", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Go back to CalculatorPage
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6C63FF),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(300, 60),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text(
                  "RE-CALCULATE YOUR BMI",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
