import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BmiCalculator(),
    );
  }
}

class BmiCalculator extends StatefulWidget {
  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  int currentIndex = 0;
  //Creating the input Controller
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  String bmi = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1a237e),
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "BMI Calculator",
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
          )
        ],
        backgroundColor: Color(0xff1a237e),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    radioButton("Man", Icons.person, Colors.blue, 0),
                    radioButton("Woman", Icons.person, Colors.pink, 1),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              //Creating the Text Filed
              TextField(
                controller: heightController,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                ),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(12.0),
                    hintText: "Heigh in (Cm)",
                    filled: true,
                    fillColor: Color(0xFF0E1242),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    )),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: weightController,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                ),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Weight in (Kg)",
                    filled: true,
                    fillColor: Color(0xff0E1242),
                    contentPadding: EdgeInsets.all(12.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none)),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: double.infinity,
                height: 50.0,
                child: FlatButton(
                  color: Color(0xff3C438C),
                  onPressed: () {
                    double height = double.parse(heightController.value.text);
                    double weight = double.parse(weightController.value.text);
                    double result = calculateBMI(height, weight);
                    setState(() {
                      bmi = result.toStringAsFixed(2);
                    });
                  },
                  child: Text(
                    "Calculate",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Text(
                "Your BMI is",
                style: TextStyle(fontSize: 28.0, color: Colors.white),
              ),
              SizedBox(
                height: 40.0,
              ),
              Text(
                "$bmi",
                style: TextStyle(
                    fontSize: 80.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }

  double calculateBMI(double height, double weight) {
    return weight / (height * height / 10000);
  }

  void changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget radioButton(String value, IconData icon, Color color, int index) {
    return Expanded(
      child: Container(
        height: 80.0,
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: FlatButton(
          color: currentIndex == index ? color : Color(0xff3C438C),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          onPressed: () {
            changeIndex(index);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                //color: currentIndex == index ? Colors.white : color,
                color: Colors.white,
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                value,
                style: TextStyle(
                  //color: currentIndex == index ? Colors.white : color,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
