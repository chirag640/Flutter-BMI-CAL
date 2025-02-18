import 'package:bmi_calculator/pages/result_page.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String selectedGender = "Male"; // Default selected gender
  int age = 30;
  int weight = 78;
  double height = 160;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 100),
          const Text(
            "BMI Calculator",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          // Age & Weight Cards
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildCard("Age", age, () {
                  setState(() {
                    if (age > 0) age--;
                  });
                }, () {
                  setState(() {
                    age++;
                  });
                }),
                buildCard("Weight (KG)", weight, () {
                  setState(() {
                    if (weight > 1) weight--;
                  });
                }, () {
                  setState(() {
                    weight++;
                  });
                }),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Height Slider
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: 333,
              height: 183,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text("Height (CM)", style: TextStyle(fontSize: 17.6)),
                    Text(
                      height.toStringAsFixed(1),
                      style: const TextStyle(
                          fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                    Slider(
                      value: height,
                      min: 50,
                      max: 250,
                      divisions: 200,
                      label: height.toStringAsFixed(1),
                      activeColor: const Color(0xFF6C63FF),
                      onChanged: (value) {
                        setState(() {
                          height = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Gender Selection
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: 333,
              height: 135,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text("Gender",
                        style: TextStyle(
                            fontSize: 17.6, fontWeight: FontWeight.bold)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildGenderButton("Male"),
                          buildGenderButton("Female"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Calculate Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: 332,
              height: 75,
              child: ElevatedButton(
                onPressed: () {
                  // Calculate BMI
                  double heightInMeters = height / 100;
                  double bmi = weight / (heightInMeters * heightInMeters);

                  // Determine BMI Category
                  String category;
                  if (bmi < 18.5) {
                    category = "Underweight";
                  } else if (bmi >= 18.5 && bmi < 24.9) {
                    category = "Normal Weight";
                  } else if (bmi >= 25 && bmi < 29.9) {
                    category = "Overweight";
                  } else {
                    category = "Obesity";
                  }

                  // Navigate to Result Page
                  Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        ResultPage(bmiResult: bmi, bmiCategory: category),
                  ));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6C63FF),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(320, 65),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                ),
                child: const Text("Calculate", style: TextStyle(fontSize: 20)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Function to build Age & Weight cards
  Widget buildCard(String title, int value, VoidCallback onDecrease,
      VoidCallback onIncrease) {
    return SizedBox(
      width: 156,
      height: 175,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(title, style: const TextStyle(fontSize: 17.6)),
            Text("$value",
                style:
                    const TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF6C63FF),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: IconButton(
                    icon:
                        const Icon(Icons.remove, size: 30, color: Colors.white),
                    onPressed: onDecrease,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF6C63FF),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.add, size: 30, color: Colors.white),
                    onPressed: onIncrease,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Gender selection button
  Widget buildGenderButton(String gender) {
    bool isSelected = selectedGender == gender;
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedGender = gender;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? const Color(0xFF6C63FF) : Colors.grey[300],
          foregroundColor: isSelected ? Colors.white : Colors.black,
          minimumSize: const Size(100, 50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        child: Text(gender),
      ),
    );
  }
}
