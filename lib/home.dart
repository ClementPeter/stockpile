import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stockpile/model/stockpile.dart';
import 'package:stockpile/providers/stockpile_changeNotifier.dart';
import 'package:stockpile/widget/custom_fab.dart';
import 'package:stockpile/widget/custom_snackbar.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, WidgetRef ref, child) {
      return CustomFloatingActionButton(
        spaceFromRight: 40,
        spaceFromBottom: 80,
        type: CustomFloatingActionButtonType.verticalUp,
        openFloatingActionButton: Container(
          width: 30,
          height: 30,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/stockpile.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        closeFloatingActionButton: const Icon(Icons.close),
        options: [
          Wrap(
            direction: Axis.vertical,
            children: [
              FloatingActionButton(
                child: const Icon(Icons.add, size: 22),
                onPressed: () async {
                  final newPileItem =
                      await createAndUpdateDialog(context, "Create a Pile");

                  if (newPileItem != null) {
                    //we "read" cos we need to get a snapshot of what is in the list already

                    final dataModel = ref.read(stockPileChangeNotifierProvider);
                    dataModel.addPile(newPileItem);
                  }
                },
              ),
              const SizedBox(height: 10),
              FloatingActionButton(
                onPressed: () {
                  final dataModel = ref.read(stockPileChangeNotifierProvider);
                  dataModel.clearPile();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      duration: const Duration(milliseconds: 1200),
                      content: customSnackBarContent(
                        text: "StockPile cleared successfully!",
                        bgColor: const Color(0xFFC72C41),
                        shapeColor: const Color(0xFF801336),
                      ),
                    ),
                  );
                },
                child: const Icon(Icons.delete, size: 22),
              ),
            ],
          ),
          const SizedBox(height: 5),
        ],
        body: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: const Color(0XFFFCFAFF),
            title: Text(
              "StockPile",
              style: GoogleFonts.raleway(
                textStyle: const TextStyle(color: Color(0xFF0C2539)),
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          body: Center(
            child: Consumer(builder: (context, ref, child) {
              final pileItemModel = ref.watch(stockPileChangeNotifierProvider);
              return pileItemModel.pileItemAmount == 0
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                "Add a Pile to your StockPile",
                                style: GoogleFonts.raleway(
                                  textStyle:
                                      const TextStyle(color: Color(0x690C2539)),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 130),
                            child: SizedBox(
                              child: Image.asset(
                                "images/here.png",
                                height: 200,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : ListView.builder(
                      itemCount: pileItemModel.pileItemAmount,
                      itemBuilder: (context, index) {
                        final pileItem = pileItemModel.pile[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Dismissible(
                            key: Key(pileItem.name),
                            direction: DismissDirection.endToStart,
                            onDismissed: (direction) {
                              pileItemModel.removePile(pileItem);
                              //print(pileItemModel.pileItemAmount);
                            },
                            background: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFE6E6),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: const [
                                  Spacer(),
                                  Icon(
                                    Icons.delete_outline,
                                    color: Color(0xB70C2539),
                                    //size: 36.0,
                                  ),
                                ],
                              ),
                            ),
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              tileColor: const Color(0x2C0D2E68),
                              title: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: GestureDetector(
                                  onTap: () async {
                                    final updatedPileItem =
                                        await createAndUpdateDialog(
                                            context, "Update a Pile", pileItem);

                                    if (updatedPileItem!.name == "") {}
                                    if (updatedPileItem.name != "") {
                                      pileItemModel.update(updatedPileItem);
                                    }
                                  },
                                  child: Text(
                                    pileItem.displayName,
                                    style: GoogleFonts.raleway(
                                        textStyle: const TextStyle(
                                            color: Color(0xFF0C2539)),
                                        fontSize: 19,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      });
            }),
          ),
        ),
      );
    });
  }
}

//*******************************************************//

//creating the dialog function used by the ListTile and FAB

final pileController = TextEditingController();

Future<StockPile?> createAndUpdateDialog(
  BuildContext context,
  String? title, [
  StockPile? existingPileItem,
]) {
  String? name = existingPileItem?.name;

  //the dialog should contain the existing name from the ListTile or be empty
  pileController.text = name ?? "";

  return showDialog<StockPile?>(
    context: context,
    builder: ((context) {
      return Center(
        child: SingleChildScrollView(
          child: AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            icon: Center(
              child: Image.asset(
                "images/stockpile.png",
                height: 30,
              ),
            ),
            title: Text(
              title!,
              style: GoogleFonts.raleway(
                textStyle: const TextStyle(color: Color(0xFF0C2539)),
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            content: TextField(
              controller: pileController,
              cursorColor: const Color(0xFF0C2539),
              autofocus: true,
              style: GoogleFonts.raleway(
                textStyle: const TextStyle(color: Color(0xFF0C2539)),
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF0C2539)),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF0C2539)),
                ),
                hintText: "Add a Pile to your Stock pile",
                hintStyle: GoogleFonts.raleway(),
                focusColor: const Color(0xFF0C2539),
              ),
              onChanged: ((value) {
                name = value;
              }),
            ),
            actions: [
              TextButton(
                child: Text(
                  "Cancel",
                  style: GoogleFonts.raleway(
                    textStyle: const TextStyle(color: Color(0xFF0C2539)),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text(
                  "Save",
                  style: GoogleFonts.raleway(
                    textStyle: const TextStyle(color: Color(0xFF0C2539)),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  if (name != null) {
                    if (existingPileItem != null) {
                      //we have exisitng pile item
                      final newPileItem = existingPileItem.updated(name);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          duration: const Duration(milliseconds: 1200),
                          content: customSnackBarContent(
                            text: 'Pile Updated Successfully!',
                            bgColor: const Color(0xFF21bb4e),
                            shapeColor: const Color(0xFF09511E),
                          ),
                        ),
                      );

                      Navigator.of(context).pop(newPileItem);
                    } else {
                      //no existing person, create new one
                      final newPileItem = StockPile(name: name!);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          duration: const Duration(milliseconds: 1200),
                          content: customSnackBarContent(
                            text:
                                'Pile created and added to StockPile successfully!',
                            bgColor: const Color(0xFF21bb4e),
                            shapeColor: const Color(0xFF09511E),
                          ),
                        ),
                      );
                      Navigator.of(context).pop(newPileItem);
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        elevation: 0,
                        duration: const Duration(milliseconds: 1200),
                        backgroundColor: Colors.transparent,
                        content: customSnackBarContent(
                          text: 'Fill in the Fields!',
                          bgColor: const Color(0xFFC72C41),
                          shapeColor: const Color(0xFF801336),
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      );
    }),
  );
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
//:::::::::::::REBUILDING STOCKPILE USING STATENOTIFIER PROVIDER::::::::::::::://

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:stockpile/model/stockpile.dart';
// import 'package:stockpile/providers/stockpile_stateNotifier.dart';
// import 'package:stockpile/widget/custom_fab.dart';
// import 'package:stockpile/widget/custom_snackbar.dart';
// //import 'package:custom_floating_action_button/custom_floating_action_button.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer(builder: (context, WidgetRef ref, child) {
//       // final stockPileProvider = Provider((ref) {
//       //   return stockPileStateNotifierProvider;
//       // });

//       //if i keep it here the FAB doesnt see it
//       final pileItem = ref.watch(stockPileStateNotifierProvider);
//       return CustomFloatingActionButton(
//         spaceFromRight: 40,
//         spaceFromBottom: 80,
//         type: CustomFloatingActionButtonType.verticalUp,
//         openFloatingActionButton: Container(
//           width: 30,
//           height: 30,
//           decoration: const BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage("images/stockpile.png"),
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//         closeFloatingActionButton: const Icon(Icons.close),
//         options: [
//           Wrap(
//             direction: Axis.vertical,
//             children: [
//               FloatingActionButton(
//                 onPressed: () {
//                   //accessing stateNotifer fucntion using .read &.notifier modifiers

//                   final clearStuff =
//                       ref.watch(stockPileStateNotifierProvider.notifier);

//                   clearStuff.clearPile();

//                   print(
//                       ":::::::DELETE:::::::${clearStuff.state.length}::::::::::::::::::::");

//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       behavior: SnackBarBehavior.floating,
//                       backgroundColor: Colors.transparent,
//                       elevation: 0,
//                       duration: const Duration(seconds: 2),
//                       content: customSnackBarContent(
//                         text: "StockPile cleared successfully!",
//                         bgColor: const Color(0xFFC72C41),
//                         shapeColor: const Color(0xFF801336),
//                       ),
//                     ),
//                   );
//                 },
//                 child: const Icon(Icons.delete, size: 22),
//               ),
//               const SizedBox(height: 10),
//               FloatingActionButton(
//                 child: const Icon(Icons.add, size: 22),
//                 onPressed: () async {
//                   final newItemPile =
//                       await createAndUpdateDialog(context, "Create a Pile");

//                   final pileLength =
//                       ref.read(stockPileStateNotifierProvider.notifier);

//                   if (newItemPile != null) {
//                     //  print(                        ":::::ADD BUTTON:::::::::${pileLength.state.length}::::::::::::::::::::");

//                     ref
//                         .watch(stockPileStateNotifierProvider.notifier)
//                         .addPile(newItemPile);
//                   } else {
//                     print(":if newpile is null:::");
//                   }
//                 },
//               ),
//             ],
//           ),
//           const SizedBox(height: 10),
//         ],
//         body: Scaffold(
//           appBar: AppBar(
//             centerTitle: true,
//             elevation: 0,
//             backgroundColor: const Color(0XFFFCFAFF),
//             title: Text(
//               "StockPile",
//               style: GoogleFonts.raleway(
//                 textStyle: const TextStyle(color: Color(0xFF0C2539)),
//                 fontWeight: FontWeight.bold,
//                 fontSize: 24,
//               ),
//             ),
//           ),
//           body: Consumer(builder: (context, ref, child) {
//             final pileItemModel =
//                 ref.watch(stockPileStateNotifierProvider.notifier);
//             return pileItemModel.state.isEmpty
//                 ? Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       //Text Watermarked page when there is no item on the (ChangeNotifierprovider) List
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Center(
//                             child: Text(
//                               "Add a Pile to your StockPile",
//                               style: GoogleFonts.raleway(
//                                 textStyle:
//                                     const TextStyle(color: Color(0x690C2539)),
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 25,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 20),
//                       Align(
//                         alignment: Alignment.centerRight,
//                         child: Padding(
//                           padding: const EdgeInsets.only(right: 130),
//                           child: SizedBox(
//                             child: Image.asset(
//                               "images/here.png",
//                               height: 200,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   )
//                 : ListView.builder(
//                     itemCount: pileItemModel.state.length,
//                     itemBuilder: (context, index) {
//                       final pileItem = pileItemModel.state[index];
//                       return Padding(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 10, vertical: 5),
//                         child: Dismissible(
//                           key: Key(pileItem.name),
//                           direction: DismissDirection.endToStart,
//                           onDismissed: (direction) {
//                             print(
//                                 ":::::DISMISSIBLE STATE COUNT:::::${pileItemModel.state.length}::::::::::");
//                             pileItemModel.removePile(pileItem);
//                             //pileItemModel.clearPile();
//                           },
//                           background: Container(
//                             padding: const EdgeInsets.symmetric(horizontal: 20),
//                             decoration: BoxDecoration(
//                               color: const Color(0xFFFFE6E6),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Row(
//                               children: const [
//                                 Spacer(),
//                                 Icon(
//                                   Icons.delete_outline,
//                                   color: Color(0xB70C2539),
//                                   //size: 36.0,
//                                 ),
//                               ],
//                             ),
//                           ),
//                           child: ListTile(
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             tileColor: const Color(0x2C0D2E68),
//                             title: Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 20),
//                               child: GestureDetector(
//                                 onTap: () {
//                                   setState(() async {
//                                     final updatedPileItem =
//                                         await createAndUpdateDialog(
//                                             context, "Update a Pile", pileItem);

//                                     if (updatedPileItem!.name != "") {}

//                                     pileItemModel.update(updatedPileItem);
//                                   });
//                                 },
//                                 child: Text(
//                                   pileItem.displayName,
//                                   style: GoogleFonts.raleway(
//                                     textStyle: const TextStyle(
//                                         color: Color(0xFF0C2539)),
//                                     fontSize: 19,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       );
//                     });
//           }),
//         ),
//       );
//     });
//   }
// }

// //*******************************************************//

// //creating the dialog function used by the ListTile and FAB

// final pileController = TextEditingController();

// Future<StockPile?> createAndUpdateDialog(
//   BuildContext context,
//   String? title, [
//   StockPile? existingPileItem,
// ]) {
//   String? name = existingPileItem?.name;

//   //the dialog should contain the existing name from the ListTile or be empty
//   pileController.text = name ?? "";

//   return showDialog<StockPile?>(
//     context: context,
//     builder: ((context) {
//       return AlertDialog(
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(20.0)),
//         ),
//         icon: Center(
//           child: Image.asset(
//             "images/stockpile.png",
//             height: 30,
//           ),
//         ),
//         title: Text(
//           title!,
//           style: GoogleFonts.raleway(
//             textStyle: const TextStyle(color: Color(0xFF0C2539)),
//             fontWeight: FontWeight.bold,
//             fontSize: 22,
//           ),
//         ),
//         content: TextField(
//           controller: pileController,
//           cursorColor: const Color(0xFF0C2539),
//           autofocus: true,
//           style: GoogleFonts.raleway(
//             textStyle: const TextStyle(color: Color(0xFF0C2539)),
//             fontWeight: FontWeight.bold,
//           ),
//           decoration: InputDecoration(
//             enabledBorder: const UnderlineInputBorder(
//               borderSide: BorderSide(color: Color(0xFF0C2539)),
//             ),
//             focusedBorder: const UnderlineInputBorder(
//               borderSide: BorderSide(color: Color(0xFF0C2539)),
//             ),
//             hintText: "Add a Pile to your Stock pile",
//             hintStyle: GoogleFonts.raleway(),
//             focusColor: const Color(0xFF0C2539),
//           ),
//           onChanged: ((value) {
//             name = value;
//           }),
//         ),
//         actions: [
//           TextButton(
//             child: Text(
//               "Cancel",
//               style: GoogleFonts.raleway(
//                 textStyle: const TextStyle(color: Color(0xFF0C2539)),
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//           TextButton(
//             child: Text(
//               "Save",
//               style: GoogleFonts.raleway(
//                 textStyle: const TextStyle(color: Color(0xFF0C2539)),
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             onPressed: () {
//               if (name != null) {
//                 if (existingPileItem != null) {
//                   //have exisitng pile item
//                   final newPileItem = existingPileItem.updated(name);
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       behavior: SnackBarBehavior.floating,
//                       backgroundColor: Colors.transparent,
//                       elevation: 0,
//                       duration: const Duration(milliseconds: 1200),
//                       content: customSnackBarContent(
//                         text: 'Pile Updated Successfully!',
//                         bgColor: const Color(0xFF21bb4e),
//                         shapeColor: const Color(0xFF09511E),
//                       ),
//                     ),
//                   );

//                   Navigator.of(context).pop(newPileItem);
//                 } else {
//                   //no existing person, create new one
//                   final newPileItem = StockPile(name: name!);

//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       behavior: SnackBarBehavior.floating,
//                       backgroundColor: Colors.transparent,
//                       elevation: 0,
//                       duration: const Duration(milliseconds: 1200),
//                       content: customSnackBarContent(
//                         text:
//                             'Pile created and added to StockPile successfully!',
//                         bgColor: const Color(0xFF21bb4e),
//                         shapeColor: const Color(0xFF09511E),
//                       ),
//                     ),
//                   );
//                   Navigator.of(context).pop(newPileItem);
//                 }
//               } else {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     elevation: 0,
//                     duration: const Duration(milliseconds: 1200),
//                     backgroundColor: Colors.transparent,
//                     content: customSnackBarContent(
//                       text: 'Fill in the Fields!',
//                       bgColor: const Color(0xFFC72C41),
//                       shapeColor: const Color(0xFF801336),
//                     ),
//                   ),
//                 );
//               }
//             },
//           ),
//         ],
//       );
//     }),
//   );
// }
