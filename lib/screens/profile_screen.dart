import 'package:eventlistners/addingpage/userinfopage.dart';
import 'package:eventlistners/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:eventlistners/widgets/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventlistners/home_screen.dart';


late User loggedInUser;

final _firestore = FirebaseFirestore.instance;
class ProfileScreen extends StatefulWidget {

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  late String profileName = "";
  late String profileAbout = "";
  @override
  void initState() {
    getCurrentUser();
    _getDataFromDatabase();
    setState((){});
    super.initState();
  }
  int followers = 0;
  int posts = 0;
  bool Pressed = false;
  int screenIndex = 0;
  String name = "";
  String about = "";

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

  Future _getDataFromDatabase() async {
    await FirebaseFirestore.instance.collection('UserData').doc(loggedInUser.uid)
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kthemeColor,
        body: Stack(
          // fit: StackFit.expand,
          // clipBehavior: Clip.antiAliasWithSaveLayer,
          alignment: AlignmentDirectional.topCenter,
          children:  <Widget> [
            Container(
              color: Colors.amber,
            ),
            ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 16, top: 16),
                  //height: 200,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: (){},
                              icon: Icon(
                                  Icons.menu,
                                size: 30,
                              ),
                             color: Colors.white,),
                            SizedBox(
                              width: 260,
                            ),
                            IconButton(onPressed: (){
                             // _auth.signOut();
                              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                            }, icon: Icon(Icons.logout, color: Colors.white,), )
                          ]),
                      ),
                          Center(
                          child: CircleAvatar(
                          maxRadius: 90,
                          minRadius: 85,
                          backgroundColor: kthemeColor,
                          child: CircleAvatar(
                          maxRadius: 85,
                          minRadius: 70,
                          backgroundImage: NetworkImage('https://t4.ftcdn.net/jpg/00/64/67/63/360_F_64676383_LdbmhiNM6Ypzb3FM4PPuFP9rHe7ri8Ju.jpg')
                          ),
                        ),
                    ),
                      gap,
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 14,
                              offset: Offset(3,5)

                          )],
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          name,
                          style: kHeadingStyle,
                        ),
                      ),
                  ]),
                ),

                Container(
                  padding: EdgeInsets.only(bottom: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: kthemeColor,
                  ),
                  margin: EdgeInsets.only(right: 8, left: 8, bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                      margin: EdgeInsets.only(top: 20, left: 10, right: 10),
                      width: double.maxFinite,
                      height: 70,
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top:10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:<Widget>[
                            StatusBlock('$posts', 'Posts'),
                            StatusBlock('$followers', 'Rented'),
                            //StatusBlock('1000', '')
                          ],
                        ),
                      ),
                    ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    width: double.maxFinite,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Pressed ? Colors.blueGrey : Colors.grey[700],
                      border: Border.all(color: Colors.grey, width: 2)
                    ),
                    child: TextButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => UserInfoPage()));
                      },
                      child: Text(
                          Pressed ? 'Disconnet':'Edit Profile',
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Text(
                      'About',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.w800
                      ),
                    ),
                  ),
                  gap,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                     about,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontWeight: FontWeight.bold,
                        fontSize: 17
                      ),
                    ),
                  ),
                  gap,
                  //ContentBlock('Skills',
                  //  '1. Data Structures and Algorithms using c++ (Hacker Rank 5 star)\n\n2.Flutter Development, developed basic application for android using flutter SDK\n\n3.FireBase connectivity of android application\n\n4.Using android Studio',
                  //  Colors.amber,
                  //),
                  //gap,
                  //ContentBlock('Additional Skills', '1.Video Editting using adobe premere pro\n\n2.DAW, working knowledge of DAW (digital audio workstation)\n\n3.Audio editting using adobe Audition\n\n4.Indian Classical Vocalist', Colors.tealAccent),
                  //gap,
                  //ContentBlock('Education', "Bachelor's in Electronics And Instrumentation Engineering\nFrom IET DAVV, Indores\nYear of Passing: 2023", Colors.pinkAccent)
              ],
            ),
                ),
              ]),


          ]
        )
      );
  }
}
