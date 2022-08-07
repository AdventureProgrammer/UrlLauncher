import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher_homework/IntentDemo.dart';

class MySmsViaIntent extends StatefulWidget {
  const MySmsViaIntent({Key? key}) : super(key: key);

  @override
  State<MySmsViaIntent> createState() => _MySmsViaIntentState();
}

class _MySmsViaIntentState extends State<MySmsViaIntent> {
  TextEditingController _smsmob = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sms via intent'),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: _smsmob,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.blue.shade900,
                    ),
                  ),
                  hintText: 'Enter Mobile Number',
                  labelText: 'Mobile Number',
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () async {
                var strNumber = _smsmob.text;
                var smsUrl = 'sms:$strNumber';
                if (await canLaunch(smsUrl)) {
                  launch(smsUrl);
                } else {
                  throw 'error occured';
                }
              },
              child: Text('Send Sms'),
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
