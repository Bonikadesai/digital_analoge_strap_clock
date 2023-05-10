import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
      theme: ThemeData(useMaterial3: true),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int second = 0;
  int minute = 0;
  int hour = 0;
  start() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        second = DateTime.now().second;
        minute = DateTime.now().minute;
        hour = DateTime.now().hour;
      });
      start();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    start();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Digi Clock"),
        centerTitle: true,
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Transform.rotate(
              angle: 3 * pi / 2,
              child: Transform.rotate(
                angle: (second / 60) * (pi * 2),
                child: Divider(
                  thickness: 2,
                  color: Colors.red,
                  indent: w * 0.5,
                  endIndent: 50,
                ),
              ),
            ),
            Transform.rotate(
              angle: 3 * pi / 2,
              child: Transform.rotate(
                angle: (minute / 60) * (pi * 2),
                child: Divider(
                  thickness: 4,
                  color: Colors.green,
                  indent: w * 0.5,
                  endIndent: 80,
                ),
              ),
            ),
            Transform.rotate(
              angle: 3 * pi / 2,
              child: Transform.rotate(
                angle: (hour / 60) * (pi * 2),
                child: Divider(
                  thickness: 6,
                  color: Colors.purple,
                  indent: w * 0.5,
                  endIndent: 110,
                ),
              ),
            ),
            Transform.scale(
              scale: 7.5,
              child: CircularProgressIndicator(
                value: second / 60,
                color: Colors.red,
              ),
            ),
            Transform.scale(
              scale: 6,
              child: CircularProgressIndicator(
                value: minute / 60,
                color: Colors.green,
              ),
            ),
            Transform.scale(
              scale: 4.8,
              child: CircularProgressIndicator(
                value: hour / 24,
                color: Colors.purple,
              ),
            ),
            Text(
              "${DateTime.now().hour} : ${DateTime.now().minute} : ${DateTime.now().second}",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
