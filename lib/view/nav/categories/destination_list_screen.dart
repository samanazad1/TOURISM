import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:tourism/assistant/util/sizes.dart';
import 'package:tourism/controller/favorite_controller.dart';
import 'package:tourism/model/data/destination_data.dart';
import 'package:tourism/model/destintions_model.dart';
import 'package:tourism/view/destinations/destination_details.dart';

class DestinationListPage extends StatelessWidget {
  const DestinationListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Destinations")),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * .8,
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
            )),
      ),
    );
  }
}

class DestinationCard extends StatelessWidget {
  const DestinationCard({
    super.key,
    required this.destination,
    this.isFromList = false,
  });

  final bool isFromList;

  final DestintionsModel destination;

  @override
  Widget build(BuildContext context) {
    final favoriteController = Provider.of<FavoriteController>(context);
    return SizedBox(
      height: 250,
      width: 410 / getAbsWidth(context),
      child: Padding(
        padding: isFromList
            ? const EdgeInsets.symmetric(vertical: 8.0)
            : EdgeInsets.only(left: 0, right: 4.0 / getAbsWidth(context)),
        child: DecoratedBox(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: EdgeInsets.all(isFromList ? 0 : 10),
            child: Stack(
              children: [
                Positioned.fill(
                  bottom: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      destination.image,
                      height: 250,
                      width: 400 / getAbsWidth(context),

                      fit: BoxFit
                          .cover, // Use BoxFit.cover instead of BoxFit.fitHeight
                    ),
                  ),
                ),
                Positioned(
                    right: 5,
                    top: 5,
                    child: InkWell(
                      onTap: () {
                        favoriteController.toggleFavorite(destination);
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(.5),
                        radius: 18,
                        child: Icon(
                          favoriteController.isFavorite(destination)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.red,
                        ),
                      ),
                    )),
                Positioned(
                    left: 0,
                    bottom: 0,
                    child: Container(
                      width: isFromList ? 400 : 375 / getAbsWidth(context),
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15)),
                          color: Colors.black.withOpacity(.3)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  destination.name,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18),
                                ),
                                Text(
                                  "Erbil Province",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(.7),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${destination.todos.length} Things to do',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14),
                                ),
                                Text(
                                  '${destination.resorts.length} Resort',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
