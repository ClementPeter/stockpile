
// Good day everyone,  - 
//  pls I need some clarity on the .Notifier class in riverpod...
//  does it trigger the method but does not listen to the change that has happened in that same method?

// Also is it also subjected to be used when using StateNotifier alone ?

// Hendrick Flutterbyte
//I think you're talking about the .read method
//
//Well what the .read method does for a notifier class is 
//reading the current state of the notifier only once(which is when the request is made with the .read)
//and doesn't try to check if the state has changed unless you call the .read again or a rebuild happens

//.watch is for continuous observation of the state of the notifier class
//So if the state of the notifier changes usually by reassigning the state variable, wherever a .watch is plugged would all update/

//For .read it won't try to update unless you call it again

//ME - Pls What really happens behind and what does notifier do ?

// Hendrick Flutterbyte :
//It serves as your state orchestrator otherwise called a viewcontroller/viewmodel(this depends on your architecture)
//If you've used provider with change notifier before you'd notice some similarities between the two with some differences
//While a change notifier uses the notifierListeners() function to tell all its listeners to check their values,
//A state notifier class does it internally when the state variable is reassigned

//It's also why the state notifier requires you pass an object in its super constructor
// so it has a state value to update for whenever it's reassigned
//it has value which would cause the notifyListeners to be called for/invoke whenever it's reassigned

//.notifier is for getting access to the state notifiers functions

//If you want to write it change notifier style which is not adviced
//You can create variables in your state notifier class and still get their values via the .notifier
//Like in this example. (Riverpod learn)
// Because of the way ref works to get access to the functions in the state notifier class 
//e.g thr clearPile() in this example, you have to pass .notifier else the state notifier class
// would provide you access to the state value instead
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





