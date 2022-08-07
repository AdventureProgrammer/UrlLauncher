import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher_homework/IntentDemo.dart';

class MyOpenUrlViaIntent extends StatefulWidget {
  const MyOpenUrlViaIntent({Key? key}) : super(key: key);

  @override
  State<MyOpenUrlViaIntent> createState() => _MyOpenUrlState();
}

class _MyOpenUrlState extends State<MyOpenUrlViaIntent> {
  TextEditingController _urlController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Open Url'),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: _urlController,
                decoration: InputDecoration(
                  hintText: 'Enter Website Address',
                  labelText: 'Website Address',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.lightBlueAccent.shade700,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.purple, width: 2),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                var myUrl = _urlController.text;
                if (await canLaunch('https://$myUrl')) {
                  await launch('https://$myUrl');
                } else {
                  throw 'error occured';
                }
              },
              child: Text('Open Url'),
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
