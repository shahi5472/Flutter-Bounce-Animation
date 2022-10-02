import 'package:bounce_animation/bouncing_container.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Bouncing animation')),
      body: Center(
        child: BouncingContainer(
          child: AnimatedContainer(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.amber,
            ),
            duration: const Duration(seconds: 4),
            alignment: Alignment.center,
            child: const Text('Bouncing'),
          ),
        ),
      ),
    );
  }
}
