import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_registration/pages/forgotpasswordpage.dart';


class Login extends StatefulWidget {
  final VoidCallback showRegisterpage;
  const Login({super.key,required this.showRegisterpage});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final emailcontroller=TextEditingController();
  final passcontroller=TextEditingController();
  // ignore: non_constant_identifier_names
  Future SignIn()async{
    showDialog(
      context: context,
       builder: (context){
        return  const Center(child: CircularProgressIndicator());
       }
       );
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailcontroller.text.trim(),
      password: passcontroller.text.trim()
      );
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
  }
  @override
  void dispose(){
    emailcontroller.dispose();
    passcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.note_alt,size: 100,
                  color: Colors.black,
                ),
                const Text("Welcome Back",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35,
                    color: Colors.black,
                  ),),
                const SizedBox(height: 60,),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: TextField(
                    controller: emailcontroller,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.deepPurple, width: 2),
                            borderRadius: BorderRadius.circular(12)),
                        hintText: "E-mail",
                        fillColor: Colors.white,
                        filled: true),
                  ),
                ),
            
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 22),
                //   child: Container(
                //     decoration: BoxDecoration(
                //       color: Colors.grey[100],
                //       border: Border.all(color: Colors.white),
                //       borderRadius: BorderRadius.circular(12),
                //     ),
                //     child: const Padding(
                //       padding: EdgeInsets.only(left: 20,top: 5,bottom: 5),
                //       child: TextField(
                //         decoration: InputDecoration(
                //           hintText: "E-mail",
                //           border: InputBorder.none,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
            
                 const SizedBox(
                  height: 20,
                ),
            
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: TextField(
                    controller: passcontroller,
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)
                      ),
                      focusedBorder:  OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepPurple,width: 2),
                            borderRadius: BorderRadius.circular(12)
                      ),
                      hintText: "Password",
                      fillColor: Colors.white,
                        filled: true
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return const ForgotPasswordPage(); 
                          },
                        ),
                      );
                        },
                        child: const Text("Forgot Password!",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold,fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 15,),
            
                Padding(
                  padding:  const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: SignIn,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(18),
                        child: Center(
                          child: Text("Sign In",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Not a member?",style: TextStyle(fontWeight: FontWeight.bold),),
                    GestureDetector(
                      onTap:  widget.showRegisterpage,
                      child: const Text(" Register Now",style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}