import 'package:flutter/material.dart';
import 'package:login_registration/pages/login.dart';

import '../pages/register.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  bool showLoginPage=true;
  
  void toggleScreen(){
    setState(() {
      showLoginPage=!showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return Login(showRegisterpage: toggleScreen);
    }
    else{
      return RegisterPage(showLoginPage: toggleScreen,);
    }
  }
}