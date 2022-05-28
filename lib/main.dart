import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // adding confetti Animation
  late ConfettiController _controller;

  //initialise state
  @override
  void initState() {
    _controller = ConfettiController(duration: Duration(seconds: 5));
  }

  //disposing confetti
  @override
  void dispose() {
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: ConfettiWidget(
                confettiController: _controller,
                blastDirectionality: BlastDirectionality.explosive,
                numberOfParticles: 20,
              ),
            ),
            Center(
              child: TextButton(
                  onPressed: () {
                    _controller.play();
                  },
                  child: const Text(
                    "play",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  )),
            )
          ],
        )));
  }
}
