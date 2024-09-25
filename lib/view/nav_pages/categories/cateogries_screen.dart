import 'package:flutter/material.dart';
import 'package:tourism/view/nav_pages/home/widgets/popular_destination.dart';

class CateogriesPage extends StatelessWidget {
  const CateogriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Destinations")),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: PopularDestinations(
              isFromCategory: true,
            )),
      ),
    );
  }
}
