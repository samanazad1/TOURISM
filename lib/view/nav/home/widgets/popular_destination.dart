import 'package:flutter/material.dart';
import 'package:tourism/view/destinations/destination_details.dart';
import 'package:tourism/view/nav/categories/destination_list_screen.dart';
import 'package:tourism/view/nav/categories/widgets/destination_card.dart';

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
          itemCount: 3,
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
                      isFromList: false,
                    ));
          }),
    );
  }
}
