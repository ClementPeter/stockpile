import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stockpile/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stockpile/splash.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StockPile',
      theme: ThemeData(
        snackBarTheme: SnackBarThemeData(
          contentTextStyle: GoogleFonts.raleway(
            textStyle: const TextStyle(color: Colors.white),
            fontWeight: FontWeight.w500,            
          ),
        ),
        textSelectionTheme: const TextSelectionThemeData(
          selectionHandleColor: Color(0xFF0C2539),
        ),
        indicatorColor: const Color(0xFF0C2539),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFF0C2539),
        ),
      ),
      //home: const MyHomePage(),
      home:  const SplashScreen()  
    );
  }
}

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
///
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
//::::::::::REBUILDING STOCKPILE USING HIVE DATABASE WITHOUT RIVERPOD:::::::::::://

// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:stockpile/model/stockpile.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:stockpile/model/stockpile.dart';
// import 'package:stockpile/providers/stockpile_changeNotifier.dart';
// import 'package:stockpile/widget/custom_fab.dart';
// import 'package:stockpile/widget/custom_snackbar.dart';

// void main() async {
//   //Setup HIVE
//   WidgetsFlutterBinding.ensureInitialized();
//   await Hive.initFlutter();
//   //Create Hive DB where Data would be stored offline
//   await Hive.openBox('shopping_box');
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'StockPile',
//       theme: ThemeData(
//         snackBarTheme: SnackBarThemeData(
//           contentTextStyle: GoogleFonts.raleway(
//             textStyle: const TextStyle(color: Colors.white),
//             fontWeight: FontWeight.w500,
//             //fontSize: 20,
//           ),
//         ),
//         textSelectionTheme: const TextSelectionThemeData(
//           selectionHandleColor: Color(0xFF0C2539),
//         ),
//         indicatorColor: const Color(0xFF0C2539),
//         colorScheme: ColorScheme.fromSwatch().copyWith(
//           secondary: const Color(0xFF0C2539),
//         ),
//       ),
//       home: const MyHomePage(title: "StockPile"),
//       //home: const AweseomSnackBarExample(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   //Reference HIVE box to store and extract data
//   final shopping_box = Hive.box('shopping_box');

//   //Hive storage passes data her to be displayed in the UI
//   List<Map<String, dynamic>> items = [
//     {"aaa": 111},
//     {"bbb": 222},
//     {"ccc": 333}
//   ];

//   //Create item to be passed to hive using Map
//   Future<void> createItem(Map<String, dynamic> newItem) async {
//     await shopping_box.add(newItem);
//     // print(":::amount of items in hive: ${shopping_box.length}:::");
//     //print(":::keys of items in hive: ${shopping_box.keys}:::");
//     refreshItem();
//   }

//   //Update Item
//   Future<void> updateItem(int itemKey, Map<String, dynamic> item) async {
//     await shopping_box.put(itemKey, item);
//     refreshItem();
//   }

//   //Delete Item
//   Future<void> deleteItem(int itemKey) async {
//     await shopping_box.delete(itemKey);
//     refreshItem();
//   }

//   //Delete Item
//   Future<void> clearDB() async {
//     await shopping_box.clear();
//     refreshItem();
//   }

//   //converts hive data to a list of maps and return a List of which we can pass into a ListView.builder
//   void refreshItem() {
//     final data = shopping_box.keys.map((key) {
//       //get the values from the keys values of the Hive DB
//       final item = shopping_box.get(key);
//       return {"key": key, "name": item["name"], "quantity": item["quantity"]};
//     }).toList();

//     //update the data and pass it to items which refreshes the UI

//     setState(() {
//       //Store it into the empty List of Item
//       items = data.toList();
//       print(":::amount of items in hive: ${shopping_box.length}:::");
//       print(":::keys of items in hive: ${shopping_box.keys}:::");
//       print(":::items in List: ${items.length}:::");
//       print(":::::::::::::::::::::::::");
//     });
//   }

//   //controllers
//   //TextEditingController _nameController = TextEditingController();
//   //TextEditingController _quantityController = TextEditingController();

//   //show form bottom modal sheet
//   // void showForm(BuildContext ctx, int? itemKey) async {
//   //   //if item is not equal to null ; meaning a key is provided then we are editing an item
//   //   if (itemKey != null) {
//   //     final existingItem =
//   //         items.firstWhere((element) => element["key"] == itemKey);

//   //     //set the text of the controller to the existing item name
//   //     _nameController.text = existingItem["name"];
//   //     _quantityController.text = existingItem["quantity"];
//   //   }

//   //   showModalBottomSheet(
//   //       isScrollControlled: true,
//   //       context: context,
//   //       builder: (context) {
//   //         return Container(
//   //           padding: EdgeInsets.only(
//   //             bottom: MediaQuery.of(ctx).viewInsets.bottom,
//   //             top: 15,
//   //             left: 15,
//   //             right: 15,
//   //           ),
//   //           child: Column(
//   //             mainAxisSize: MainAxisSize.min,
//   //             crossAxisAlignment: CrossAxisAlignment.end,
//   //             children: [
//   //               TextField(
//   //                 controller: _nameController,
//   //                 decoration: const InputDecoration(
//   //                   labelText: 'Name',
//   //                 ),
//   //               ),
//   //               const SizedBox(height: 10),
//   //               TextField(
//   //                 controller: _quantityController,
//   //                 decoration: const InputDecoration(
//   //                   labelText: 'Quantity',
//   //                 ),
//   //               ),
//   //               const SizedBox(height: 20),
//   //               ElevatedButton(
//   //                 onPressed: () async {
//   //                   if (itemKey == null) {
//   //                     await createItem({
//   //                       "name": _nameController.text,
//   //                       "quantity": _quantityController.text,
//   //                     });
//   //                   }

//   //                   if (itemKey != null) {
//   //                     updateItem(itemKey, {
//   //                       "name": _nameController.text,
//   //                       "quantity": _quantityController.text,
//   //                     });
//   //                   }

//   //                   _nameController.text = "";
//   //                   _quantityController.text = "";
//   //                   Navigator.of(context).pop();
//   //                 },
//   //                 child: Text(itemKey == null ? "Create Item" : "Update Item"),
//   //               )
//   //             ],
//   //           ),
//   //         );
//   //       });
//   // }

//   //*******************************************************//

// //creating the dialog function used by the ListTile and FAB

//   final pileController = TextEditingController();

//   createAndUpdateDialog(
//     BuildContext context,
//     String? title,
//     int? itemKey,
//     // [ StockPile? existingPileItem,]
//   ) {
//     // String? name = existingPileItem?.name;
//     String? name = items[itemKey!]["name"];

//     //the dialog should contain the existing name from the ListTile or be empty
//     pileController.text = name ?? "";

//     if (itemKey != null) {
//       final existingItem =
//           items.firstWhere((element) => element["key"] == itemKey);

//       //set the text of the controller to the existing item name
//       pileController.text = existingItem["name"];
//       //_quantityController.text = existingItem["quantity"];
//     }

//     return showDialog(
//       context: context,
//       builder: ((context) {
//         return AlertDialog(
//           shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.all(Radius.circular(20.0)),
//           ),
//           icon: Center(
//             child: Image.asset(
//               "images/stockpile.png",
//               height: 30,
//             ),
//           ),
//           title: Text(
//             title!,
//             style: GoogleFonts.raleway(
//               textStyle: const TextStyle(color: Color(0xFF0C2539)),
//               fontWeight: FontWeight.bold,
//               fontSize: 22,
//             ),
//           ),
//           content: TextField(
//             controller: pileController,
//             cursorColor: const Color(0xFF0C2539),
//             autofocus: true,
//             style: GoogleFonts.raleway(
//               textStyle: const TextStyle(color: Color(0xFF0C2539)),
//               fontWeight: FontWeight.bold,
//             ),
//             decoration: InputDecoration(
//               enabledBorder: const UnderlineInputBorder(
//                 borderSide: BorderSide(color: Color(0xFF0C2539)),
//               ),
//               focusedBorder: const UnderlineInputBorder(
//                 borderSide: BorderSide(color: Color(0xFF0C2539)),
//               ),
//               hintText: "Add a Pile to your Stock pile",
//               hintStyle: GoogleFonts.raleway(),
//               focusColor: const Color(0xFF0C2539),
//             ),
//             // onChanged: ((value) {
//             //   name = value;
//             // }),
//           ),
//           actions: [
//             TextButton(
//               child: Text(
//                 "Cancel",
//                 style: GoogleFonts.raleway(
//                   textStyle: const TextStyle(color: Color(0xFF0C2539)),
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             TextButton(
//               child: Text(
//                 "Save",
//                 style: GoogleFonts.raleway(
//                   textStyle: const TextStyle(color: Color(0xFF0C2539)),
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               onPressed: () async {
//                 if (itemKey == null) {
//                   await createItem({
//                     "name": pileController.text,
//                   });

//                   if (itemKey != null) {
//                     updateItem(itemKey, {"name": pileController.text});
//                   }
//                   // if (existingPileItem != null) {
//                   //   //we have exisitng pile item
//                   //   final newPileItem = existingPileItem.updated(name);
//                   //   ScaffoldMessenger.of(context).showSnackBar(
//                   //     SnackBar(
//                   //       behavior: SnackBarBehavior.floating,
//                   //       backgroundColor: Colors.transparent,
//                   //       elevation: 0,
//                   //       duration: const Duration(milliseconds: 1200),
//                   //       content: customSnackBarContent(
//                   //         text: 'Pile Updated Successfully!',
//                   //         bgColor: const Color(0xFF21bb4e),
//                   //         shapeColor: const Color(0xFF09511E),
//                   //       ),
//                   //     ),
//                   //   );

//                   //   Navigator.of(context).pop(newPileItem);
//                   // } else {
//                   //   //no existing person, create new one
//                   //   final newPileItem = StockPile(name: name!);

//                   //   ScaffoldMessenger.of(context).showSnackBar(
//                   //     SnackBar(
//                   //       behavior: SnackBarBehavior.floating,
//                   //       backgroundColor: Colors.transparent,
//                   //       elevation: 0,
//                   //       duration: const Duration(milliseconds: 1200),
//                   //       content: customSnackBarContent(
//                   //         text:
//                   //             'Pile created and added to StockPile successfully!',
//                   //         bgColor: const Color(0xFF21bb4e),
//                   //         shapeColor: const Color(0xFF09511E),
//                   //       ),
//                   //     ),
//                   //   );
//                   //   Navigator.of(context).pop(newPileItem);
//                   // }
//                 } else {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       elevation: 0,
//                       duration: const Duration(milliseconds: 1200),
//                       backgroundColor: Colors.transparent,
//                       content: customSnackBarContent(
//                         text: 'Fill in the Fields!',
//                         bgColor: const Color(0xFFC72C41),
//                         shapeColor: const Color(0xFF801336),
//                       ),
//                     ),
//                   );
//                 }
//               },
//             ),
//           ],
//         );
//       }),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CustomFloatingActionButton(
//       spaceFromRight: 40,
//       spaceFromBottom: 80,
//       type: CustomFloatingActionButtonType.verticalUp,
//       openFloatingActionButton: Container(
//         width: 30,
//         height: 30,
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage("images/stockpile.png"),
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//       closeFloatingActionButton: const Icon(Icons.close),
//       options: [
//         Wrap(
//           direction: Axis.vertical,
//           children: [
//             FloatingActionButton(
//               child: const Icon(Icons.add, size: 22),
//               onPressed: () {
//                 // final newPileItem =
//                 //  await
//                 setState(() {
//                   createAndUpdateDialog(context, "Create a Pile", null);
//                 });

//                 // if (newPileItem != null) {

//                 //   //final dataModel = ref.read(stockPileChangeNotifierProvider);
//                 //   // dataModel.addPile(newPileItem);
//                 // }
//               },
//             ),
//             const SizedBox(height: 10),
//             FloatingActionButton(
//               onPressed: () {
//                 //Clear HIVE DB
//                 clearDB();
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     behavior: SnackBarBehavior.floating,
//                     backgroundColor: Colors.transparent,
//                     elevation: 0,
//                     duration: const Duration(milliseconds: 1200),
//                     content: customSnackBarContent(
//                       text: "StockPile cleared successfully!",
//                       bgColor: const Color(0xFFC72C41),
//                       shapeColor: const Color(0xFF801336),
//                     ),
//                   ),
//                 );
//               },
//               child: const Icon(Icons.delete, size: 22),
//             ),
//           ],
//         ),
//         const SizedBox(height: 5),
//       ],
//       body: Scaffold(
//         appBar: AppBar(
//           title: Text(widget.title),
//           centerTitle: true,
//         ),
//         body: ListView.builder(
//             itemCount: items.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 title: Text("${items[index]["name"]}"),
//                 subtitle: Text("${items[index]["quantity"]}"),
//                 onTap: () {
//                   createAndUpdateDialog(
//                     context,
//                     "Update a Pile",
//                     items[index]["key"],
//                   );
//                 },
//                 // trailing: Row(
//                 //   mainAxisSize: MainAxisSize.min,
//                 //   children: [
//                 //     //edit button
//                 //     IconButton(
//                 //       icon: const Icon(Icons.edit),
//                 //       onPressed: () {
//                 //         createAndUpdateDialog(
//                 //           context,
//                 //           "Update Tile",
//                 //           items[index]["key"],
//                 //         );
//                 //         // showForm(context, items[index]["key"]);
//                 //         // updateItem(items[index]["key"],
//                 //         // {} );
//                 //       },
//                 //     ),
//                 //     //delete button
//                 //     IconButton(
//                 //       icon: const Icon(Icons.delete),
//                 //       onPressed: () {
//                 //         deleteItem(items[index]["key"]);
//                 //         // shopping_box.delete(items[index]["key"]);
//                 //         // refreshItem();
//                 //       },
//                 //     ),
//                 //   ],
//                 // ),
//               );
//             }),
//       ),
//     );
//   }
// }
