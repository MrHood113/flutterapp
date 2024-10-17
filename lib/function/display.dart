import 'package:flutter/material.dart';
import 'package:newapp_flutter/MongoDbModel.dart';
import 'package:newapp_flutter/dpHelper/mongodb.dart';
import 'package:newapp_flutter/function/insert.dart';

class MongoDbDisplay extends StatefulWidget {
  const MongoDbDisplay({super.key});

  @override
  State<MongoDbDisplay> createState() => _MongoDbDisplayState();
}

class _MongoDbDisplayState extends State<MongoDbDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> MongoDbInsert()));
      }, child: Icon(Icons.add),),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),

          child: FutureBuilder(
            future: MongoDatabase.getData(), 
            builder: (context, AsyncSnapshot snapshot){
              if(snapshot.connectionState==ConnectionState.waiting){
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if(snapshot.hasData){
                  // ignore: unused_local_variable
                  var totalData = snapshot.data.length;
                  print("Total Data" + totalData.toString());
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index){
                      return displayCard(
                        MongoDbModel.fromJson(
                          snapshot.data[index])
                      );
                    }
                  );
                } else{
                  return Center(child: Text("No Data Vailable"),);
                }
              }
            }
          ),
        )
      ),
    );
  }

  Widget displayCard(MongoDbModel data){
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5,),
            Text("${data.name}"),

            SizedBox(height: 5,),
            Text("${data.type}"),

            SizedBox(height: 5,),
            Text("${data.price}" + " VND"),
          ],
        ),
      ),
    );
  }
}