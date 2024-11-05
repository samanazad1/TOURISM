import 'package:flutter/material.dart';

class TodosDetailsPage extends StatelessWidget {
  final int activityId;

  const TodosDetailsPage({Key? key, required this.activityId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Things to Do Details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Activity Image
              Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/todo_$activityId.jpg'), // Replace with your asset image
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              SizedBox(height: 16),

              // Activity Title
              Text(
                'Visit ${_getActivityTitle(activityId)}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),

              // Activity Description
              Text(
                _getActivityDescription(activityId),
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              SizedBox(height: 16),

              // Historical Summary (if applicable)
              if (_isHistorical(activityId)) ...[
                Text(
                  'Historical Summary',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  _getHistoricalSummary(activityId),
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                SizedBox(height: 16),
              ],

              // Location Section
              Text(
                'Location',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                      'Map view of ${_getActivityTitle(activityId)}'), // Placeholder for map view
                ),
              ),
              SizedBox(height: 16),

              // Mark as Todo Button
              ElevatedButton(
                onPressed: () {
                  // Implement functionality to mark as a Todo
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Marked as Todo'),
                        content: Text(
                            '${_getActivityTitle(activityId)} has been added to your Todo list.'),
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
                child: Text('Add to My Todos'),
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

  String _getActivityTitle(int id) {
    switch (id) {
      case 1:
        return 'Moscow Kremlin';
      case 2:
        return 'Eiffel Tower';
      case 3:
        return 'Great Wall of China';
      case 4:
        return 'Statue of Liberty';
      default:
        return 'Exciting Activity';
    }
  }

  String _getActivityDescription(int id) {
    switch (id) {
      case 1:
        return 'Visit the historic Moscow Kremlin and explore its stunning architecture.';
      case 2:
        return 'Enjoy breathtaking views from the top of the Eiffel Tower.';
      case 3:
        return 'Walk along the Great Wall of China, an impressive feat of engineering.';
      case 4:
        return 'Discover the iconic Statue of Liberty.';
      default:
        return 'Join us for an unforgettable adventure!';
    }
  }

  bool _isHistorical(int id) {
    // Define which activities are historical
    return id == 1 ||
        id == 3 ||
        id == 4; // Example: Kremlin, Great Wall, Statue of Liberty
  }

  String _getHistoricalSummary(int id) {
    switch (id) {
      case 1:
        return 'The Moscow Kremlin is a fortified complex at the heart of Moscow, dating back to the 12th century and serving as the residence of Russian tsars and Soviet leaders.';
      case 3:
        return 'The Great Wall of China was built over several dynasties to protect against invasions and spans over 13,000 miles.';
      case 4:
        return 'The Statue of Liberty was a gift from France to the United States in 1886 and symbolizes freedom and democracy.';
      default:
        return '';
    }
  }
}
