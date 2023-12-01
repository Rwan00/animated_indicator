import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double p = 0.8;
  double p2 = 1;
  double p3 = 1;
  double right = 200;
  double top = 400;
  Color clr = Colors.red;
  String title = "البحيرة";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Indicator"),
      ),
      body: Center(
        child: Stack(children: [
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  p = 0.8;
                  p2 = 1;
                  p3 = 1;
                  right = 280;
                  clr = Colors.red.withOpacity(0.5);
                  title = "اسكندرية";
                  top = 350;
                });
              },
              child: CircularPercentIndicator(
                radius: 80,
                animation: true,
                animationDuration: 1000,
                lineWidth: 30,
                percent: p,
                circularStrokeCap: CircularStrokeCap.butt,
                backgroundColor: Colors.yellow.withOpacity(0.5),
                progressColor: Colors.red.withOpacity(0.5),
              ),
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  p = 1;
                  p3 = 1;
                  p2 = 0.6;
                  right = 250;
                  title = "القاهرة";
                  clr = Colors.green.withOpacity(0.4);
                  top = 380;
                });
              },
              child: CircularPercentIndicator(
                radius: 50,
                animation: true,
                animationDuration: 500,
                lineWidth: 20,
                percent: p2,
                circularStrokeCap: CircularStrokeCap.butt,
                backgroundColor: Colors.orange.withOpacity(0.4),
                progressColor: Colors.green.withOpacity(0.4),
              ),
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  p = 1;
                  p2 = 1;
                  p3 = 0.3;
                  right = 200;
                  clr = Colors.red;
                  title = "البحيرة";
                  top = 400;
                });
              },
              child: CircularPercentIndicator(
                radius: 20,
                animation: true,
                animationDuration: 500,
                lineWidth: 20,
                percent: p3,
                circularStrokeCap: CircularStrokeCap.butt,
                backgroundColor: Colors.yellow,
                progressColor: Colors.red,
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(seconds: 2),
            curve: Curves.decelerate,
            right: right,
            top: top,
            child: Container(
              height: 20,
              width: 85,
              color: Colors.grey,
              child: Row(
                children: [
                  const SizedBox(width: 5,),
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: clr
                    ),
                  ),
                  const SizedBox(width: 5,),
                  Text(title)
                ],
              ),
            ),
          )
        ],),
      ),
    );
  }
}
