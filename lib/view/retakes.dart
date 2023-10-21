import 'package:flutter/material.dart';

import '../repo/data.dart' as data;
import '../widgets/widgets.dart';

class RetakesView extends StatelessWidget {
  RetakesView({super.key});

  final retakes = data.retakes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: retakes.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8),
        child: RetakeWidget(retake: retakes[index]),
      )
    );
  }
}
