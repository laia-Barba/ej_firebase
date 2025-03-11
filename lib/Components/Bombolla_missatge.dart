import 'package:flutter/material.dart';

class BombollaMissatge extends StatelessWidget {
  final String missatge;
  const BombollaMissatge({super.key, required this.missatge});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
      child: Container(
        color: Color.fromARGB(255, 185, 156, 160),
        child: Text(missatge),
      ),
    );
  }
}