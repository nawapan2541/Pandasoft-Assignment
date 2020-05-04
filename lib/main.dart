import 'package:flutter/material.dart';
import 'package:myapp/Profile.dart';
import 'package:myapp/login.dart';

void main() {
  runApp(
    MaterialApp(
    
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home:LoginPage(),
      routes: {
        "/login": (_) => LoginPage(),
        "/profile": (_) => ProfilePage(),
      },
    ),
  );

  
}
