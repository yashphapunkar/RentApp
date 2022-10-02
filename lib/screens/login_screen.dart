import 'package:eventlistners/constants.dart';
import 'package:eventlistners/screens/control_screen.dart';
import 'package:flutter/material.dart';
import 'package:eventlistners/main.dart';
import 'package:eventlistners/widgets/widgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:eventlistners/screens/profile_screen.dart';
import 'package:get/get.dart';
class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
   return ModalProgressHUD(
     inAsyncCall: showSpinner,
     child: Scaffold(
       backgroundColor: kthemeColor,
       body: ListView(
         children: <Widget>[
           Container(
              padding: EdgeInsets.only(top: 16, bottom: 8),
               width: double.maxFinite,
               height: 400,
               child: Image(image: AssetImage('images/guitar.gif'))),

           Padding(
             padding: EdgeInsets.symmetric(horizontal: 16),
             child: TextField(
               controller: emailController,
               onChanged: (value){
                // email = value;
               },
               decoration: InputDecoration(
                   hintText: 'Enter Your Email Address',
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
               obscureText: true,
               controller: passwordController,
               onChanged: (value){
                 //email = value;
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
           Button('Login', () async {
             setState((){
               showSpinner = true;
             });
             try {
               final user = await _auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
               if(user != null) {
                 Navigator.push(context,
                     MaterialPageRoute(builder: (context) => ControlScreen()));
                     setState((){
                       showSpinner = false;
                     });
                  }
              }

               catch(e){
                print(e);
               }
             },


               Colors.grey[850]),
         ],

       ),

     ),
   );
  }
}





//
