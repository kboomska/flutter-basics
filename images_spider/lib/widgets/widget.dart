import 'package:flutter/material.dart';

import '/resources/resources.dart';

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Image(
        // image: AssetImage(AppImages.like),
        image: AssetImage(AppImages.home),
      ),
    );
  }
}
