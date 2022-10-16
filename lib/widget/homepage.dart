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
      margin: const EdgeInsets.symmetric(horizontal: 12.0),
      height: 80.0,
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        radioButton('Man', Colors.blue, 0),
                        radioButton('Woman', Colors.pink, 1),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text('Your Height in Cm: ',
                        style: TextStyle(
                          fontSize: 18.0,
                        )),
                    const TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: 'Your height in Cm', filled: true),
                    )

                    // creating the input form.
                  ],
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

  // creating a new custom widget

  Widget radioButton(String value, Color color, int index) {
    return Expanded(
        child: Container(
      child: ElevatedButton(
        //  makeing the color of the button change in function of it's selected or not.

        color: currentindex == index
            ? color
            : Colors.grey[
                200], // if the current index is equal to the button index then put the color , the main color that will define otherwise make it grey.
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ), // adding the round button.
        onPressed: () {
          // clicking the button , the current index will have the value of the button's index.
          changeIndex(index);
        },

        child: Text(
          value,
          style: TextStyle(
            color: currentindex == index ? Colors.white : color,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ));
  }
}
