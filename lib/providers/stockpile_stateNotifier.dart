// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:river_pod/models/product.dart';

// //Create a provider for StateNotifierProvider - with autoDispose modifier
// //autoDispose returns oi
// final cartStateNotifierProvider =
//     StateNotifierProvider.autoDispose<CartStateNotifier, List<Product>>((ref) {
//   return CartStateNotifier();
// });

// //State notifier is more preferred to Change Provider Notifier
// class CartStateNotifier extends StateNotifier<List<Product>> {
//   //super helps  define the initial state of our object : super[->empty List<-]
//   CartStateNotifier() : super([]);

//   addProduct(Product product) {
//     state = [...state, product];
//   }

//   clearCart() {
//     state = [];
//   }
// }

import 'dart:collection';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stockpile/model/stockpile.dart';

final stockPileStateNotifierProvider = StateNotifierProvider((ref) {
  return StockPileStateNotifier();
});

class StockPileStateNotifier extends StateNotifier {
  StockPileStateNotifier() : super([]);

  @override
  var state = [
    StockPile(name: "Get 3 packs of chocolate 🍫"),
    StockPile(name: "Get 1 packs of chocolate 🍫"),
  ]; //Wrong

  UnmodifiableListView get stateList => state;

  int get stateLength => state.length; //wrong

  void addPile(StockPile pile) {
    state = [...state, pile];
    //_pile.add(pile);
    //     notifyListeners();
  }

  // void removePile (StockPile pile){
  //   state = state.copyWith(cart : state.cart.where((p) => p != pile).toList(),
  //   );

  // }

  //Update an existing pile
  void removePile(StockPile pile) {
    state = state.where((p) => p != pile).toList();
  }

  //Update an existing pile
  void update(StockPile updatedPileItem) {
    final index = state.indexOf(updatedPileItem);

    final oldPileItem = state[index];

    if (oldPileItem.name != updatedPileItem.name) {
      //if it's not equal ; meaning they are different , thus update the value
      state[index] = oldPileItem.updated(updatedPileItem.name);
    }
  }

  void clearPile() {
    state = [];
  }
} 






// For example, " @XclusiveCyborg " explanation
// Look at state notifier as Master and apprenticeship , the master influences the apprentice through instructions.

// As the name implies State-Notifier

// There is a state - (this holds all of the properties that are subject to change which you can pass to your UI)

// And there’s Notifier - ( this holds all the methods that influences how your state changes).

// Your statenotifier here is a StateNotifier that holds a List<Product>

// What this means is that, the only thing that your State can provide is a list of type product nothing more. Just like a Dominos is known for producing pizzas.

// So the method addProduct in your notifier class basically helps you add product into your state which holds a List<Product>.

// So assume Product is pizza. The addProduct method for example everytime you call it helps you add one box of pizza to the List of pizza in your state.

// So if you have been showing a List of pizza in your UI let’s say Pizza 1-10, everytime you add a pizza,it increases by 1 and the changes reflect in your UI.

/* */
/// And also the .family modifier isn’t for future provider alone.

// The simple use case is if you want to pass a variable into your State,Future,Stream provider, you can use the .family modifier.