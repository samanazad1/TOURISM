import 'package:flutter/material.dart';
import 'package:tourism/model/data/destination_data.dart';
import 'package:tourism/model/destintions_model.dart';
import 'package:tourism/view/destinations/destination_details.dart';

class SearchResultPage extends StatefulWidget {
  const SearchResultPage({super.key});

  @override
  _SearchResultPageState createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  List<DestintionsModel> filteredDestinations = [];

  @override
  void initState() {
    super.initState();
    filteredDestinations = destinations;
  }

  void _filterDestinations(String query) {
    setState(() {
      filteredDestinations = destinations.where((destination) {
        return destination.name
            .toLowerCase()
            .replaceAll(" ", '')
            .contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search Results")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              cursorHeight: 18,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                hintText: "Search destinations",
                hintStyle: TextStyle(color: Color.fromARGB(255, 31, 31, 31)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onChanged: _filterDestinations,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredDestinations.length,
              itemBuilder: (context, index) {
                final destination = filteredDestinations[index];
                return ListTile(
                  title: Text(destination.name),
                  subtitle: Text(destination.province),
                  leading: Image.asset(destination.image),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DestinationDetails(destination: destination);
                    }));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
