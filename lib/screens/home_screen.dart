import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventlistners/constants.dart';
import 'package:eventlistners/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eventlistners/addingpage/addingpage.dart';
final _firestore = FirebaseFirestore.instance;
late User loggedInUser;

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  late User? currentUser = _auth.currentUser;



  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    final user = _auth.currentUser;
    try {
      if (user != null) {
        loggedInUser = user;
      }
    }
    catch(e){
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kthemeColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder:(context) => AddingPage()));
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.grey[850],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 30, left: 16,right: 16, bottom: 20),
                color: Colors.transparent,
                child: Row(
                  children: [
                    Icon(Icons.search,
                      color: Colors.black,
                      shadows: [Shadow(
                        blurRadius: 5,
                        color: Colors.grey,
                        offset: Offset(0,3),
                      )],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        onChanged: (value){},
                        decoration: InputDecoration(
                            hintText: 'Search Your Item Here',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                )
                            )
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: _firestore.collection('RentData').orderBy('time', descending: false).snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(backgroundColor: Colors.grey,),
                      );
                    }

                    final rentData = snapshot.data?.docs;
                    List<RentBlock> rentBlockWidgets = [];
                    for (var message in rentData!) {
                      var data = message.data() as Map;
                      final titleText = data['ProductTitle'];
                      final charge = data['Charge'];
                      final description = data['Description'];
                      final uploader = data['UploaderEmail'];
                      final dataWidget = RentBlock(
                        titleText,
                        charge,
                        description,
                        uploader,//currentUser == messageSender,
                      );
                      rentBlockWidgets.add(dataWidget);
                    }
                    return Expanded(
                        child: ListView(
                        reverse: false,
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        children: rentBlockWidgets,
                      ),
                    );
                  }
              ),
            ],
          )
        ),
      );
  }
}
