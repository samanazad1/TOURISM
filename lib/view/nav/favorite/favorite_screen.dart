import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism/assistant/util/colors.dart';
import 'package:tourism/controller/favorite_controller.dart';

import 'package:tourism/view/auth/auth_page.dart';
import 'package:tourism/view/nav/categories/widgets/destination_card.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteController = Provider.of<FavoriteController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Center(
          child: favoriteController.isLoggedIn
              ? favoriteController.favorites.isEmpty
                  ? Text(
                      "No favorites added",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  : ListView.builder(
                      itemCount: favoriteController.favorites.length,
                      itemBuilder: (context, index) {
                        final destination = favoriteController.favorites[index];
                        return DestinationCard(
                          destination: destination,
                          isFromList: true,
                        );
                      },
                    )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Please login into your account",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return AuthPage();
                            },
                          ));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
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
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
