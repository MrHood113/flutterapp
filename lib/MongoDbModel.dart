// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

MongoDbModel mongoDbModelFromJson(String str) =>
  MongoDbModel.fromJson(json.decode(str));

  String mongoDbModelToJson(MongoDbModel data) => json.encode(data.toJson());
  
  class MongoDbModel {
    MongoDbModel({
      required this.id,
      required this.name,
      required this.type,
      required this.price,
    });

    ObjectId id;
    String name;
    String type;
    String price;

    factory MongoDbModel.fromJson(Map<String, dynamic> json) => MongoDbModel(
      id: json["id"], 
      name: json["name"], 
      type: json["type"], 
      price: json["price"]
      );

      Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "price": price,
      };
  }
