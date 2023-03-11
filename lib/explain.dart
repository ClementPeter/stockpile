
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




