import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventlistners/constants.dart';
import 'package:eventlistners/screens/login_screen.dart';
import 'package:eventlistners/screens/registration_screen.dart';
import 'package:eventlistners/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:eventlistners/screens/profile_screen.dart';
import 'package:eventlistners/screens/home_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

late String name = "";
late String about = "";
FirebaseAuth _auth = FirebaseAuth.instance;
late User loggedInUser;

class ControlScreen extends StatefulWidget {


  @override
  State<ControlScreen> createState() => _ControlScreenState();
}

class _ControlScreenState extends State<ControlScreen> {

  @override
  void initState() {
    super.initState();
    setState((){
      //getCurrentUser();
      _getDataFromDatabase();
    });
  }


  void getCurrentUser() async {
    final user = await _auth.currentUser;
    try {
      if (user != null) {
        loggedInUser = user;
      }
    }
    catch(e){
      print(e);
    }
  }


  Future _getDataFromDatabase() async {
    await FirebaseFirestore.instance.collection('UserData').doc(_auth.currentUser?.uid)
        .get()
        .then((snapshot) async
    {
      if(snapshot.exists){
        setState((){
          name = snapshot.data()!['username'];
          about = snapshot.data()!['About'];
        });
      }
    }
    );
  }




  int screenIndex = 2;
  List<Widget> screenForNavigation =
  [
    HomeScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
        selectedIndex: 2,
        // tab button ripple color when pressed
          color: Colors.grey[800], // unselected icon color
          activeColor: Colors.grey[900],
          //tabBackgroundColor: Colors.grey.withOpacity(0.4),
          curve: Curves.easeOutExpo,
          backgroundColor: Color(0xFFBDBDBDBD),
          tabs: [
            GButton(
              onPressed: (){
                setState((){
                  screenIndex = 0;
                });
              },
              icon: Icons.home,
              text: 'Home',

            ),
            GButton(
              onPressed: (){
                setState((){
                  screenIndex = 1;
                });
              },
              icon: Icons.chat,
              text: ' Chat',
            ),
            GButton(
              onPressed: (){
                setState((){
                  screenIndex = 2;
                });
              },
              icon: Icons.person,
              text: 'Profile',
            )
          ]
      ),
      body: screenForNavigation[screenIndex],

    );
  }
}
