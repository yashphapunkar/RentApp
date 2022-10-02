import 'package:eventlistners/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(EventListner());
}


class EventListner extends StatefulWidget {


  @override
  State<EventListner> createState() => _EventListnerState();
}

class _EventListnerState extends State<EventListner> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
