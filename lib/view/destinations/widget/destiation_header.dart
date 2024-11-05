import 'package:flutter/material.dart';
import 'package:tourism/model/destintions_model.dart';

import '../../../assistant/util/sizes.dart';

class DestinationHeader extends StatelessWidget {
  const DestinationHeader({
    super.key,
    required this.destination,
  });

  final DestintionsModel destination;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320 / getAbsWidth(context),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0, // Add right to ensure it stretches to full width
            height: 300,
            child: SizedBox(
              width: double.infinity, // Ensures full width
              child: Image.asset(
                destination.image,
                fit: BoxFit.cover, // This ensures the image covers the area
              ),
            ),
          ),
          Positioned(
            top: 255, // Adjust top value to prevent overlap
            left: 20,
            child: Text(
              destination.name,
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ),
          Positioned(
            top: 55, // Adjust top value to prevent overlap
            left: 20,
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 40,
                padding: EdgeInsets.only(left: 6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(99),
                    color: Colors.white),
                child: Center(
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 25,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
