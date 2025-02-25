import 'package:flutter/material.dart';

class BotoAuth extends StatelessWidget {
  final String text;
  final Function() onTap;
  const BotoAuth({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(255, 136, 96, 101)
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              text,
              style: TextStyle(
                color: Color.fromARGB(255, 99, 39, 47),
                fontWeight: FontWeight.bold,
                fontSize: 16,
                letterSpacing: 2
              ),
            ),
          ),
        ),
      ),
    );
  }
}