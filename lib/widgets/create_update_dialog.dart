import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stockpile/model/stockpile.dart';
import 'package:stockpile/widgets/custom_snackbar.dart';

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

















//*******************************************************//
//DIALOG WHEN USING STATE NOTIFIER
//creating the dialog function used by the ListTile and FAB

// final pileController = TextEditingController();

// // Future<StockPile?> createAndUpdateDialog(
// createAndUpdateDialog(
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
//       return Center(
//         child: SingleChildScrollView(
//           child: AlertDialog(
//             shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(20.0)),
//             ),
//             icon: Center(
//               child: Image.asset(
//                 "images/stockpile.png",
//                 height: 30,
//               ),
//             ),
//             title: Text(
//               title!,
//               style: GoogleFonts.raleway(
//                 textStyle: const TextStyle(color: Color(0xFF0C2539)),
//                 fontWeight: FontWeight.bold,
//                 fontSize: 22,
//               ),
//             ),
//             content: TextField(
//               controller: pileController,
//               cursorColor: const Color(0xFF0C2539),
//               autofocus: true,
//               style: GoogleFonts.raleway(
//                 textStyle: const TextStyle(color: Color(0xFF0C2539)),
//                 fontWeight: FontWeight.bold,
//               ),
//               decoration: InputDecoration(
//                 enabledBorder: const UnderlineInputBorder(
//                   borderSide: BorderSide(color: Color(0xFF0C2539)),
//                 ),
//                 focusedBorder: const UnderlineInputBorder(
//                   borderSide: BorderSide(color: Color(0xFF0C2539)),
//                 ),
//                 hintText: "Add a Pile to your Stock pile",
//                 hintStyle: GoogleFonts.raleway(),
//                 focusColor: const Color(0xFF0C2539),
//               ),
//               onChanged: ((value) {
//                 name = value;
//               }),
//             ),
//             actions: [
//               //cancel button
//               TextButton(
//                 child: Text(
//                   "Cancel",
//                   style: GoogleFonts.raleway(
//                     textStyle: const TextStyle(color: Color(0xFF0C2539)),
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//               //save button
//               TextButton(
//                 child: Text(
//                   "Save",
//                   style: GoogleFonts.raleway(
//                     textStyle: const TextStyle(color: Color(0xFF0C2539)),
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 onPressed: () {
//                   if (name != null) {
//                     if (existingPileItem != null) {
//                       //if we have exisitng pile item
//                       final newPileItem = existingPileItem.updated(
//                         name: name,
//                         isFavourite: false,
//                       );
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                           behavior: SnackBarBehavior.floating,
//                           backgroundColor: Colors.transparent,
//                           elevation: 0,
//                           duration: const Duration(milliseconds: 1200),
//                           content: customSnackBarContent(
//                             text: 'Pile Updated Successfully!',
//                             bgColor: const Color(0xFF21bb4e),
//                             shapeColor: const Color(0xFF09511E),
//                           ),
//                         ),
//                       );
//                       Navigator.of(context).pop(newPileItem);
//                     } else {
//                       //no existing Pile, create new one
//                       final newPileItem = StockPile(name: name!);
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                           behavior: SnackBarBehavior.floating,
//                           backgroundColor: Colors.transparent,
//                           elevation: 0,
//                           duration: const Duration(milliseconds: 1200),
//                           content: customSnackBarContent(
//                             text:
//                                 'Pile created and added to StockPile successfully!',
//                             bgColor: const Color(0xFF21bb4e),
//                             shapeColor: const Color(0xFF09511E),
//                           ),
//                         ),
//                       );
//                       Navigator.of(context).pop(newPileItem);
//                     }
//                   } else {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         elevation: 0,
//                         duration: const Duration(milliseconds: 1200),
//                         backgroundColor: Colors.transparent,
//                         content: customSnackBarContent(
//                           text: 'Fill in the Fields!',
//                           bgColor: const Color(0xFFC72C41),
//                           shapeColor: const Color(0xFF801336),
//                         ),
//                       ),
//                     );
//                   }
//                 },
//               ),
//             ],
//           ),
//         ),
//       );
//     }),
//   );
// }
