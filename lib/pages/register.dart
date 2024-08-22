import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;

  const RegisterPage({super.key, required this.showLoginPage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();
  final confirmpasscontroller = TextEditingController();
  final firstnamecontroller=TextEditingController();
  final lastnamecontroller=TextEditingController();
  final agecontroller=TextEditingController();

  @override
  void dispose() {
    emailcontroller.dispose();
    passcontroller.dispose();
    confirmpasscontroller.dispose();
    firstnamecontroller.dispose();
    lastnamecontroller.dispose();
    agecontroller.dispose();
    super.dispose();
  }

  Future signUp() async {
    if (passwordConfirm()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailcontroller.text.trim(),
          password: passcontroller.text.trim()
          );
          addUserDetails(
            firstnamecontroller.text.trim(),
           lastnamecontroller.text.trim(),
            emailcontroller.text.trim(), 
           int.parse(agecontroller.text.trim()),
          );
    }
  }

  Future addUserDetails(String firstName,String lastName,String email,int age)async{
    await FirebaseFirestore.instance.collection('users').add({
      'first name': firstName,
      'last name': lastName,
      'email': email,
      'age': age,
    });
  }

  bool passwordConfirm() {
    if (passcontroller.text.trim() == confirmpasscontroller.text.trim()) {
      return true;
    } 
    else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.note_alt_outlined,
                  size: 100,
                  color: Colors.black,
                ),
                const Text(
                  "Hello There",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Register below with your details!",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Color.fromARGB(255, 69, 53, 97),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: TextField(
                    controller: firstnamecontroller,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.deepPurple, width: 2),
                            borderRadius: BorderRadius.circular(12)),
                        hintText: "First-Name",
                        fillColor: Colors.white,
                        filled: true),
                  ),
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: TextField(
                    controller: lastnamecontroller,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.deepPurple, width: 2),
                            borderRadius: BorderRadius.circular(12)),
                        hintText: "Last-Name",
                        fillColor: Colors.white,
                        filled: true),
                  ),
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: TextField(
                    controller: agecontroller,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.deepPurple, width: 2),
                            borderRadius: BorderRadius.circular(12)),
                        hintText: "Age",
                        fillColor: Colors.white,
                        filled: true),
                  ),
                ),
                const SizedBox(height: 20,),
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
                            borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.deepPurple, width: 2),
                            borderRadius: BorderRadius.circular(12)),
                        hintText: "Password",
                        fillColor: Colors.white,
                        filled: true),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: TextField(
                    controller: confirmpasscontroller,
                    obscureText: true,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.deepPurple, width: 2),
                            borderRadius: BorderRadius.circular(12)),
                        hintText: "Confirm-Password",
                        fillColor: Colors.white,
                        filled: true),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: signUp,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(12)),
                      child: const Padding(
                        padding: EdgeInsets.all(18),
                        child: Center(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already a member?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                        onTap: widget.showLoginPage,
                        child: const Text(
                          " Log In",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold,fontSize: 17),
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
