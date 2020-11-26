import 'package:flutter/material.dart';
import 'ui/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  Map<int, Color> color =
  {
    50:Color.fromRGBO(136,14,79, .1),
    100:Color.fromRGBO(136,14,79, .2),
    200:Color.fromRGBO(136,14,79, .3),
    300:Color.fromRGBO(136,14,79, .4),
    400:Color.fromRGBO(136,14,79, .5),
    500:Color.fromRGBO(136,14,79, .6),
    600:Color.fromRGBO(136,14,79, .7),
    700:Color.fromRGBO(136,14,79, .8),
    800:Color.fromRGBO(136,14,79, .9),
    900:Color.fromRGBO(136,14,79, 1),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nabíjím zdarma',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFF229f27, color),
      ),
      home: MyHomePage(),
    );
  }
}
