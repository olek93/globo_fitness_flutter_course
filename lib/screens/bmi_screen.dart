import 'package:flutter/material.dart';
// import 'package:globo_fitness/shared/ui/menu_drawer.dart';
import 'package:globo_fitness/shared/ui/bottom_picker.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final TextEditingController textEditingControllerHeight =
      TextEditingController();
  final TextEditingController textEditingControllerWeight =
      TextEditingController();

  final double fontSize = 18;
  String result = '';
  bool isMetric = true;
  bool isImperial = false;
  double? weight;
  double? height;
  late List<bool> isSelected;
  String heightMessage = '';
  String weightMessage = '';

  @override
  void initState() {
    isSelected = [isMetric, isImperial];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    heightMessage =
        "Please input your height in ${isMetric ? "centimetres" : "inches"}";
    weightMessage =
        "Please input your weight in ${isMetric ? "kilograms" : "pounds"}";
    return Scaffold(
        appBar: AppBar(title: const Text("BMI Calculator")),
        // drawer: const MenuDrawer(),
        bottomNavigationBar: const BottomPicker(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ToggleButtons(
                isSelected: isSelected,
                onPressed: updateToggleButtonsState,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Metric',
                      style: TextStyle(fontSize: fontSize),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Imperial',
                      style: TextStyle(fontSize: fontSize),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: textEditingControllerHeight,
                  decoration: InputDecoration(
                      labelText: 'Height',
                      hintText: heightMessage,
                      suffixText: isMetric ? "cm" : "in",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: textEditingControllerWeight,
                  decoration: InputDecoration(
                      labelText: 'Weight',
                      hintText: weightMessage,
                      suffixText: isMetric ? "kg" : "lbs",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                  keyboardType: TextInputType.number,
                ),
              ),
              ElevatedButton(
                onPressed: findBmi,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Calculate",
                    style: TextStyle(fontSize: fontSize),
                  ),
                ),
              ),
              Text(
                result,
                style: TextStyle(fontSize: fontSize),
              ),
            ],
          ),
        ));
  }

  void updateToggleButtonsState(int index) {
    if (index == 0) {
      isMetric = true;
      isImperial = false;
    } else {
      isMetric = false;
      isImperial = true;
    }
    setState(() {
      isSelected = [isMetric, isImperial];
    });
  }

  void findBmi() {
    double bmi = 0;
    double height = double.tryParse(textEditingControllerHeight.text) ?? 0;
    double weight = double.tryParse(textEditingControllerWeight.text) ?? 0;
    String txtResult = "";
    const String calculationFailMessage =
        "Please input correct values. Maybe you have used a comma instead of a period?";
    if (isMetric) {
      bmi = (weight > 0 && height > 0)
          ? (weight / ((height / 100) * (height / 100)))
          : 0;
      txtResult = (bmi > 0)
          ? prepareBmiMessage(bmi, height, weight)
          : calculationFailMessage;
    } else {
      bmi = (weight > 0 && height > 0) ? (weight / (height * height) * 703) : 0;
      txtResult = (bmi > 0)
          ? prepareBmiMessage(bmi, height, weight)
          : calculationFailMessage;
    }

    setState(() {
      result = txtResult;
    });
  }

  String prepareBmiMessage(double bmi, double height, double weight) {
    String successMessage = "Your BMI is ${bmi.toStringAsFixed(2)}";
    String parsingFailureMessage =
        "Please input correct values. Maybe you have used a comma instead of a period?";
    String tooBigWeightMessage =
        "Your weight seems too be too big... Please remember to input your weight in kilograms or pounds.";
    String message = "";
    if (bmi > 0) {
      if (weight > 300) {
        message = tooBigWeightMessage;
      } else {
        message = successMessage;
      }
    } else {
      message = parsingFailureMessage;
    }
    return message;
  }
}
