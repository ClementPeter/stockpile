// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:stockpile/model/stockpile.dart';

// //METHOD 1 - PERFORMING CRUD OPERATION WITH STATENOTIFIER
// final stockPileStateNotifierProvider =
//     StateNotifierProvider<StockPileStateNotifier, Object?>((ref) {
//   //We keep our state dynamic to take an empty List so data can be added to it ;; hence it can be mutable
//   return StockPileStateNotifier([]);
// });

// //the "super" keyword must be stated cos it is through it we pass data into our state
// //he "state" is basically any object hence it accepts list,map etc

// class StockPileStateNotifier extends StateNotifier {
//   StockPileStateNotifier(
//       super.state); //make our state overriddeable - ask chatgpt

//   //getting data over out of our state
//   get stateList => state;

//   //get the number of the data in our state
//   int get stateLength => state.length;

//   //Add to data to our state
//   void addPile(StockPile pile) {
//     // using spread operator to add the existing data and pass in new one to the state
//     state = [...state, pile];
//     // print("::::::::::::::${state.stateLength}::::::::::::::::::::");
//   }

// //Remove an existing pile
// void removePile(StockPile pileToRemove) {
//   // print("::::::::::::::${pileToRemove.name}::::::::::::::::::::");
//   state = state.where((pile) => pile != pileToRemove).toList();
// }

// //Update an existing pile
// void update(StockPile updatedPileItem) {
//   //to make an update ; we check if the item already exist in our [state] and get the index
//   final index = state.indexOf(updatedPileItem);

//   //if it exist we get the actual data by accesing the state index
//   final oldPileItem = state[index];

//   if (oldPileItem.name != updatedPileItem.name) {
//     //if it's not equal ; meaning they are different,thus update the value
//     state[index] = oldPileItem.updated(updatedPileItem.name);
//     // state[index] = oldPileItem.copyWith(name: updatedPileItem.name);
//   }
// }

//   //clear pile ; By setting our state to be empty
//   void clearPile() {
//     state = [];
//   }
// }

//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stockpile/model/stockpile.dart';

//METHOD 2 - PERFORMING CRUD OPERATION WITH STATENOTIFIER

final stockPileStateNotifierProvider =
    StateNotifierProvider<StockPileStateNotifier, List<StockPile>>((ref) {
  return StockPileStateNotifier();
});

//the "super" keyword is how we pass data into our state
//he "state" is basically any object hence it accepts list,map etc

class StockPileStateNotifier extends StateNotifier<List<StockPile>> {
  //we set our state to be an empty list of which we would add value too
  StockPileStateNotifier() : super([]);

  //Getter arent recommended in Stateotifier
  //get stateList => state;

  //int get stateLength = state.length; //

  void addPile(StockPile pile) {
    state = [...state, pile];
    print(":::::::ADD PILE:::::::${state.length}::::::::::::::::::::");
  }

// //WORKING FINE
// It modifies the variable "state", which presumably contains a list of stockpiles.
// It creates a new list using a "list comprehension" which loops through each stockpile in the existing "state" list and adds all the stockpiles that are not equal to the one passed as the parameter.
// Finally, it assigns the new list to the "state" variable.
  void removePile(StockPile piletoRemove) {
    //Since our state is immutable...we will make a new list
    //instead of changing the existing list
    state = [
      for (final pile in state)
        if (pile != piletoRemove) pile,
    ];
  }

//WORKS FINE TOO
//It modifies the variable "state", which presumably contains a list of stockpiles.
//It uses the "where" function to create a new list that only contains the stockpiles that are not equal to the one passed as the parameter.
//It converts the new list into a regular list using "toList()" method.

  // void removePile(StockPile piletoRemove) {
  //   state = state.where((pile) => pile != piletoRemove).toList();
  // }

  //Update an existing pile
  update(StockPile updatedPileItem) {
    //to make an update ; we check if the item already exist in our [state] and get the index
    final index = state.indexOf(updatedPileItem);

    //if it exist we get the actual data by accesing the state index
    final oldPileItem = state[index];

    if (oldPileItem.name != updatedPileItem.name) {
      //if it's not equal ; meaning they are different,thus update the value
      //state[index] = oldPileItem.updated(updatedPileItem.name) ;

      //i feel the error comes from the way im passing it
      //this add a new item to the state instead of updating it
      // state = [...state, oldPileItem.copyWith(name: updatedPileItem.name)];

      //works but update the selected value but clears the previous data in the state
      state = [oldPileItem.copyWith(name: updatedPileItem.name)];

      //jargons
      // state = state.contains((element) => element.name == oldPileItem.updated(updatedPileItem.name) );
    }
  }

  ////Update an existing pile
  // void update(StockPile updatedPileItem) {
  //   //to make an update ; we check if the item already exist in our [state] and get the index
  //   final index = state.indexOf(updatedPileItem);

  //   //if it exist we get the actual data by accesing the state index
  //   final oldPileItem = state[index];

  //   if (oldPileItem.name != updatedPileItem.name) {
  //     //if it's not equal ; meaning they are different,thus update the value
  //     state[index] = oldPileItem.updated(updatedPileItem.name);
  //     // state[index] = oldPileItem.copyWith(name: updatedPileItem.name);
  //   }
  // }

  // //Update an existing pile

  // void removePile(StockPile pileToRemove) {
  //   state.removeWhere((pile) => pile == pileToRemove).toList();
  // }

  // //Update an existing pile
  // void update(StockPile updatedPileItem) {
  //   final index = state.indexOf(updatedPileItem);

  //   // print("::::::updated item index::::::::${index}::::::::::::::::::::");

  //   final oldPileItem = state[index];

  //   if (oldPileItem.name != updatedPileItem.name) {
  //     print(
  //         "::::::old item name::::::::${oldPileItem.name}::::::::::::::::::::");

  //     // print(          "::::::updated item ::::::::${updatedPileItem.name}::::::::::::::::::::");
  //     //if it's not equal ; meaning they are different , thus update the value
  //     final newlyUpdatedItem = oldPileItem.updated(updatedPileItem.name);

  //     print(
  //         "::::::updated item name ::::::::${newlyUpdatedItem.name}::::::::::::::::::::");

  //     // state[newlyUpdatedItem];
  //     // state.update[newlyUpdatedItem];
  //     //add to the updated item to the state
  //     //state = [newlyUpdatedItem];

  //     //  state = state[newlyUpdatedItem];

  //     //  state[] = newlyUpdatedItem;

  //     //  state = state.index[newlyUpdatedItem];

  //     state = state.replace(newlyUpdatedItem);

  //     // print("::::::new::::::::${newlyUpdatedItem}::::::::::::::::::::");
  //     // print(state);

  //     // state[index] = oldPileItem.updated(name: updatedPileItem.name);

  //   }
  // }

  void clearPile() {
    state = [];
  }
}
