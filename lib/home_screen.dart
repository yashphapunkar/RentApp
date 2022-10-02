import 'package:eventlistners/constants.dart';
import 'package:flutter/material.dart';
import 'package:eventlistners/screens/login_screen.dart';
import 'package:eventlistners/widgets/widgets.dart';
import 'package:eventlistners/screens/registration_screen.dart';


class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kthemeColor,//Color(0xFF5698A5),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Hero(
                tag: RegistrationScreen(),
                child: Image(
                  width: 250,
                    image: AssetImage('images/guitar.gif'),
                ),
              ),
              Text(
                "RentForMe",
              style: TextStyle(
                shadows: [
                Shadow(color: Colors.black, offset: Offset(0,3), blurRadius: 20)
                ],
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.grey[850],
                decorationColor: Colors.black,
                fontFamily: 'EduNSWACTFoundation'
              ),
            ),
              SizedBox(
                height: 14,
              ),

            TextButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                width: double.maxFinite,
                height: 52,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[850],
                ),
                child: Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),),
                ),
              ),
            ),
              Button('Register', () { Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationScreen()));}, Colors.grey[900]),
              SizedBox(
               height: 20,
              ),
              Text(
                'Find A Perfect Product For Yourself ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      blurRadius: 10,
                      offset: Offset(0, 0),
                    )
                  ],
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
              )
          ]),
        ),
      ),
    );
  }
}





