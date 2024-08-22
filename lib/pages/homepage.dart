import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_registration/read%20data/get_user_name.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  final user=FirebaseAuth.instance.currentUser!;

  List<String>docIDs=[];

  Future getdocId()async{
    await FirebaseFirestore.instance.collection('users').orderBy('age',descending: true).get().then(
      (snapshot)=>snapshot.docs.forEach((document) {
        //print(document.reference);
        docIDs.add(document.reference.id);
         },),
      );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title:   Text(
          user.email!,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
            child: const Icon(Icons.logout,color: Colors.white,),
            )
        ],
      ),
      body: SafeArea(
        child: Expanded(
          child: FutureBuilder(
          future: getdocId(),
           builder: (context,snapshot){
            return ListView.builder(
              itemCount: docIDs.length,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: GetUserName(documentId: docIDs[index]),
                    tileColor: const Color.fromARGB(255, 185, 166, 216),
                  ),
                );
              },
              );
           })),
      ),
    );
  }
}