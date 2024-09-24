import 'package:flutter/material.dart';

import 'package:tourism/view/initial_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: 'Tourism',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 1, 152, 84)),
        useMaterial3: true,
        fontFamily: "Raleway",
      ),
      home: InitialPage(),
    );
  }
}
