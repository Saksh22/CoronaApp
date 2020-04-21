




import 'package:coronaapp/pages/choose_country.dart';
import 'package:coronaapp/pages/home.dart';
import 'package:coronaapp/pages/loading.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
      '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation(),
  },
));
