import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserName extends StatelessWidget {
  final String documentId;
   const GetUserName({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {

    CollectionReference users=FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
       builder: ((context,snapshot){
        if(snapshot.connectionState==ConnectionState.done){
          Map<String,dynamic>data=snapshot.data!.data()as Map<String,dynamic>;
          return Text("${data['first name']} ${data['last name']}\n${data['age']} years old",style: const TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
          fontSize: 25,
          fontWeight: FontWeight.w500),);
        }
        return const Text('loading..');
       })
       );
    
  }
}