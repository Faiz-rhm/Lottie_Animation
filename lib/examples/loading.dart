import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller  = AnimationController(vsync: this)
    ..value = 0.5
    ..addListener(() {
      setState(() {

      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Lottie.asset(
              'assets/json/loading.json',
              controller: _controller,
              repeat: true,
              onLoaded: (composition) {
                _controller.duration = composition.duration;
              }
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () => _controller.reverse(),
                icon: const Icon(Icons.arrow_back)
              ),
              IconButton(
                onPressed: () => _controller.stop(),
                icon: const Icon(Icons.pause)
              ),
              IconButton(
                onPressed: () => _controller.forward(),
                icon: const Icon(Icons.arrow_forward)
              ),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var start = 0.1;
          var stop = 0.9;

          _controller.repeat(
            min: start,
            max: stop,
            // reverse: true,
            period: _controller.duration! * (stop - start)
          );

        },
        child: const Text('Repeat'),
      ),
    );
  }
}
