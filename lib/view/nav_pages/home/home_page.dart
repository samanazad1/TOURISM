import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 55,
          child: TextField(
            cursorHeight: 18,
            decoration: InputDecoration(
                suffix: Padding(
                  padding: const EdgeInsets.only(top: 6.0, right: 6),
                  child: Icon(
                    IconlyLight.search,
                    color: Colors.black,
                  ),
                ),
                hintText: "Search",
                hintStyle:
                    TextStyle(color: const Color.fromARGB(255, 31, 31, 31)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(15)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(15)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(15))),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Popular Destinations"),
                  Text("See all"),
                ],
              )
            ]),
      ),
    );
  }
}
