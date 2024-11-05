import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism/view/initial_page.dart';
import 'package:tourism/controller/favorite_controller.dart'; // Import your FavoriteController

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FavoriteController(),
      child: MaterialApp(
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
      ),
    );
  }
}
