import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:newapp_flutter/MongoDbModel.dart';
import 'package:newapp_flutter/dpHelper/constant.dart';


//Connect
class MongoDatabase {
  static var db, userCollection;
  static connect() async{
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    userCollection = db.collection(USER_COLLECTION);
  }

  //List
  static Future<List<Map<String, dynamic>>> getData() async{
    final arrData = await userCollection.find().toList();

    return arrData;
  }

  //Add
  static Future<String> insert(MongoDbModel data) async{
    try{
      var result = await userCollection.insertOne(data.toJson());
      if(result.isSuccess){
        return "Product Inserted";
      } else {
        return "Product Insertion Failed"; 
      }
    } catch(e) {
      print(e.toString());
      return e.toString();
    }
  }
}