import 'package:flutter/material.dart';
import 'package:url_launcher_homework/CallViaIntent.dart';
import 'package:url_launcher_homework/IntentDemo.dart';
import 'package:url_launcher_homework/OpenUrlViaIntent.dart';
import 'package:url_launcher_homework/SendEmailViaIntent.dart';
import 'package:url_launcher_homework/SmsViaIntent.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyIntentDemo());
  }
}
