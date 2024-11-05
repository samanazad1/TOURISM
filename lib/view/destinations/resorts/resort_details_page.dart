
import 'package:flutter/material.dart';

class ResortDetailsScreen extends StatelessWidget {
  final int resortId;

  const ResortDetailsScreen({Key? key, required this.resortId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resort Details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Resort Image
              Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/resort_$resortId.jpg'), // Replace with your asset image
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              SizedBox(height: 16),

              // Resort Title
              Text(
                'Luxury Resort $resortId',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),

              // Resort Description
              Text(
                'Escape to Luxury Resort $resortId. Enjoy stunning views, world-class amenities, and unforgettable experiences tailored just for you. Perfect for couples, families, and solo travelers looking to unwind and relax.',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              SizedBox(height: 16),

              // Amenities Section
              Text(
                'Amenities',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              _buildAmenityList(),

              // Services Section
              SizedBox(height: 16),
              Text(
                'Services',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              _buildServiceList(),

              // Reviews Section
              SizedBox(height: 16),
              Text(
                'Reviews',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              _buildReviewList(),

              // Booking Button
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Implement booking functionality
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Booking'),
                        content: Text('Booking for Resort $resortId has been initiated.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Book Now'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAmenityList() {
    // A list of amenities offered by the resort
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildAmenityItem(Icons.pool, 'Swimming Pool'),
        _buildAmenityItem(Icons.local_dining, 'Restaurant'),
        _buildAmenityItem(Icons.spa, 'Spa and Wellness Center'),
        _buildAmenityItem(Icons.fitness_center, 'Fitness Center'),
        _buildAmenityItem(Icons.free_breakfast, 'Free Breakfast'),
      ],
    );
  }

  Widget _buildAmenityItem(IconData icon, String amenity) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.blue),
        SizedBox(width: 8),
        Text(amenity, style: TextStyle(fontSize: 16)),
      ],
    );
  }

  Widget _buildServiceList() {
    // A list of services offered by the resort
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildServiceItem(Icons.local_taxi, 'Airport Shuttle'),
        _buildServiceItem(Icons.room_service, 'Room Service'),
        _buildServiceItem(Icons.business_center, 'Business Center'),
        _buildServiceItem(Icons.child_care, 'Child Care Services'),
      ],
    );
  }

  Widget _buildServiceItem(IconData icon, String service) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.green),
        SizedBox(width: 8),
        Text(service, style: TextStyle(fontSize: 16)),
      ],
    );
  }

  Widget _buildReviewList() {
    // A list of reviews for the resort
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildReviewItem('John Doe', 'Amazing experience! Highly recommend this place.'),
        _buildReviewItem('Jane Smith', 'Great service and beautiful views.'),
        _buildReviewItem('Mike Johnson', 'A perfect getaway for relaxation.'),
      ],
    );
  }

  Widget _buildReviewItem(String reviewer, String review) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          reviewer,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          review,
          style: TextStyle(color: Colors.grey[600]),
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
