import 'package:flutter/material.dart';

import 'package:tourism/model/destintions_model.dart';
import 'package:tourism/view/destinations/widget/destiation_header.dart';
import 'package:tourism/view/destinations/widget/details_widgets.dart';

class DestinationDetails extends StatefulWidget {
  const DestinationDetails({super.key, required this.destination});
  final DestintionsModel destination;

  @override
  State<DestinationDetails> createState() => _DestinationDetailsState();
}

class _DestinationDetailsState extends State<DestinationDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DestinationHeader(destination: widget.destination),
            buildDescription(),
            buildThingsToDo(),
            buildNearbyResorts(),
            buildGetInTouch(context),
            buildExtraDetails(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
