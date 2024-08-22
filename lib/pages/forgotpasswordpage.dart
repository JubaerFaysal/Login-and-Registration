
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailcontroller = TextEditingController();

  @override
  void dispose(){
    emailcontroller.dispose();
    super.dispose();
  }
  Future passwordreset()async{
   try{
    await FirebaseAuth.instance.sendPasswordResetEmail(
    email: emailcontroller.text.trim()
    );
     showDialog(
          // ignore: use_build_context_synchronously
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.deepPurple[100],
              content: const Text("Passwrd reset link sent.Check your mail!"),
            );
          });
   }
   on FirebaseAuthException catch (e){ 
    showDialog(
      // ignore: use_build_context_synchronously
      context: context,
     builder: (context){
      return AlertDialog(
        backgroundColor: Colors.deepPurple[200],
        content:  Text("Error: ${e.message}"),
      );
     });
   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Reset Password"),
        backgroundColor: Colors.deepPurple[300],
        elevation: 5,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Enter Your Mail-",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: TextField(
              controller: emailcontroller,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.deepPurple, width: 2),
                      borderRadius: BorderRadius.circular(12)),
                  hintText: "E-mail",
                  fillColor: Colors.grey[300],
                  filled: true),
            ),
          ),
                    const SizedBox(
            height: 15,
          ),

          MaterialButton(
            onPressed: passwordreset,
            color: Colors.deepPurple[300],
            elevation: 7,
            shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: const Text('Reset Password'),
          )
        ],
      ),
    );
  }
}
