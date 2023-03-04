import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stockpile/model/stockpile.dart';
import 'package:stockpile/providers/stockpile_changeNotifier.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: <Widget>[
      //     Center(
      //       child: Text(
      //         'everyday code',
      //         style: Theme.of(context).textTheme.headline4,
      //       ),
      //     ),
      //   ],
      // ),
      body: Consumer(builder: (context, ref, child) {
        final pileItemModel = ref.watch(stockPileProvider);
        return pileItemModel.pileItemAmount == 0
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Add a Pile to your StockPile",
                    style: GoogleFonts.raleway(
                      textStyle: const TextStyle(color: Color(0x690C2539)),
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: Image.asset(
                          "images/stockpile.png",
                          height: 90,
                        ),
                      ),
                      //const SizedBox(width: 50)
                    ],
                  ),
                ],
              )
            : ListView.builder(
                itemCount: pileItemModel.pileItemAmount,
                itemBuilder: (context, index) {
                  // return Dismissible(
                  //   direction: DismissDirection.endToStart,
                  //   // onDismissed: (direction) {
                  //   //   setState(() {
                  //   //     // demoCarts.removeAt(index);
                  //   //   });
                  //   },
                  // background: Container(
                  //   padding: EdgeInsets.symmetric(horizontal: 20),
                  //   decoration: BoxDecoration(
                  //     color: const Color(0xFFFFE6E6),
                  //     borderRadius: BorderRadius.circular(15),
                  //   ),
                  //   child: Row(
                  //     children: [
                  //       const Spacer(),
                  //       //Icon(icon: Icons.delete,)
                  //       Icon(
                  //         Icons.delete_outline,
                  //         // color: Colors.bluree,
                  //         //size: 36.0,
                  //       ),
                  //       //SvgPicture.asset("assets/icons/Trash.svg")
                  //     ],
                  //   ),
                  // ),
                  //   key: Key("2"),
                  //   child: ListTile(
                  //     title: Text("Pile 1"),
                  //   ),
                  // );
                  final pileItem = pileItemModel.pile[index];
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Dismissible(
                      key: Key(pileItem.name),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        pileItemModel.removePile(pileItem);
                        print(pileItemModel.pileItemAmount);
                      },
                      background: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
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
                        title: GestureDetector(
                          onTap: () async {
                            final updatedPileItem = await createAndUpdateDialog(
                                context, "Update a Pile", pileItem);

                            if (updatedPileItem!.name == "") {
                              // pileItemModel.update(updatedPileItem);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  duration: Duration(seconds: 1),
                                  backgroundColor: Colors.red,
                                  content: Text("Fill in the fields"),
                                ),
                              );
                            }
                            if (updatedPileItem.name != "") {
                              pileItemModel.update(updatedPileItem);
                            }
                          },
                          child: Text(
                            pileItem.displayName,
                            style: GoogleFonts.raleway(
                              textStyle:
                                  const TextStyle(color: Color(0xFF0C2539)),
                              //  fontWeight: FontWeight.
                              fontSize: 19,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // child: ListTile(
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(10),
                    //   ),
                    //   tileColor: const Color(0x2C0D2E68),
                    //   title: GestureDetector(
                    //     onTap: () async {
                    //       final updatedPileItem =
                    //           await createAndUpdateDialog(context, pileItem);
                    //       //if its not empty ; update
                    //       if (updatedPileItem != null) {
                    //         pileItemModel.update(updatedPileItem);
                    //       } else {
                    //         ScaffoldMessenger.of(context).showSnackBar(
                    //           const SnackBar(
                    //             duration: Duration(seconds: 1),
                    //             backgroundColor: Colors.red,
                    //             content: Text("Fill in the fields"),
                    //           ),
                    //         );
                    //       }
                    //     },
                    //     child: Text(
                    //       pileItem.displayName,
                    //       style: GoogleFonts.raleway(
                    //         textStyle:
                    //             const TextStyle(color: Color(0xFF0C2539)),
                    //         //  fontWeight: FontWeight.
                    //         fontSize: 19,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  );
                });
      }),
      floatingActionButton: Consumer(builder: (context, WidgetRef ref, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () async {
                final newpileItem =
                    await createAndUpdateDialog(context, "Create a Pile");
                //verify then update the ChangeNotifierProvider

                //if item is available add it to the List
                if (newpileItem != null) {
                  final dataModel = ref.read(stockPileProvider);
                  dataModel.addPile(newpileItem);
                }
              },
              child: Image.asset(
                "images/stockpile.png",
                height: 30,
              ),
            ),
            SizedBox(width: 30),
            FloatingActionButton(
                onPressed: () {
                  final dataModel = ref.read(stockPileProvider);
                  dataModel.clearPile();
                },
                child: const Icon(
                  Icons.delete,
                  size: 22,
                )),
          ],
        );
      }),
    );
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
      return AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        icon: Center(
          child: Image.asset(
            "images/stockpile.png",
            height: 30,
          ),
        ),
        title: Text(title!),
        content: TextField(
          controller: pileController,
          cursorColor: const Color(0xFF0C2539),
          autofocus: true,
          decoration: const InputDecoration(
            hintText: "Add a Pile to your Stock pile",
            // hintStyle: TextStyle(
            //   fontFamily: GoogleFonts.raleway(
            //                 textStyle:
            //                     const TextStyle(color: Color(0xFF0C2539)),
            //                 //  fontWeight: FontWeight.
            //                 fontSize: 19,
            //               ),
            // ),
            focusColor: Color(0xFF0C2539),
            // focusedBorder: InputBorder(
            //   borderSide: Borde
            // )
          ),
          onChanged: ((value) {
            name = value;
          }),
        ),
        actions: [
          TextButton(
            child: const Text(
              "Cancel",
              style: TextStyle(color: Color(0xFF0C2539)),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            // style: ButtonStyle(
            //   overlayColor: Colors.red
            // ),
            child: const Text(
              "Save",
              style: TextStyle(color: Color(0xFF0C2539)),
            ),
            onPressed: () {
              if (name != null) {
                if (existingPileItem != null) {
                  //have exisitng pile item
                  final newPileItem = existingPileItem.updated(name);
                  Navigator.of(context).pop(newPileItem);
                } else {
                  //no existing person, create new one
                  final newPileItem = StockPile(name: name!);
                  Navigator.of(context).pop(newPileItem);
                }

                // if (existingPileItem != null) {
                //   final newPileItem = existingPileItem.updated(name);
                //   Navigator.of(context).pop(newPileItem);
                // } else {
                //   Navigator.of(context).pop(StockPile(name: name!));
                // }
              } else {
                //Textfield empty
                //Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    duration: Duration(seconds: 1),
                    backgroundColor: Colors.red,
                    content: Text("Fill in the fields"),
                  ),
                );
              }
            },
          ),
        ],
      );
    }),
  );
}
