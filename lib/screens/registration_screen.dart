import 'package:eventlistners/home_screen.dart';
import 'package:eventlistners/screens/control_screen.dart';
import 'package:eventlistners/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:eventlistners/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';




class RegistrationScreen extends StatefulWidget {
  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late String email;
  late String password;
  late String number = '';
  late String name = '';
  late String about = '';

  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        backgroundColor: kthemeColor,
        body: ListView(
          children: <Widget>[
            Hero(
              tag: HomeScreen(),
              child: Container(
                  padding: EdgeInsets.only(top: 16, bottom: 8),
                  width: double.maxFinite,
                  height: 300,
                  child: Image(image: AssetImage('images/guitar.gif'))),
            ),
            Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    controller: nameController,
                  onChanged: (value){
                  name = value;
                 },
                  decoration: InputDecoration(
                  hintText: 'Enter Your Name',
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                  color: Colors.grey,
                  )
               )
             ),
           ),
         ),
            gap,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: phoneController,
                onChanged: (value){
                  number = value;
                },
                decoration: InputDecoration(
                    hintText: 'Enter Your Number',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        )
                    )
                ),
              ),
            ),
            gap,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: emailController,
                onChanged: (value){
                  email = value;
                },
                decoration: InputDecoration(
                    hintText: 'Enter Your email address',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        )
                    )
                ),
              ),
            ),
            gap,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 26),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                onChanged: (value){
                  password = value;
                },
                decoration: InputDecoration(
                    hintText: 'Enter Your Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        )
                    )
                ),
              ),
            ),
            gap,
            Button('Register',
              /*Funtion*/() async {
                setState((){
                    showSpinner = true;
                  });
              try{
                User? currentUser = FirebaseAuth.instance.currentUser;
                final user = await _auth.createUserWithEmailAndPassword(email: emailController.text,
                    password: passwordController.text)
                    .then((value){
                      FirebaseFirestore.instance.collection('UserData').doc(value.user?.uid).set({
                        'username': nameController.text,
                        'email': emailController.text,
                        'phoneNumber': phoneController.text,
                        'About': "",
                      });
                });

                if(user != null){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ControlScreen()));
                  setState((){
                    showSpinner = false;
                  });
                }

              }
              catch(e){
                print(e);
              }
            },
                Colors.grey[900])

          ],
        )


      ),
    );
  }
}

