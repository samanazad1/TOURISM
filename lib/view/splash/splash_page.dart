import 'package:flutter/material.dart';

import 'package:tourism/assistant/util/colors.dart';
import 'package:tourism/view/auth/auth_page.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({
    super.key,
  });

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _imageScaleAnimation;
  late Animation<Offset> _yAnimation;

  bool _isCompleted = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {});

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _yAnimation = Tween<Offset>(
      begin: const Offset(-0.5, 0.5),
      end: const Offset(18, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _imageScaleAnimation = Tween<double>(
      begin: 1,
      end: 10500,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );
    // final user = Provider.of<UserController>(context, listen: false);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isCompleted = true;
        });
      }
    });
    Future.delayed(const Duration(milliseconds: 1500), () {
      _controller.forward();
    });

    Future.delayed(const Duration(seconds: 4)).then((value) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const AuthPage()),
        (route) => false,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // show after 1 second
          Align(
            alignment: Alignment.topCenter,
            child: SlideTransition(
              position: _yAnimation,
              child: ScaleTransition(
                scale: _imageScaleAnimation,
                child: CircleAvatar(backgroundColor: primaryColor, radius: .1),
              ),
            ),
          ),
          AnimatedOpacity(
            opacity: _isCompleted ? 1 : 0,
            duration: const Duration(milliseconds: 500),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  const Spacer(),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        'assets/images/Screenshot 2024-11-08 at 20.35.24.png',
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                      )),
                  const Spacer(),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
