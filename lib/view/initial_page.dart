import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:tourism/helper/widgets/icon_buttom_bar.dart';
import 'package:tourism/view/nav_pages/categories/cateogries_screen.dart';
import 'package:tourism/view/nav_pages/favorite/favorite_screen.dart';
import 'package:tourism/view/nav_pages/home/home_page.dart';
import 'package:tourism/view/nav_pages/profile/profile_page.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    CateogriesPage(),
    FavoritePage(),
    ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
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
                  icon:
                      _selectedIndex == 0 ? IconlyBold.home : IconlyLight.home,
                  selected: _selectedIndex == 0 ? true : false,
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                  }),
              IconBottomBar(
                selected: _selectedIndex == 1 ? true : false,
                onPressed: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
                icon: _selectedIndex == 1
                    ? IconlyBold.category
                    : IconlyLight.category,
              ),
              IconBottomBar(
                  iconSize: 26,
                  icon: _selectedIndex == 2
                      ? IconlyBold.heart
                      : IconlyLight.heart,
                  selected: _selectedIndex == 2 ? true : false,
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 2;
                    });
                  }),
              IconBottomBar(
                  icon: _selectedIndex == 3
                      ? IconlyBold.profile
                      : IconlyLight.profile,
                  selected: _selectedIndex == 3 ? true : false,
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 3;
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
