import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stockpile/model/stockpile.dart';
import 'package:stockpile/providers/stockpile_changeNotifier.dart';
import 'package:stockpile/widget/custom_fab.dart';
//import 'package:custom_floating_action_button/custom_floating_action_button.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
        //stream: null,
        builder: (context, WidgetRef ref, child) {
      //Source code for "CustomFloatingActionButton" was modified in this project
      return CustomFloatingActionButton(
        spaceFromRight: 50,
        spaceFromBottom: 50,
        openFloatingActionButton: Container(
            // width: 30,
            // height: 30,
            // decoration: const BoxDecoration(
            //   color: Colors.red,
            //   image: DecorationImage(
            //     image: AssetImage("images/stockpile.png"),
            //     fit: BoxFit.cover,
            //   ),
            //   // borderRadius: BorderRadius.all(Radius.circular(10)),
            // ),
            ),
        // openFloatingActionButton:  Image.asset(
        //     "images/stockpile.png",
        //     height: 30,
        //   ),
        // openFloatingActionButton: const Icon(
        //   Icons.add,
        //   shadows: [
        //     Shadow(color: Color(0xFF0C2539), blurRadius: 50.0),
        //   ],
        // ),
        // openFloatingActionButton: FloatingActionButton(
        //   mini: false,
        //   backgroundColor: Colors.white,
        //   onPressed: () {
        //     // final dataModel = ref.read(stockPileProvider);
        //     // dataModel.addPileItem();
        //   },
        // child: Image.asset(
        //   "images/stockpile.png",
        //   height: 30,
        // ),
        // ),
        type: CustomFloatingActionButtonType.verticalUp,
        closeFloatingActionButton: const Icon(Icons.close),

        options: [
          FloatingActionButton(onPressed: () {}),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              final dataModel = ref.read(stockPileProvider);
              dataModel.clearPile();
            },
            child: const Icon(
              Icons.delete,
              size: 22,
            ),
          ),
          // CircleAvatar(
          //   child: Icon(Icons.title),
          // ),
          // CircleAvatar(
          //   child: Icon(Icons.translate),
          // ),
          // CircleAvatar(
          //   child: Icon(Icons.email),
          // ),
          // CircleAvatar(
          //   child: Icon(Icons.star),
          // ),
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
          body: Consumer(builder: (context, ref, child) {
            final pileItemModel = ref.watch(stockPileProvider);
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
                          //padding: const EdgeInsets.symmetric(horizontal: 900),
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
                            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                                    textStyle: const TextStyle(
                                        color: Color(0xFF0C2539)),
                                    fontSize: 19,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    });
          }),
          floatingActionButton:
              Consumer(builder: (context, WidgetRef ref, child) {
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
                const SizedBox(width: 30),
                FloatingActionButton(
                  onPressed: () {
                    final dataModel = ref.read(stockPileProvider);
                    dataModel.clearPile();
                  },
                  child: const Icon(
                    Icons.delete,
                    size: 22,
                  ),
                ),
              ],
            );
          }),
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
          decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF0C2539)),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF0C2539)),
            ),
            hintText: "Add a Pile to your Stock pile",
            hintStyle: GoogleFonts.raleway(),
            focusColor: Color(0xFF0C2539),
          ),
          onChanged: ((value) {
            name = value;
          }),
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(foregroundColor: Color(0xFF0C2539)),
            child: const Text(
              "Cancel",
              style: TextStyle(color: Color(0xFF0C2539)),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(foregroundColor: Color(0xFF0C2539)),
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
              } else {
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
