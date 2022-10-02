import 'package:flutter/material.dart';
import 'package:eventlistners/widgets/widgets.dart';
import 'package:eventlistners/constants.dart';



class WrittenField extends StatelessWidget {
  String hintText;
  bool isObscure;
  String email;
  WrittenField(this.hintText, this.isObscure, this.email);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        onChanged: (value){
          email = value;
        },
        obscureText: isObscure,
        decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: Colors.grey,
                )
            )
        ),
      ),
    );
  }
}



class Button extends StatelessWidget {
  String text;
  void Function()? onTap;
  Color? color;
  Button(this.text, this.onTap, this.color);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        width: double.maxFinite,
        height: 52,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),),
        ),
      ),
    );
  }
}


class StatusBlock extends StatelessWidget {
  String text1;
  String text2;
  StatusBlock(this.text1, this.text2);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [Text(
          text1,
          style: TextStyle(
              color: Colors.brown,
              fontSize: 25,
              fontWeight: FontWeight.bold
          ),
        ),
          Text(
            text2,
            style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w800
            ),
          ),

      ]),
    );
  }
}



class ContentBlock extends StatelessWidget {
  String heading;
  String content;
  Color color;
  ContentBlock(this.heading, this.content, this.color);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 20),
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      width: double.maxFinite,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                blurRadius: 14,
                offset: Offset(3,5)

            )],
          color: color.withOpacity(0.8),
          borderRadius: BorderRadius.circular(30)
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(
            heading,
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.w800
            ),
          ),
            SizedBox(
              height: 10,
            ),
            Text(
              content,
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 14,
                  fontWeight: FontWeight.bold
              ),
            )
          ]),
    );
  }
}





class RentBlock extends StatelessWidget {
  String title;
  String charge;
  String description;
  String email;


  RentBlock(this.title, this.charge, this.description, this.email);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){},
      child: Container(
        padding: EdgeInsets.all(20),
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30) ,
          gradient: LinearGradient(colors: [Colors.amber, Colors.orangeAccent]),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 3.0), //(x,y)
              blurRadius: 8.0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(                                        //"Electric Guitar for Rent"
              title.toUpperCase(),
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w800,
                  color: Colors.grey[850]
              ),
            ),
            gap,
            Container(
              width: double.maxFinite,
              color: Colors.black.withOpacity(0.3),
              height: 1,
            ),
            gap,
            Text(
              'Charge: $charge/day'.toUpperCase(),
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            gap,
            Text(
              description,
              style: TextStyle(
                color: Colors.grey[700],
              ),
            ),
            gap,
            Text(
                "AD by: $email",
              style: TextStyle(
                color: Colors.grey[700],
                fontWeight: FontWeight.w800
              ),
            ),
            gap,
          ],
        ),
      ),
    );
  }
}


class ChatBlock extends StatelessWidget {
  String name;
  String lastMessage;
  ChatBlock(this.name, this.lastMessage);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        //elevation: 12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        )
      ),
      onPressed: (){},
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.grey[300],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage('https://t4.ftcdn.net/jpg/00/64/67/63/360_F_64676383_LdbmhiNM6Ypzb3FM4PPuFP9rHe7ri8Ju.jpg'),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.grey[850],
                      fontWeight: FontWeight.w700,
                      fontSize: 17
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    lastMessage,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
