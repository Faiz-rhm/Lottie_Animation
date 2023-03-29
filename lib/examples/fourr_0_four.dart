import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Four0Four extends StatelessWidget {
  const Four0Four({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/json/404.json'),
      ),
    );
  }
}
