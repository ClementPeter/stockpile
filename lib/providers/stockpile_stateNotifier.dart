import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stockpile/model/stockpile.dart';

//PERFORMING CRUD OPERATION WITH STATE NOTIFIER
//Specify the provider which our app would access globally;
//Adding the type of the provider is also very helpful for readability
final stockPileStateNotifierProvider =
    StateNotifierProvider<StockPileStateNotifier, List<StockPile>>((ref) {
  //We keep our state dynamic to take an empty List so data can be added to it;hence it can be mutable
  return StockPileStateNotifier([]);
});

//the "super" keyword must be stated cos it is through it we pass data into our state
//the "state" is basically any object hence it accepts list,map etc
//Add the object type to avoid any error later on

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
    //locate the pile to remove
    state = state.where((pile) => pile != pileToRemove).toList();
  }

  void updatePile(StockPile updatedPileItem) {
    //to make an update; we check if the item already exists in our [state] and get the index
    final index = state.indexOf(updatedPileItem);

    //if it exists we get the actual data by accessing the state index
    final oldPileItem = state[index];

    if (oldPileItem.name != updatedPileItem.name) {
      //if it's not equal; meaning they are different, thus update the value
      state[index] =
          oldPileItem.updated(name: updatedPileItem.name, isFavourite: false);
    }
  }

  //clear pile ; By setting our state to be empty
  void clearPile() {
    state = [];
  }
}
