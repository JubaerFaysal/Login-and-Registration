import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_registration/auth_page/auth_page.dart';

import '../pages/homepage.dart';

class Checkpage extends StatelessWidget {
  const Checkpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(), 
      builder: (context,snapshot){
        if(snapshot.hasData){
          return const Homepage();
        }
        else{
          return const AuthPage();
        }
      }),
    );
  }
}