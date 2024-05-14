import 'package:flutter/material.dart';
import 'package:weightwatcher/bmibrain.dart';
import 'package:weightwatcher/result.dart';
import 'reusablecard.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  int height = 150;
  int weight = 50;
  String bmiValue = "18.5";
  String bmiCategory = "Normal";
  String name = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
        backgroundColor: Colors.pink[800],
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Hello",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: TextField(
                      onChanged: (value) {
                        name = value;
                      },
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: "write your name here",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    header: "WEIGHT",
                    content: weight.toString(),
                    onPlusPress: () {
                      setState(() {
                        weight++;
                      });
                    },
                    onMinusPress: () {
                      setState(() {
                        weight--;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    header: "HEIGHT",
                    content: height.toString(),
                    onPlusPress: () {
                      setState(() {
                        height++;
                      });
                    },
                    onMinusPress: () {
                      setState(() {
                        height--;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          MaterialButton(
            onPressed: () {
              BMIBrain bmi = BMIBrain(height: height, weight: weight);

              bmiValue = bmi.displayBMI();
              bmiCategory = bmi.displayCategory();

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultScreen(
                    bmiValue: bmiValue,
                    bmiCategory: bmiCategory,
                    name: name,
                  ),
                ),
              );
            },
            child: Text("CALCULATE"),
            color: Colors.pink[700],
            height: 100.0,
          ),
        ],
      ),
    );
  }
}
