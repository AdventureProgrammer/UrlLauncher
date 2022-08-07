import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher_homework/IntentDemo.dart';

class MySendEmailViaIntent extends StatefulWidget {
  const MySendEmailViaIntent({Key? key}) : super(key: key);

  @override
  State<MySendEmailViaIntent> createState() => _MySendEmailViaIntentState();
}

class _MySendEmailViaIntentState extends State<MySendEmailViaIntent> {
  TextEditingController _emailAddressContainer = TextEditingController();
  TextEditingController _emailSubjectContainer = TextEditingController();
  TextEditingController _emailBodyContainer = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Send E-Mail via intent',
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              TextField(
                controller: _emailAddressContainer,
                decoration: InputDecoration(
                  hintText: 'Enter E-Mail Address',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _emailSubjectContainer,
                decoration: InputDecoration(
                  hintText: 'Enter Subject',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _emailBodyContainer,
                decoration: InputDecoration(
                  hintText: 'Enter Content',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  sendEmail();
                },
                child: Text(
                  'Send E-Mail',
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyIntentDemo(),
                    ),
                  );
                },
                child: Text('Go to main Screen'),
              )
            ],
          ),
        ),
      ),
    );
  }

  sendEmail() async {
    String email = _emailAddressContainer.text.toString();
    String subject = _emailSubjectContainer.text.toString();
    String body = _emailBodyContainer.text.toString();

    String emailUrl = 'mailto:$email?subject=$subject&body=$body';

    if (await canLaunch(emailUrl)) {
      await launch(emailUrl);
    } else {
      throw 'error sending email';
    }
  }
}
