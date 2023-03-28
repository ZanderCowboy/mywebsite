import 'package:flutter/material.dart';

// Define routes
import 'package:mywebsite/views/firstpage.dart';
import 'package:mywebsite/views/homepage.dart';

// Route Names
const String homePage = 'home';
const String firstPage = 'first';
// const String secondPage = 'second';

// Control our page route flow
Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case homePage:
      return MaterialPageRoute(
          builder: (context) => MyHomePage());
    case firstPage:
      return MaterialPageRoute(builder: (context) => FirstPage());
    // case secondPage:
    //   return MaterialPageRoute(builder: (context) => SecondPage());
    default:
      throw ('This route name does not exit');
  }
}
