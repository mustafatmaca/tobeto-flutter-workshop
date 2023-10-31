import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 3, 104, 48),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Mustafa Atmaca",
                style: TextStyle(fontSize: 35, color: Colors.white),
              ),
              Text(
                "Mobil Geliştirici Flutter - 1A",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              Text(
                "31/10/2023",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
