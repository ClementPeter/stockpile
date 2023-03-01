import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stockpile/model/stockpile.dart';

//Create Provider to pass StockPileNotifier to our App
final stockPileProvider = ChangeNotifierProvider<StockPileNotifier>((ref) {
  return StockPileNotifier();
});

//Provider class
class StockPileNotifier extends ChangeNotifier {
  //Empty list of task holding individual tasks

  List<StockPile> _pile = [];

  get pile => _pile;

  void addPile(StockPile pile) {
    _pile.add(pile);
    notifyListeners();
  }

  void clear() {
    _pile.clear();
    notifyListeners();
  }

  //List
}
