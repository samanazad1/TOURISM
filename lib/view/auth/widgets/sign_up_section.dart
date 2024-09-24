import 'package:flutter/material.dart';
import 'package:tourism/helper/util/colors.dart';
import 'package:tourism/view/auth/widgets/auth_text_field.dart';
import 'package:tourism/view/initial_page.dart';

class SingupSection extends StatelessWidget {
  const SingupSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              'Kurdistan is waiting!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: secondaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 120,
            ),
            Text(
              'Welcome to Tourism',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: secondaryColor.withOpacity(0.8),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40),
            // Username TextField
            AuthTextField(
              hint: 'Your Name',
            ),
            SizedBox(height: 20),
            // Password TextField

            AuthTextField(
              hint: 'Phone Number',
            ),
            SizedBox(height: 20),
            AuthTextField(
              hint: 'Password',
            ),
            SizedBox(height: 20),

            SizedBox(height: 40),
            // Login button
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return InitialPage();
                }));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor.withOpacity(.5),
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                'Sing Up',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
