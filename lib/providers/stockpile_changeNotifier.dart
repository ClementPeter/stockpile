import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stockpile/model/stockpile.dart';

//Create Provider to pass StockPileNotifier to our App
final stockPileChangeNotifierProvider =
    Provider<StockPileNotifier>((ref) {
  return StockPileNotifier();
});

//River pod changeNotifier class
class StockPileNotifier extends ChangeNotifier {
  //Empty list of task holding individual tasks

  //List of stockpile
  final List<StockPile> _pile = [
    StockPile(name: "Get 3 packs of chocolate 🍫"),
  ];
  //Getter to get list of the _pile
  int get pileItemAmount => _pile.length;

  //Getter to get length of the _pile
  UnmodifiableListView<StockPile> get pile => UnmodifiableListView(_pile);

  //Add a pile from the StockPile
  void addPile(StockPile pile) {
    _pile.add(pile);
    notifyListeners();
  }

  //Remove a pile from the StockPile
  void removePile(StockPile pile) {
    _pile.remove(pile);
    notifyListeners();
  }

  //Update an existing pile
  void update(StockPile updatedPileItem) {
    //check if the updatedPile already exist in the _pile index
    final index = _pile.indexOf(updatedPileItem);

    final oldPileItem = _pile[index];

    if (oldPileItem.name != updatedPileItem.name) {
      //if it's not equal ; meaning they are different , thus update the value
      _pile[index] = oldPileItem.updated(updatedPileItem.name);
      notifyListeners();
    }
  }

  void clearPile() {
    //print(":::::::::::::::::::BEFORE CLEAR PILE::::::::::::::::::::::::");
    print(_pile);
    _pile.clear();
    // print(":::::::::::::::::::CLEAR PILE::::::::::::::::::::::::");
    // print(_pile);
    notifyListeners();
  }
}
