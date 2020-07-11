import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar : AppBar(title: Text("logement application"),),
      body: StreamBuilder(
        stream:Firestore.instance.collection("offres").snapshots(),
        builder: (context , snapshot){
          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context,index){
              DocumentSnapshot course = snapshot.data.documents[index];
                return ListTile(
              leading: Image.network(course['imgLog']),
              title:Text(course['adresse']),

              );

            },
          );


        },
      )
      );

  }
}

