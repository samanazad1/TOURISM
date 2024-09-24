import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:tourism/helper/widgets/icon_buttom_bar.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tourism",
          style: TextStyle(),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(18)),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        height: 80,
        width: MediaQuery.sizeOf(context).width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconBottomBar(
                  icon: selectedIndex == 0 ? IconlyBold.home : IconlyLight.home,
                  selected: selectedIndex == 0 ? true : false,
                  onPressed: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                  }),
              IconBottomBar(
                selected: selectedIndex == 1 ? true : false,
                onPressed: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                },
                icon: selectedIndex == 1
                    ? IconlyBold.category
                    : IconlyLight.category,
              ),
              IconBottomBar(
                  iconSize: 26,
                  icon:
                      selectedIndex == 2 ? IconlyBold.heart : IconlyLight.heart,
                  selected: selectedIndex == 2 ? true : false,
                  onPressed: () {
                    setState(() {
                      selectedIndex = 2;
                    });
                  }),
              IconBottomBar(
                  icon: selectedIndex == 3
                      ? IconlyBold.profile
                      : IconlyLight.profile,
                  selected: selectedIndex == 3 ? true : false,
                  onPressed: () {
                    setState(() {
                      selectedIndex = 3;
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
