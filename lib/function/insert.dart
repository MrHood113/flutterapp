import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;
import 'package:newapp_flutter/MongoDbModel.dart';
import 'package:newapp_flutter/dpHelper/mongodb.dart';
import 'package:newapp_flutter/function/display.dart';

class MongoDbInsert extends StatefulWidget {
  const MongoDbInsert({super.key});

  @override
  State<MongoDbInsert> createState() => _MongoDbInsertState();
}

class _MongoDbInsertState extends State<MongoDbInsert> {

  var nameController = new TextEditingController();
  var typeController = new TextEditingController();
  var priceController = new TextEditingController();

  //var checkInsertUpdate = "Insert";

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> MongoDbDisplay()));
      }, child: Icon(Icons.home),),

      body: SafeArea(
        child: 
          Column(
            children: [
              SizedBox(
                height: 30,),

              Text(
                "Insert Product", 
                style: TextStyle(
                    fontSize: 22),
              ),

              SizedBox(height: 30,),

              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Name"
                ),
              ),

              TextField(
                controller: typeController,
                decoration: InputDecoration(
                  labelText: "Type"
                ),
              ),

              TextField(
                controller: priceController,
                decoration: InputDecoration(
                  labelText: "Price"
                ),
              ),

              SizedBox(height: 50,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                        insertData(nameController.text, typeController.text, priceController.text);
                    }, 
                    child: Text("Insert")
                  )
                ],
              )
            ],
          ),
      ),
    );
  }

  Future<void> insertData(String name, String type, String price) async{
    var id = M.ObjectId();
    final data = MongoDbModel(
      id: id, name: name, type: type, price: price);
    // var result = 
    await MongoDatabase.insert(data);
    clearAll();
  }
  
  void clearAll() {
    nameController.text = "";
    typeController.text = "";
    priceController.text = "";
  }
}