import 'package:flutter/material.dart';

class FavourtiProvider extends ChangeNotifier {
  final List _fav = [];
  List get fav => _fav;

  setFav(int index) {
    print(index);
    if (_fav.contains(index)) {
      _fav.remove(index);
    } else {
      _fav.add(index);
    }

    notifyListeners();
  }
}
