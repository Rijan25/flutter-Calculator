import 'package:calculator/constant.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onPress;
  const MyButton({
    super.key,
    required this.title,
    this.color = Colors.grey,
    required this.onPress,
  });

  // var userInput = '';
  // var answer = '';

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: InkWell(
          onTap: onPress,
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Center(
                child: Text(
              title,
              style: headinStyle,
            )),
          ),
        ),
      ),
    );
  }
}
