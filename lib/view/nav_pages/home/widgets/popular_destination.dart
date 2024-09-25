import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:tourism/helper/util/sizes.dart';

import '../../../../model/data/destination_data.dart';

class PopularDestinations extends StatelessWidget {
  const PopularDestinations({
    super.key,
    this.isFromCategory = false,
  });
  final bool isFromCategory;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isFromCategory ? MediaQuery.sizeOf(context).height * .8 : 260,
      child: ListView.builder(
          scrollDirection: isFromCategory ? Axis.vertical : Axis.horizontal,
          itemCount:
              isFromCategory ? destinations.length : destinations.length - 1,
          itemBuilder: (context, i) {
            var destination = destinations[i];
            return i == destinations.length - 1
                ? SizedBox(
                    height: 100,
                  )
                : SizedBox(
                    height: 250,
                    width: 410 / getAbsWidth(context),
                    child: Padding(
                      padding: isFromCategory
                          ? const EdgeInsets.symmetric(vertical: 8.0)
                          : const EdgeInsets.all(8.0),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: EdgeInsets.all(isFromCategory ? 0 : 10),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Positioned.fill(
                                  bottom: 0,
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
                                  child: CircleAvatar(
                                    backgroundColor:
                                        Colors.white.withOpacity(.5),
                                    radius: 18,
                                    child: Icon(
                                      IconlyLight.heart,
                                      color: Colors.red,
                                    ),
                                  )),
                              Positioned(
                                  left: 0,
                                  bottom: 0,
                                  child: Container(
                                    width: isFromCategory
                                        ? 400
                                        : 375 / getAbsWidth(context),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                                    color: Colors.white
                                                        .withOpacity(.7),
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
          }),
    );
  }
}
