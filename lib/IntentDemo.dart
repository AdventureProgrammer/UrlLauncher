import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher_homework/CallViaIntent.dart';
import 'package:url_launcher_homework/OpenUrlViaIntent.dart';
import 'package:url_launcher_homework/SendEmailViaIntent.dart';
import 'package:url_launcher_homework/SmsViaIntent.dart';

class MyIntentDemo extends StatefulWidget {
  const MyIntentDemo({Key? key}) : super(key: key);

  @override
  State<MyIntentDemo> createState() => _MyIntentDemoState();
}

class _MyIntentDemoState extends State<MyIntentDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Intent Demo'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 48,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyCallIntent(),
                      ),
                    );
                  },
                  child: Text('Call Via Intent'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MySmsViaIntent(),
                      ),
                    );
                  },
                  child: Text('Sms Via Intent'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyOpenUrlViaIntent(),
                      ),
                    );
                  },
                  child: Text('Open Website Via Intent'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MySendEmailViaIntent(),
                      ),
                    );
                  },
                  child: Text('Send E-Mail via Intent'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
