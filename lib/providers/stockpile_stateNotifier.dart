import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stockpile/model/stockpile.dart';

//METHOD 1 - PERFORMING CRUD OPERATION WITH STATE NOTIFIER
final stockPileStateNotifierProvider =
    StateNotifierProvider<StockPileStateNotifier, List<StockPile>>((ref) {
  //We keep our state dynamic to take an empty List so data can be added to it;hence it can be mutable
  return StockPileStateNotifier([]);
});

//the "super" keyword must be stated cos it is through it we pass data into our state
//he "state" is basically any object hence it accepts list,map etc

class StockPileStateNotifier extends StateNotifier<List<StockPile>> {
  // StockPileStateNotifier(
  //     super.state); //make our state overriddeable - ask chatgpt

  StockPileStateNotifier(List<StockPile> state) : super(state);

  //Add to data to our state
  void addPile(StockPile pile) {
    // using spread operator to add the existing data and pass in new one to the state
    state = [...state, pile];
    // print("::::::::::::::${state.stateLength}::::::::::::::::::::");
  }

//Remove an existing pile
  void removePile(StockPile pileToRemove) {
    // print("::::::::::::::${pileToRemove.name}::::::::::::::::::::");
    state = state.where((pile) => pile != pileToRemove).toList();
  }


  void updatePile(StockPile updatedPileItem) {
    //to make an update; we check if the item already exists in our [state] and get the index
    final index = state.indexOf(updatedPileItem);

    //if it exists we get the actual data by accessing the state index
    final oldPileItem = state[index];

    if (oldPileItem.name != updatedPileItem.name) {
      //if it's not equal; meaning they are different, thus update the value
      state[index] = oldPileItem.updated(updatedPileItem.name);
      // state.update(index, (pile) => pile.updated(updatedPileItem.name);
      // state[index] = updatedPileItem.updated(updatedPileItem.name);
    }


  }


  //clear pile ; By setting our state to be empty
  void clearPile() {
    state = [];
  }
}

// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //



// //METHOD 2 - PERFORMING CRUD OPERATION WITH STATENOTIFIER

// final stockPileStateNotifierProvider =
//     StateNotifierProvider<StockPileStateNotifier, List<StockPile>>((ref) {
//   return StockPileStateNotifier();
// });

// //the "super" keyword is how we pass data into our state
// //he "state" is basically any object hence it accepts list,map etc

// class StockPileStateNotifier extends StateNotifier<List<StockPile>> {
//   //we set our state to be an empty list of which we would add value too
//   StockPileStateNotifier()
//       : super([
//           // StockPile(name: "Get 3 packs of chocolate 🍫"),
//         ]);

//   //Getter arent recommended in Stateotifier
//   //get stateList => state;

//   //int get stateLength = state.length; //

//   void addPile(StockPile pile) {
//     state = [...state, pile];
//     print(":::::::ADD PILE METHOD:::::${state.length}:::::::::::::");
//   }

//   // //WORKING FINE
//   // It modifies the variable "state", which presumably contains a list of stockpiles.
//   // It creates a new list using a "list comprehension" which loops through each stockpile
//   //in the existing "state" list and adds all the stockpiles that are not equal to the one passed as the parameter.
//   // Finally, it assigns the new list to the "state" variable.
//   void removePile(StockPile piletoRemove) {
//     //Since our state is immutable...we will make a new list
//     //instead of changing the existing list
//     state = [
//       for (final pile in state)
//         if (pile != piletoRemove) pile,
//     ];
//   }

//   //WORKS FINE TOO - RemovePile v2
//   //It modifies the variable "state", which presumably contains a list of stockpiles.
//   //It uses the "where" function to create a new list that only contains the stockpiles
//   // that are not equal to the one passed as the parameter.
//   //It converts the new list into a regular list using "toList()" method.

//   // void removPile(StockPile piletoRemove) {
//   //   state = state.where((pile) => pile != piletoRemove).toList();
//   // }

//   //Update an existing pile
//    update(StockPile updatedPileItem) {
//     //to make an update ; we check if the item already exist in our [state] and get the index
//     //final index = state.indexOf(updatedPileItem);
//     final index = state.indexWhere((pile) => pile.uuid == updatedPileItem.uuid);

//     //if it exist we get the actual data by accesing the state index
//     final oldPileItem = state[index];

//     print(":::update pile index::$index:::::");

//     if (oldPileItem.name != updatedPileItem.name) {
//       //if it's not equal ; meaning they are different,thus update the value
//       state[index] = oldPileItem.updated(updatedPileItem.name);

//       List addedValue = state[index] as List;

//       //state = [addedValue]; wrong
//       state = [
//         ...state.sublist(0, index),
//         ...addedValue,
//       ];

//       //i feel the error comes from the way im passing it
//       //this add a new item to the state instead of updating it
//       // state = [...state, oldPileItem.copyWith(name: updatedPileItem.name)];

//       //works but update the selected value but clears the previous data in the state
//       // state = [
//       //   ...state.sublist(0, index),
//       //   oldPileItem.copyWith(name: updatedPileItem.name),
//       //   ...state.sublist(index, index - 0),
//       // // ...sublist(0, index),
//       // ];
//       // state[index].name = updatedPileItem.name;
//       //// state = List.of(state...replaceWhere(() =>))

//       //jargons
//       // state = state.contains((element) => element.name == oldPileItem.updated(updatedPileItem.name) );
//     } else {
//     // addPile(oldPileItem);
//       oldPileItem.name;
//     }
//   }

//   //Update an existing pile trial 2 chat gpt
//   // void update(StockPile updatedPileItem) {
//   //   //to make an update ; we check if the item already exist in our [state] and get the index

//   //   // final notes = <String>['do', 're', 'mi', 're'];
//   //   // final first = notes.indexWhere((note) => note.startsWith('r')); // 1
//   //   // final second = notes.indexWhere((note) => note.startsWith('r'), 2); // 3

//   //   final index = state.indexWhere((pile) => pile.uuid == updatedPileItem.uuid);

//   //   print(":::update pile index::$index:::::");

//   //   if (index >= 0) {
//   //     //if the pile exist ; update it
//   //     state[index].name = updatedPileItem.name;
//   //   } else {
//   //     // If the pile doesn't exist, add it to the state
//   //     addPile(updatedPileItem);
//   //   }

//   //   // //if it exist we get the actual data by accesing the state index
//   //   // final oldPileItem = state[index];

//   //   // if (oldPileItem.name != updatedPileItem.name) {
//   //   //   //if it's not equal ; meaning they are different,thus update the value
//   //   //   //state[index] = oldPileItem.updated(updatedPileItem.name) ;

//   //   //   //i feel the error comes from the way im passing it
//   //   //   //this add a new item to the state instead of updating it
//   //   //   // state = [...state, oldPileItem.copyWith(name: updatedPileItem.name)];

//   //   //   //works but update the selected value but clears the previous data in the state
//   //   //   //state = [oldPileItem.copyWith(name: updatedPileItem.name)];
//   //   //   state = List.of(state...replaceWhere(() =>))

//   //   //   //jargons
//   //   //   // state = state.contains((element) => element.name == oldPileItem.updated(updatedPileItem.name) );
//   //   // }else{
//   //   //   oldPileItem.name;

//   //   // }
//   // }

//   // // Update an existing pile
//   // void updateP(StockPile updatedPileItem) {
//   //   // Check if the item already exists in our [state] and get the index
//   //   final index = state
//   //       .indexWhere((oldPileItem) => oldPileItem.name == updatedPileItem.name);

//   //   print(":::update pile index::$index:::::");

//   //   if (index != -1) {
//   //     // If it exists, get the actual data by accessing the state index
//   //     final oldPileItem = state[index];

//   //     if (oldPileItem.name != updatedPileItem.name) {
//   //       // If it's not equal, meaning they are different, update the value
//   //       // state[index] = oldPileItem.copyWith(name: updatedPileItem.name);
//   //       // Alternatively, create a new list with the updated item and assign it to the state
//   //       state = [
//   //         // ...state.sublist(0, index),
//   //         oldPileItem.copyWith(name: updatedPileItem.name),
//   //         // ...state.sublist(index , index+1),
//   //       ];
//   //     } else {
//   //       // If they are the same, no need to update
//   //       oldPileItem.name;
//   //     }
//   //   } else {
//   //     // If it doesn't exist, add it to the state
//   //     // state.add(updatedPileItem);
//   //     //oldPileItem.name
//   //     state = [...state];
//   //   }
//   // }

// // In this implementation, the StockPile class is defined with a copyWith() method that creates a new instance of the class with updated properties. The StockManager class has a state property that is a list of StockPile objects, and the update() method updates an existing item in the list with the one passed to it, or adds the item to the list if it doesn't exist yet.

// // The updated item is found in the list using the indexWhere() method with a lambda function that checks if the name property of the item matches the one passed to the method. If the item exists, its index is used to access it in the list, and its name property is compared with the one passed to the method to determine if an update is needed.

// // If an update is needed, a new list is created with the updated item using the spread operator (...) to concatenate parts of the original list before and after the item being updated. This new list is then assigned to the state property. If no update is needed, the name property of the existing item is returned.

// // If the item doesn't exist in the list, it is added to the state list using the add() method.

//   ////Update an existing pile
//   // void update(StockPile updatedPileItem) {
//   //   //to make an update ; we check if the item already exist in our [state] and get the index
//   //   final index = state.indexOf(updatedPileItem);

//   //   //if it exist we get the actual data by accesing the state index
//   //   final oldPileItem = state[index];

//   //   if (oldPileItem.name != updatedPileItem.name) {
//   //     //if it's not equal ; meaning they are different,thus update the value
//   //     state[index] = oldPileItem.updated(updatedPileItem.name);
//   //     // state[index] = oldPileItem.copyWith(name: updatedPileItem.name);
//   //   }
//   // }

//   // //Update an existing pile
//   void updatepp(StockPile updatedPileItem) {
//     final index = state.indexOf(updatedPileItem);

//     // print("::::::updated item index::::::::${index}::::::::::::::::::::");

//     final oldPileItem = state[index];

//     if (oldPileItem.name != updatedPileItem.name) {
//       print(
//           "::::::old item name::::::::${oldPileItem.name}::::::::::::::::::::");

//       // print(          "::::::updated item ::::::::${updatedPileItem.name}::::::::::::::::::::");
//       //if it's not equal ; meaning they are different , thus update the value
//       final newlyUpdatedItem = oldPileItem.updated(updatedPileItem.name);

//       print(
//           "::::::updated item name ::::::::${newlyUpdatedItem.name}::::::::::::::::::::");

//       // state[newlyUpdatedItem];
//       // state.update[newlyUpdatedItem];
//       //add to the updated item to the state
//       //state = [newlyUpdatedItem];

//       //  state = state[newlyUpdatedItem];

//       //  state[] = newlyUpdatedItem;

//       //  state = state.index[newlyUpdatedItem];

//       // state = state.replace(newlyUpdatedItem);
//       //state = [...state,  List.of(state..replaceWhere(...)))];

//       // print("::::::new::::::::${newlyUpdatedItem}::::::::::::::::::::");
//       // print(state);

//       // state[index] = oldPileItem.updated(name: updatedPileItem.name);

//     }
//   }

//   void clearPile() {
//     state = [];
//   }
// }
