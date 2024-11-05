import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:tourism/assistant/util/colors.dart';

import 'package:tourism/model/data/tourism_type.dart';
import 'package:tourism/model/tourism_type_model.dart';
import 'package:tourism/view/nav/home/widgets/popular_destination.dart';

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
              height: 20,
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
                  InkWell(
                    onTap: onSeeAllTapped,
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
                children: [
                  const Text(
                    "Tourism Types",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return TourismTypesScreen();
                      }));
                    },
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
                    return InkWell(
                        onTap: null,
                        child: TourismTypeCard(
                          type: type,
                          isFromList: false,
                        ));
                  }),
            ),
          ]),
        ),
      ),
    );
  }
}

class TourismTypesScreen extends StatelessWidget {
  const TourismTypesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tourism Types"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height * .8,
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 1.0,
            ),
            itemCount: tourismTypes.length,
            itemBuilder: (context, i) {
              final type = tourismTypes[i];
              return GestureDetector(
                onTap: () {
                  // Add functionality for when a type is tapped, like navigation or a modal
                  print("Tapped on ${type.name}");
                },
                child: TourismTypeCard(type: type, isFromList: true),
              );
            },
          ),
        ),
      ),
    );
  }
}

class TourismTypeCard extends StatelessWidget {
  const TourismTypeCard({
    super.key,
    required this.type,
    this.isFromList = false,
  });
  final bool isFromList;
  final TourismTypeModel type;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      height: 120,
      width: 200,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              image: AssetImage(type.image), opacity: .4, fit: BoxFit.cover)),
      alignment: Alignment.center,
      child: Text(
        type.name,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
      ),
    );
  }
}
