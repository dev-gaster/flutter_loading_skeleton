import 'package:flutter/material.dart';
import 'package:flutter_loading_skeleton/flutter_loading_skeleton.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Loading Skeleton Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Loading Skeleton Demo")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            // Example usage of LoadingSkeleton
            // basic usage
            // you can create any kind of shape by adjusting height, width and borderRadius
            // use columns and rows to create complex loading skeletons
            LoadingSkeleton(
              height: 20.0,
              width: 200.0,
              borderRadius: 12.0,
              duration: Duration(seconds: 2),
              animateWidth: true,
            ),
            SizedBox(height: 20),
            // to enable width animation set animateWidth to true
            // set animateWidth to false to disable width animation
            // wrap the widget with a sized box to control the size
            // for animated with, the size should be set within the sized box
            SizedBox(
              width: 200, // Control the width of the skeleton
              child: LoadingSkeleton(
                height: 16.0,
                borderRadius: 8.0,
                duration: Duration(seconds: 1),
                animateWidth: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
