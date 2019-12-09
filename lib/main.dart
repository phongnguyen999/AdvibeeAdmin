import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:advicebee_page/home.dart';

void main() {
  fb.initializeApp(
    
    //Testing firebase
      apiKey: "AIzaSyCXVM8316-XnBntjKuTLFTKaERStsE9YME",
      authDomain: "nguyen9.firebaseapp.com",
      databaseURL: "https://nguyen9.firebaseio.com",
      projectId: "nguyen9",
      storageBucket: "nguyen9.appspot.com",
      messagingSenderId: "36618522815",
      

    //Production Firebase 
    /* 
    apiKey: "AIzaSyDsxJ7SEmI3ShUTEKfYM90C7H4WPcX7WfQ",
    authDomain: "advicebee-9f277.firebaseapp.com",
    databaseURL: "https://advicebee-9f277.firebaseio.com",
    projectId: "advicebee-9f277",
    storageBucket: "advicebee-9f277.appspot.com",
    messagingSenderId: "853359482568",
    */
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "ProximaNova"),
      home: HomePage(),
    );
  }
}
