import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import 'package:provider/provider.dart';
import 'package:tourism/model/data/destination_data.dart';
import 'package:tourism/model/destintions_model.dart' as dest;

import 'package:tourism/view/destinations/destination_details.dart';
import 'package:tourism/view/nav/categories/widgets/destination_card.dart';

import 'search_result.dart';

class DestinationListPage extends StatefulWidget {
  const DestinationListPage({
    super.key,
  });

  @override
  State<DestinationListPage> createState() => _DestinationListPageState();
}

class _DestinationListPageState extends State<DestinationListPage> {
  // Variable to hold filtered results
  List<dest.DestintionsModel> filteredDestinations = [];

  @override
  void initState() {
    super.initState();
  }

  void _filterDestinations(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredDestinations = destinations;
      });
    } else {
      setState(() {
        filteredDestinations = destinations.where((destination) {
          return destination.name.toLowerCase().contains(query.toLowerCase());
        }).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Destinations")),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              children: [
                SizedBox(
                  height: 55,
                  child: TextField(
                    cursorHeight: 18,
                    readOnly:
                        true, // Make TextField read-only to trigger navigation
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Colors.black),
                      hintText: "Search",
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 31, 31, 31)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchResultPage()),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .75,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: destinations.length,
                      itemBuilder: (context, i) {
                        var destination = destinations[i];
                        return i == destinations.length - 1
                            ? SizedBox(
                                height: 100,
                              )
                            : InkWell(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return DestinationDetails(
                                      destination: destination,
                                    );
                                  }));
                                },
                                child: DestinationCard(
                                  destination: destination,
                                  isFromList: true,
                                ),
                              );
                      }),
                ),
              ],
            )),
      ),
    );
  }
}
