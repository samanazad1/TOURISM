import 'package:flutter/material.dart';
import 'package:tourism/assistant/util/colors.dart';
import 'package:tourism/view/initial_page.dart';

class LoginSection extends StatelessWidget {
  const LoginSection({
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
              'Welcome back dear Tourist 👋🏻',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: secondaryColor.withOpacity(0.8),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40),
            // Username TextField
            TextField(
              decoration: InputDecoration(
                focusColor: primaryColor,
                // fillColor: Colors.white.withOpacity(0.8),
                hintText: 'Username',
                hintStyle: TextStyle(color: Colors.white),
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),

                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: primaryColor),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Password TextField
            TextField(
              decoration: InputDecoration(
                focusColor: primaryColor,
                // fillColor: Colors.white.withOpacity(0.8),
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.white),
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),

                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: primaryColor),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),

            SizedBox(height: 40),
            // Login button
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                  builder: (context) {
                    return InitialPage();
                  },
                ), (route) => false);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor.withOpacity(.5),
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                'Login',
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
