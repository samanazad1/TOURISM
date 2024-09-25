import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:tourism/helper/util/colors.dart';

import 'package:tourism/model/data/tourism_type.dart';
import 'package:tourism/view/nav_pages/home/widgets/popular_destination.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.onSeeAllTapped});

  final Function() onSeeAllTapped;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tourism")),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 55,
              child: TextField(
                cursorHeight: 18,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      IconlyLight.search,
                      color: Colors.black,
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
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 08.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Popular Destinations",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  TextButton(
                    onPressed: onSeeAllTapped,
                    child: Text(
                      "See all",
                      style: TextStyle(color: primaryColor),
                    ),
                  ),
                ],
              ),
            ),
            const PopularDestinations(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Tourism Types",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  TextButton(
                    onPressed: null,
                    child: Text(
                      "See all",
                      style: TextStyle(color: primaryColor),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 550,
              child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  scrollDirection: Axis.vertical,
                  itemCount: tourismTypes.length - 1,
                  itemBuilder: (context, i) {
                    final type = tourismTypes[i];
                    return Container(
                      margin: EdgeInsets.all(8),
                      height: 120,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: AssetImage(type.image),
                              opacity: .4,
                              fit: BoxFit.fitWidth)),
                      alignment: Alignment.center,
                      child: Text(
                        type.name,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                    );
                  }),
            ),
          ]),
        ),
      ),
    );
  }
}
