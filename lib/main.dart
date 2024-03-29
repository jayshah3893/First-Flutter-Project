import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_crypto/home_page.dart';

void main() async {
  List currencies = await getCurrencies();
  print(currencies);
  runApp(new MyApp(currencies));
} 

class MyApp extends StatelessWidget {
  final List _currencies;
  MyApp(this._currencies);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.pink
      ),
      home: new HomePage(_currencies),
    );
  }
}

 Future<List> getCurrencies() async{
        String url = "https://api.coinmarketcap.com/v1/ticker/?limit=50";
        http.Response response = await http.get(url);
        return JSON.decode(response.body);
      }