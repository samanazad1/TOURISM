import 'package:flutter/material.dart';
import 'package:tourism/view/auth/widgets/login_section.dart';
import 'package:tourism/view/auth/widgets/sign_up_section.dart';
import 'package:tourism/view/initial_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/tourism-bg.jpg'),
                fit: BoxFit.cover, // Cover the entire screen
              ),
            ),
          ),

          // Semi-transparent overlay to make the text more readable
          Container(
            color: Colors.black.withOpacity(0.5),
          ),

          // SKIP Button at the top-right
          // Positioned(
          //   right: 10,
          //   top: 10,
          //   child: TextButton(
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) {
          //           return InitialPage(); // Your target page here
          //         }),
          //       );
          //     },
          //     child: Text(
          //       "SKIP",
          //       style: TextStyle(
          //         color: Color.fromARGB(255, 10, 141, 15),
          //         fontSize: 16,
          //       ),
          //     ),
          //   ),
          // ),

          // Login/Signup form
          _index == 0 ? LoginSection() : SignupSection(),

          // Switch between login and signup sections
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _index == 0 ? _index = 1 : _index = 0;
                  });
                },
                child: Text(
                  _index == 0
                      ? "Create an Account "
                      : "Already have an Account?",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
