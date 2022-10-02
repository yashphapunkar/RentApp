import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:eventlistners/widgets/widgets.dart';
import 'package:eventlistners/constants.dart';
import 'package:get/get.dart';

class UserInfoPage extends StatefulWidget {


  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  bool showSpinner = false;
  TextEditingController about = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kthemeColor,
      body: Padding(
        padding: EdgeInsets.only(top: 50, left: 20,right: 20,bottom: 20),
        child:ListView(
            scrollDirection: Axis.vertical,
            //padding: EdgeInsets.all(20),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Edit Profile',
                    style: TextStyle(
                        color: Colors.grey[850],
                        fontWeight: FontWeight.w800,
                        fontSize: 40
                    ),
                  ),
                  gapMore,
                  Text(
                      'About',
                      style: kSubHeadingStyle
                  ),
                  gap,
                  TextField(
                    controller: about,
                    decoration: InputDecoration(
                      hintText: 'Enter information',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: kthemeColor,
                          )
                      ),
                    ),
                    minLines: 3,
                    maxLines: 100,
                  ),
                  gap,
                  Button(
                      'Add To Profile',
                          () async {
                        setState(() {
                          showSpinner = true;
                        });
                        try{
                          await  FirebaseFirestore.instance.collection("UserData").doc(FirebaseAuth.instance.currentUser?.uid).update({
                            "About": about.text
                          }).then((_){
                            print("collection created");
                          }).catchError((_){
                            print("an error occured");
                          });
                          Navigator.pop(context);
                          Get.snackbar(
                            'Successfully updated information',
                            'Thankyou for using our services hope you like it!',
                            colorText: Colors.grey[900],
                          );
                        }
                        catch(e){
                          print(e);
                        }
                      },
                      Colors.grey[700]
                  ),
                  gap,
                  Button('Back', () {Navigator.pop(context);}, Colors.grey[850])
                ],
              ),
            ]),
      ),
    );
  }
}
