import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentindex = 0;

  late String result;

  // declaring the inputController to get the inputs value.

  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

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
                        TextField(
                          keyboardType: TextInputType.number,
                          // adding the controller
                          controller: heightController,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: 'Your height in Cm',
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide.none,
                              )),
                        ),
                        const SizedBox(height: 20.0),
                        const Text('Your Weight in Kg: ',
                            style: TextStyle(
                              fontSize: 18.0,
                            )),
                        TextField(
                          keyboardType: TextInputType.number,
                          controller: weightController,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: 'Your Weight in Kg',
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide.none,
                              )),
                        ),
                        const SizedBox(height: 20),

                        // creating the input form.

                        // adding the calculate button
                        SizedBox(
                            width: double.infinity,
                            child: TextButton(
                              onPressed: () {
                                double h =
                                    double.parse(heightController.value.text);
                                double w =
                                    double.parse(heightController.value.text);
                              },
                              child: Container(
                                color: Colors.blue,
                                child: const Text('Calculate',
                                    style: TextStyle(
                                      color: Colors.white,
                                    )),
                              ),
                            )),

                        const SizedBox(height: 20.0),
                        const SizedBox(
                          width: double.infinity,
                          child: Text(
                            'Your BMI is: ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 50.0),
                        SizedBox(
                            width: double.infinity,
                            child: Text(
                              result,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ))
                      ],
                    )))));
  }

  void calculateBmi(double height, double weight) {
    double finalresult = weight / (height * height);
    String bmi = finalresult.toStringAsFixed(2);
    setState(() {
      result = bmi;
    });
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
            child: TextButton(
      onPressed: () {
        // clicking the button , the current index will have the value of the button's index.
        changeIndex(index);
      },
      child: Container(
        //  makeing the color of the button change in function of it's selected or not.

        color: currentindex == index
            ? color
            : Colors.grey[
                200], // if the current index is equal to the button index then put the color , the main color that will define otherwise make it grey.
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(8.0),
        // ), // adding the round button.

        child: Text(
          value,
          style: TextStyle(
            color: currentindex == index ? Colors.white : color,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    )));
  }
}
