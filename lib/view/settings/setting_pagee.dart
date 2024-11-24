import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Center(
        child: Text("Settings Content Here"),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // App Logo and Name
          Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                    "assets/images/Screenshot 2024-11-08 at 20.35.24.png"), // Replace with your app logo
              ),
              SizedBox(height: 16),
              Text(
                "Your App Name",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "Version 1.0.0",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ],
          ),
          SizedBox(height: 32),
          // About the App
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text("About the App"),
            subtitle: Text(
                "This app helps users manage their tasks efficiently and stay organized."),
          ),
          Divider(),
          // Contact Us
          ListTile(
            leading: Icon(Icons.contact_mail),
            title: Text("Contact Us"),
            subtitle: Text("samanazad661@gmail.com"),
            onTap: () {
              // Optionally handle tap (e.g., open mail client)
              _launchEmail("samanazad661@gmail.com");
            },
          ),
          Divider(),
          // Privacy Policy
          ListTile(
            leading: Icon(Icons.privacy_tip),
            title: Text("Privacy Policy"),
            onTap: () {
              // Navigate to Privacy Policy Page
              Navigator.pushNamed(context, '/privacyPolicy');
            },
          ),
          Divider(),
          // Terms and Conditions
          ListTile(
            leading: Icon(Icons.description),
            title: Text("Terms and Conditions"),
            onTap: () {
              TermsAndConditionsModal.show(context);
            },
          ),
        ],
      ),
    );
  }
}

class SupportPage extends StatelessWidget {
  // Function to launch email
  Future<void> _launchEmail(BuildContext context) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'support@yourapp.com', // Replace with your support email
      queryParameters: {
        'subject': 'Support Inquiry', // Optional: Add a subject
      },
    );

    try {
      // Check if the email client is available
      bool canLaunchEmail = await canLaunch(emailLaunchUri.toString());
      if (canLaunchEmail) {
        await launch(emailLaunchUri.toString());
      } else {
        throw 'No email client available';
      }
    } catch (e) {
      print('Error launching email client: $e');
      // Show a user-friendly message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Could not launch email client")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Support"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "How can we assist you?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              "If you need help or have questions, feel free to contact us through the following options:",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            // Contact Us Button
            ElevatedButton(
              onPressed: () {
                _launchEmail(context);
              },
              child: Text("Contact Support"),
            ),
            SizedBox(height: 20),
            // FAQ Button
            ElevatedButton(
              onPressed: () {
                // Navigate to FAQ Page (not implemented here)
                print("Go to FAQ Page");
              },
              child: Text("Frequently Asked Questions"),
            ),
            SizedBox(height: 20),
            // Alternatively, you could add more options like opening a live chat etc.
          ],
        ),
      ),
    );
  }
}

class TermsAndConditionsModal {
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Make the modal scrollable
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          height:
              MediaQuery.of(context).size.height * 0.75, // 75% of screen height
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Modal Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Terms and Conditions",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the modal
                    },
                  ),
                ],
              ),
              Divider(),
              // Terms Content
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTerm(
                        "Usage",
                        "You agree to use this app responsibly and ethically.",
                      ),
                      _buildTerm(
                        "Privacy",
                        "We value your privacy. Your data will be handled in accordance with our Privacy Policy.",
                      ),
                      _buildTerm(
                        "Prohibited Activities",
                        "Do not misuse the app for illegal purposes.",
                      ),
                      _buildTerm(
                        "Content Ownership",
                        "All content is the property of the app and its creators.",
                      ),
                      SizedBox(height: 16),
                      Text(
                        "These terms are subject to change. Continued use of the app constitutes acceptance of the updated terms.",
                        style: TextStyle(
                            fontSize: 16,
                            height: 1.5,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              // Accept Button
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the modal
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content:
                              Text("You accepted the Terms and Conditions!")),
                    );
                  },
                  child: Text("Accept"),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static Widget _buildTerm(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
          SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
        ],
      ),
    );
  }
}

Future<void> _launchEmail(String email) async {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: email, // Email address
    queryParameters: {
      'subject': 'Support Inquiry', // Optional: Add a subject
    },
  );

  // Check if the email client is available
  if (await canLaunch(emailLaunchUri.toString())) {
    await launch(emailLaunchUri.toString());
  } else {
    throw 'Could not launch email client';
  }
}
