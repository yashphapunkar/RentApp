import 'package:eventlistners/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eventlistners/widgets/widgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddingPage extends StatefulWidget {

  @override
  State<AddingPage> createState() => _AddingPageState();
}

class _AddingPageState extends State<AddingPage> {
  bool showSpinner  = false;

  FirebaseAuth _auth = FirebaseAuth.instance;
  late User? curentUser = _auth.currentUser;
  TextEditingController heading = TextEditingController();
  TextEditingController charge = TextEditingController();
  TextEditingController description = TextEditingController();


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
            Text(
                'Add Your Product',
              style: TextStyle(
                color: Colors.grey[850],
                fontWeight: FontWeight.w800,
                fontSize: 40
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   gapMore,
                    Text(
                        'Heading',
                      style: kSubHeadingStyle
                    ),
                    gap,
                    TextField(
                      controller: heading,
                      decoration: InputDecoration(
                          hintText: 'Enter Heading for listing your product',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: kthemeColor,
                            )
                        ),
                      ),
                    ),
                    gapMore,
                  Text(
                      'Charge',
                    style: kSubHeadingStyle,
                  ),
                    gap,
                    TextField(
                      controller: charge,
                      decoration: InputDecoration(
                        hintText: 'Enter the charge you want to apply for per day',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: kthemeColor,
                            )
                        ),
                      ),
                    ),
                  gapMore,
                  Text(
                    'Description',
                    style: kSubHeadingStyle,
                  ),
                  gap,
                  TextField(
                    controller: description,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: 'Enter description of product',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: kthemeColor,
                            )
                        )
                    ),
                    minLines: 3,
                    maxLines: 100,
                  ),
                  gap,
                  Button(
                    'Add Product',
                          () {
                        setState((){
                          showSpinner = true;
                        });
                        try{

                          FirebaseFirestore.instance.collection("RentData").add({
                          "UploaderEmail": _auth.currentUser?.email,
                          "ProductTitle": heading.text,
                          "Charge": charge.text,
                          "Description": description.text,
                          "time" : FieldValue.serverTimestamp()
                          }).then((_){
                             print("collection created");
                          }).catchError((_){
                             print("an error occured");
                          });
                          Get.snackbar(
                            'Your Product is Succesfully Added',
                            'Thankyou for using our services hope you like it!',
                            barBlur: 4,
                            colorText: Colors.grey[900],
                          );
                          Navigator.pop(context);

                        }
                        catch(e){
                          print(e);
                        }
                      },
                    Colors.grey[700]
                  ),
                  gap,
                  Button('Back', () {  Navigator.pop(context);}, Colors.grey[850])
                  ],
                ),
              ]),
      ),
        );
  }
}
