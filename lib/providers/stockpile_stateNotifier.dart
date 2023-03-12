import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stockpile/model/stockpile.dart';

//METHOD 1 - PERFORMING CRUD OPERATION WITH STATENOTIFIER
final stockPileStateNotifierProvider =
    StateNotifierProvider<StockPileStateNotifier, Object?>((ref) {
  //Allow our state to take an empty List so data can be added to it ;; hence it can be mutable
  return StockPileStateNotifier([]);
});

// final stockPileStateNotifierProvider =
//     StateNotifierProvider<StockPileStateNotifier, Object?>((ref) {
//   return StockPileStateNotifier([]); //works cos we keep our state dynamic 

//  // return StockPileStateNotifier();
// });

//the "super" keyword is how we pass data into our state
//he "state" is basically any object hence it accepts list,map etc

class StockPileStateNotifier extends StateNotifier {


  StockPileStateNotifier(super.state); //make our state overriddeable - ask chatgpt

  //To make the data in the state modifiable; override the state

  // @override
  // var state = [
  // StockPile(name: "Get 3 packs of chocolate 🍫"),
  // StockPile(name: "Get 1 packs of chocolate 🍫"),
  //   StockPile(name: "Get 3 packs of chocolate 🍫"),
  //   StockPile(name: "Get 1 packs of chocolate 🍫"),
  // ]; //

  get stateList => state;

  int get stateLength => state.length; //

  void addPile(StockPile pile) {
    state = [...state, pile];

    print("::::::::::::::${state.stateLength}::::::::::::::::::::");
    //_pile.add(pile);
    //     notifyListeners();
  }

  // void removePile(StockPile pile) {
  //   state = state.copyWith(
  //     pile: state.pile.where((p) => p != pile).toList(),
  //   );
  // }

  //Update an existing pile
  void removePile(StockPile pile) {
    state = state.where((p) => p != pile).toList();
  }

  // //Update an existing pile

  // void removePile(StockPile pileToRemove) {
  //   state.removeWhere((pile) => pile == pileToRemove).toList();
  // }

  //Update an existing pile
  void update(StockPile updatedPileItem) {
    final index = state.indexOf(updatedPileItem);

    final oldPileItem = state[index];

    if (oldPileItem.name != updatedPileItem.name) {
      //if it's not equal ; meaning they are different , thus update the value
      // state[index] = oldPileItem.updated(updatedPileItem.name);
      state[index] = oldPileItem.copyWith(name: updatedPileItem.name);
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

// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:stockpile/model/stockpile.dart';

// //METHOD 2 - PERFORMING CRUD OPERATION WITH STATENOTIFIER

// final stockPileStateNotifierProvider =
//     StateNotifierProvider<StockPileStateNotifier, Object?>((ref) {
//   return StockPileStateNotifier({});
// });

// // final stockPileStateNotifierProvider =
// //     StateNotifierProvider<StockPileStateNotifier, Object?>((ref) {
// //   return StockPileStateNotifier([]); //works cos we keep our state dynamic ; hence it can be mutable

// //  // return StockPileStateNotifier();
// // });

// //the "super" keyword is how we pass data into our state
// //he "state" is basically any object hence it accepts list,map etc

// class StockPileStateNotifier extends StateNotifier {
//   //we set our state to be an empty list of which we would add value too
//   // StockPileStateNotifier() : super([]);

//   StockPileStateNotifier(super.state); //make our state overriddeable

//   //To make the data in the state modifiable; override the state

//   // @override
//   // var state = [
//   //   StockPile(name: "Get 3 packs of chocolate 🍫"),
//   //   StockPile(name: "Get 1 packs of chocolate 🍫"),
//   //   StockPile(name: "Get 3 packs of chocolate 🍫"),
//   //   StockPile(name: "Get 1 packs of chocolate 🍫"),
//   // ]; //

//   get stateList => state;

//   int get stateLength => state.length; //

//   void addPile(StockPile pile) {
//     state = [...state, pile];

//     print("::::::::::::::${state.stateLength}::::::::::::::::::::");
//     //_pile.add(pile);
//     //     notifyListeners();
//   }

//   // void removePile(StockPile pile) {
//   //   state = state.copyWith(
//   //     pile: state.pile.where((p) => p != pile).toList(),
//   //   );
//   // }

//   //Update an existing pile
//   void removePile(StockPile pile) {
//     state = state.where((p) => p != pile).toList();
//   }

//   // //Update an existing pile

//   // void removePile(StockPile pileToRemove) {
//   //   state.removeWhere((pile) => pile == pileToRemove).toList();
//   // }

//   //Update an existing pile
//   void update(StockPile updatedPileItem) {
//     final index = state.indexOf(updatedPileItem);

//     final oldPileItem = state[index];

//     if (oldPileItem.name != updatedPileItem.name) {
//       //if it's not equal ; meaning they are different , thus update the value
//       // state[index] = oldPileItem.updated(updatedPileItem.name);
//       state[index] = oldPileItem.copyWith(name: updatedPileItem.name);
//     }
//   }

//   void clearPile() {
//     state = [];
//   }
// }

// // For example, " @XclusiveCyborg " explanation
// // Look at state notifier as Master and apprenticeship , the master influences the apprentice through instructions.

// // As the name implies State-Notifier

// // There is a state - (this holds all of the properties that are subject to change which you can pass to your UI)

// // And there’s Notifier - ( this holds all the methods that influences how your state changes).

// // Your statenotifier here is a StateNotifier that holds a List<Product>

// // What this means is that, the only thing that your State can provide is a list of type product nothing more. Just like a Dominos is known for producing pizzas.

// // So the method addProduct in your notifier class basically helps you add product into your state which holds a List<Product>.

// // So assume Product is pizza. The addProduct method for example everytime you call it helps you add one box of pizza to the List of pizza in your state.

// // So if you have been showing a List of pizza in your UI let’s say Pizza 1-10, everytime you add a pizza,it increases by 1 and the changes reflect in your UI.

// /* */
// /// And also the .family modifier isn’t for future provider alone.

// // The simple use case is if you want to pass a variable into your State,Future,Stream provider, you can use the .family modifier.
