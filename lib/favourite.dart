import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stockpile/model/stockpile.dart';

// // // //Films Notifier modifies the state of the "allFilms" List using StateNotifer
// // class FilmsNotifier extends StateNotifier<List<Film>> {
// //   FilmsNotifier() : super([]);

// //   void update(Film film, bool isFavourite) {
// //     //check through the contents in the state and if the id is the same
// //     //in order to replace it in "state" which is  a List of things

// //     state = state
// //         .map((thisFilm) => thisFilm.id == film.id
// //             ? thisFilm.copyWith(isFavourite: isFavourite)
// //             : thisFilm)
// //         .toList();
// //   }
// // }

// class FavouriteNotifier extends StateNotifier<List<StockPile>> {
//   FavouriteNotifier() : super([]);

//   void updateFavourite(StockPile pile, bool isFavourite) {
//     //check through the contents in the state and if the id is the same
//     //in order to replace it in "state" which is  a List of things

//     state = state
//         .map((thisPile) => thisPile.name == pile.name
//             ? thisPile.updated(name: pile.name, isFavourite: isFavourite)
//             : thisPile)
//         .toList();
//   }
// }

// // //"allFilmsProvider" provides
// // final allFilmsProvider =
// //     StateNotifierProvider<FilmsNotifier, List<Film>>((ref) => FilmsNotifier());

// //Watching allFilmsProvider to get the selected favourites and non favourites from allFilmsProvider
// // final favoriteFilmProvider = Provider<Iterable<Film>>(
// //   (ref) => ref.watch(allFilmsProvider).where((film) => film.isFavourite),
// // );

// // final notfavoriteFilmProvider = Provider<Iterable<Film>>(
// //     (ref) => ref.watch(allFilmsProvider).where((film) => !film.isFavourite));

// // ////////////////////////
// // final allFavouritePileProvider =
// //     StateNotifierProvider<FavouriteNotifier, List<StockPile>>(
// //         (ref) => FavouriteNotifier());

// // final favouritePileProvider = Provider<Iterable<StockPile>>((ref) {
// //   return ref.watch(allFavouritePileProvider);
// // });

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        //backgroundColor: const Color(0XFFFCFAFF),
        title: Text(
          "Favourite",
          // style: GoogleFonts.raleway(
          //   //textStyle: const TextStyle(color: Color(0xFF0C2539)),
          //   fontWeight: FontWeight.bold,
          //   fontSize: 24,
          // ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Column(
            children: [],
          )),
          const Divider(height: 5),
          Expanded(
            child: SingleChildScrollView(
              child: Container(),
            ),
          )
        ],
      ),
      // body: CustomScrollView(
      //   slivers: [
      //     SliverToBoxAdapter(
      //       child: Column(
      //         mainAxisSize: MainAxisSize.min,
      //         children: [
      //           Expanded(
      //               child: Column(
      //             children: [],
      //           )),
      //           const Divider(height: 5),
      //           Expanded(
      //             child: SingleChildScrollView(
      //               child: Container(),
      //             ),
      //           )
      //         ],
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}
