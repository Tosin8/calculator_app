import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'BMI Caculator',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0.0,
          backgroundColor: const Color(0xfffafafa),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.settings,
                  color: Colors.black,
                )),
          ],
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: const [],
                ))),
      ),
    );
  }

// declaring a function to change the index value on button pressed.

  void changeIndex(int index) {
    setState(() {
      currentindex = index;
    });
  }
}
