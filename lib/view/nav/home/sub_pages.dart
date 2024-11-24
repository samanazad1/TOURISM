import 'package:flutter/material.dart';
import 'package:tourism/model/tourism_type_model.dart';

class TourismDetailPage extends StatelessWidget {
  final TourismTypeModel tourismType;

  TourismDetailPage({required this.tourismType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tourismType.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Image.asset(tourismType.image,
                    fit: BoxFit.fitWidth, height: 250)),
            SizedBox(height: 16),
            Text(
              tourismType.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 8),
            Text(
              tourismType.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              "Activities:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            for (var activity in tourismType.activities)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text("• $activity", style: TextStyle(fontSize: 16)),
              ),
            SizedBox(height: 16),
            Text(
              "Popular Locations:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            for (var location in tourismType.locations)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text("• $location", style: TextStyle(fontSize: 16)),
              ),
          ],
        ),
      ),
    );
  }
}
