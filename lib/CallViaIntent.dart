import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher_homework/IntentDemo.dart';

class MyCallIntent extends StatefulWidget {
  const MyCallIntent({Key? key}) : super(key: key);

  @override
  State<MyCallIntent> createState() => _MyCallIntentState();
}

class _MyCallIntentState extends State<MyCallIntent> {
  TextEditingController _callController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Call Via Intent'),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _callController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.blue.shade900,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.purple,
                    ),
                  ),
                  hintText: 'please enter mobile number',
                  labelText: 'mobile number',
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  var mobnumber = _callController.text.toString();
                  launch("tel://$mobnumber");
                },
                child: Text('Make Call'),
              ),
            ),
            SizedBox(
              height: 48,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyIntentDemo(),
                    ),
                  );
                },
                child: Text('Go to main Screen'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
