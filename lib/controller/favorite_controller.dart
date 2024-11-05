import 'package:flutter/material.dart';
import 'package:tourism/model/destintions_model.dart';

class FavoriteController with ChangeNotifier {
  List<DestintionsModel> _favorites = [];

  List<DestintionsModel> get favorites => _favorites;
  bool isLoggedIn = true; // Replace with actual authentication logic

  bool isFavorite(DestintionsModel destination) {
    return _favorites.contains(destination);
  }

  void toggleFavorite(DestintionsModel destination) {
    if (isFavorite(destination)) {
      _favorites.remove(destination);
    } else {
      _favorites.add(destination);
    }
    notifyListeners();
  }
}
