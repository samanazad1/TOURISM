class TourismTypeModel {
  final String image;
  final String name;
  final String description;
  final List<String> activities;  // List of activities for each tourism type
  final List<String> locations;   // List of locations related to this tourism type

  TourismTypeModel({
    required this.image,
    required this.name,
    required this.description,
    required this.activities, // Added activities
    required this.locations,  // Added locations
  });
}
