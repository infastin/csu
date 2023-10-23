import 'package:flutter/material.dart';

class Dot extends StatelessWidget {
  const Dot({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 12,
      child: Text("•", textAlign: TextAlign.center),
    );
  }
}
