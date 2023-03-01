import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stock Pile',
      // darkTheme: ThemeData.dark.copyWith(),
      // theme: ThemeData(

      //   primarySwatch:
      // ),

      home: const MyHomePage(title: 'StockPile'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;

  final pileController = TextEditingController();

  //Dialog to add Pile to Stock Pile
  void showCustomDialog() {
    showDialog(
      context: context,
      builder: ((context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          icon: Center(
            child: Image.asset(
              "images/stockpile.png",
              height: 30,
            ),
          ),
          content: TextField(
            controller: pileController,
            decoration: const InputDecoration(
                hintText: "Add a Pile to your stock pile"),
            onChanged: ((value) {
              // name = value; //pass the value from text field into name
            }),
          ),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Save"),
              onPressed: () {
                //verify text fields are not empty before saving
                // if (name != null && unit != null) {
                //   //pass in the values directly to pop the scren
                //   // Navigator.of(context).pop(Item(name: name!, unit: unit!));
                //   if (existingItem != null) {
                //     //if an item existed ; update it
                //     final newItem = existingItem.updated(
                //       name,
                //       unit,
                //     );
                //     Navigator.of(context).pop(newItem);
                //   } else {
                //     Navigator.of(context).pop(Item(name: name!, unit: unit!));
                //     //or longer route - uncomment this
                //     //print(":::::::::::::::::::::::::::::$newItem");
                //     //final newItem = Item(name: name!, unit: unit!);
                //     //Navigator.of(context).pop(newItem);

                //   }
                // } else {
                //   ScaffoldMessenger.of(context).showSnackBar(
                //     const SnackBar(
                //       duration: Duration(seconds: 1),
                //       backgroundColor: Colors.red,
                //       content: Text("Fill in the fields"),
                //     ),
                //   );
                //   // Navigator.of(context).pop();
                // }
              },
            ),
          ],
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        // title: Text(widget.title,   style: GoogleFonts.alike(
        //         textStyle: Theme.of(context).textTheme.,
        //       ),),
        title: Text(
          widget.title,
          style: GoogleFonts.raleway(
              textStyle: TextStyle(color: Color(0xFF0C2539)),
              fontWeight: FontWeight.bold,
              fontSize: 24
              // textStyle: Theme.of(context).textTheme.displayMedium,
              ),
        ),
      ),
      body: Column(
        // Column is also a layout widget. It takes a list of children and
        // arranges them vertically. By default, it sizes itself to fit its
        // children horizontally, and tries to be as tall as its parent.
        //
        // Invoke "debug painting" (press "p" in the console, choose the
        // "Toggle Debug Paint" action from the Flutter Inspector in Android
        // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
        // to see the wireframe for each widget.
        //
        // Column has various properties to control how it sizes itself and
        // how it positions its children. Here we use mainAxisAlignment to
        // center the children vertically; the main axis here is the vertical
        // axis because Columns are vertical (the cross axis would be
        // horizontal).
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // const Text(
          //   'You have pushed the button this many times:',
          // ),
          Center(
            child: Text(
              'everyday code',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: showCustomDialog,
        // tooltip: 'Increment',
        child: Image.asset(
          "images/stockpile.png",
          height: 30,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
