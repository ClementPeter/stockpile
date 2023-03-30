//StockPile Model
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

@immutable
class StockPile {
  final String name;
  final String uuid;
  StockPile({required this.name, String? uuid})
      : uuid = uuid ?? const Uuid().v4();

  //function to update an the name - A subtype of the Parent class
  // StockPile updated([String? name]) {
  //   return StockPile(
  //     name: name ?? this.name,
  //    // uuid: uuid,
  //   );
  // }
  StockPile updated([String? name]) => StockPile(
        name: name ?? this.name,
        uuid: uuid,
      );

  //
  String get displayName => name;

  //to compare and make sure the object is unique - NECCESSARY : helps us to update stuff
  //the operator checks the uuid property of the "other" object to see if its equal to the object being compared too
  //covariant specifies that the "other" can be a subtype of the object being compared - "ChatGPT"

  @override
  bool operator ==(covariant StockPile other) => uuid == other.uuid;

  //needed by the compare operator
  @override
  // TODO: implement hashCode
  int get hashCode => uuid.hashCode;

  @override
  String toString() => "StockPile(name: $name, uuid: $uuid)";
}

// //create a List to model what the StockPile
// //final List<StockPile> stockPile = [];

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
//:::::::::::::REFACTOR METHOD TO USE STOCKPILE WITH STATENOTIFIER PROVIDER::::::::::::::://
//StockPile Model
// @immutable
// import 'package:flutter/material.dart';
// import 'package:uuid/uuid.dart';

// class StockPile {
//   late final String name;
//   final String uuid;
//   StockPile({required this.name, String? uuid})
//       : uuid = uuid ?? const Uuid().v4();

//   //our copyWith class -updated(){}
//   //function to update an the name - A subtype of the Parent class
//   //Creating another instance og the main class which can be updated
//   StockPile updated([String? name]) {
//     return StockPile(
//       name: name ?? this.name,
//       uuid: uuid,
//     );
//   }

//   //
//   String get displayName => name;

//   //to compare and make sure the object is unique - NECCESSARY : helps us to update stuff
//   //the operator checks the uuid property of the "other" object to see if its equal to the object being compared too
//   //covariant specifies that the "other" can be a subtype of the object being compared - "ChatGPT"

//   @override
//   bool operator ==(covariant StockPile other) => uuid == other.uuid;

//   //needed by the compare operator
//   @override
//   // TODO: implement hashCode
//   int get hashCode => uuid.hashCode;

//   //Creating another instance og the main class which can be updated
//   //NOT NEEDED UPDATED STANDS AS COPYWITH
//   // StockPile copyWith({String? name}) {
//   //   return StockPile(
//   //     name: name ?? this.name,
//   //     // uuid: uuid ?? this.uuid
//   //   );
//   // }
// }
