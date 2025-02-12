import 'package:flutter/material.dart';

class TextfieldAut extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String hintText;
  const TextfieldAut({
    super.key, 
    required this.controller, 
    required this.obscureText, 
    required this.hintText
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: TextField(
        cursorColor: Color.fromARGB(255, 99, 39, 47),
        style: TextStyle(color: Color.fromARGB(255, 83, 32, 39)),
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Color.fromARGB(255, 99, 39, 47)
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 255, 229, 190)
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white
            )
          ),
          fillColor: Color.fromARGB(255, 156, 121, 125),
          filled: true,
        ),
      ),
    );
  }
}