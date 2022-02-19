import 'package:flutter/material.dart';
import 'package:chucknorris_app/pages/home.dart';
import 'package:chucknorris_app/pages/random_joke.dart';
import 'package:chucknorris_app/pages/categories.dart';
import 'package:chucknorris_app/pages/search.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(primaryColor: Colors.deepOrangeAccent),
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/random_joke': (context) => const RandomJoke(),
        '/categories': (context) => const Categories(),
        '/search': (context) => const Search(),
      },
    ));
