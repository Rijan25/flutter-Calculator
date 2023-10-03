import 'package:calculator/components.dart/my_button.dart';
import 'package:calculator/constant.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = '';
  var result = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      userInput.toString(),
                      style: const TextStyle(fontSize: 30, color: whiteColor),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      result.toString(),
                      style: const TextStyle(fontSize: 50, color: whiteColor),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  MyButton(
                    title: 'AC',
                    onPress: () {
                      userInput = '';
                      result = '';
                      setState(() {});
                    },
                  ),
                  MyButton(
                    title: '+/-',
                    onPress: () {
                      userInput += '+-';
                      setState(() {});
                    },
                  ),
                  MyButton(
                    title: '%',
                    onPress: () {
                      userInput += '%';
                      setState(() {});
                    },
                  ),
                  MyButton(
                    title: '/',
                    onPress: () {
                      userInput += '/';
                      setState(() {});
                    },
                    color: Colors.orange,
                  ),
                ],
              ),
              Row(
                children: [
                  MyButton(
                    title: '7',
                    onPress: () {
                      userInput += '7';
                      setState(() {});
                    },
                  ),
                  MyButton(
                    title: '8',
                    onPress: () {
                      userInput += '8';
                      setState(() {});
                    },
                  ),
                  MyButton(
                    title: '9',
                    onPress: () {
                      userInput += '9';
                      setState(() {});
                    },
                  ),
                  MyButton(
                    title: '*',
                    onPress: () {
                      userInput += '*';
                      setState(() {});
                    },
                    color: Colors.orange,
                  ),
                ],
              ),
              Row(
                children: [
                  MyButton(
                    title: '4',
                    onPress: () {
                      userInput += '4';
                      setState(() {});
                    },
                  ),
                  MyButton(
                    title: '5',
                    onPress: () {
                      userInput += '5';
                      setState(() {});
                    },
                  ),
                  MyButton(
                    title: '6',
                    onPress: () {
                      userInput += '6';
                      setState(() {});
                    },
                  ),
                  MyButton(
                    title: '-',
                    onPress: () {
                      userInput += '-';
                      setState(() {});
                    },
                    color: Colors.orange,
                  ),
                ],
              ),
              Row(
                children: [
                  MyButton(
                    title: '1',
                    onPress: () {
                      userInput += '1';
                      setState(() {});
                    },
                  ),
                  MyButton(
                    title: '2',
                    onPress: () {
                      userInput += '2';
                      setState(() {});
                    },
                  ),
                  MyButton(
                    title: '3',
                    onPress: () {
                      userInput += '3';
                      setState(() {});
                    },
                  ),
                  MyButton(
                    title: '+',
                    onPress: () {
                      userInput += '+';
                      setState(() {});
                    },
                    color: Colors.orange,
                  ),
                ],
              ),
              Row(
                children: [
                  MyButton(
                    title: '0',
                    onPress: () {
                      userInput += '0';
                      setState(() {});
                    },
                  ),
                  MyButton(
                    title: '.',
                    onPress: () {
                      userInput += '.';
                      setState(() {});
                    },
                  ),
                  MyButton(
                    title: 'DEL',
                    onPress: () {
                      if (userInput.isNotEmpty) {
                        userInput =
                            userInput.substring(0, userInput.length - 1);
                        if (userInput.isEmpty) {
                          result = '';
                        }
                      }

                      setState(() {});
                    },
                  ),
                  MyButton(
                    title: '=',
                    onPress: () {
                      equalPress();
                      setState(() {});
                    },
                    color: Colors.lightBlue,
                  ),
                ],
              ),
            ],
          )),
    );
  }

  void equalPress() {
    Parser p = Parser();
    Expression expression = p.parse(userInput);
    ContextModel contextModel = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    result = eval.toString();
  }
}
