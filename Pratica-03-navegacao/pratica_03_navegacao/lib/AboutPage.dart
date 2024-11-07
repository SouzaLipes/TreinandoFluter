import 'package:flutter/material.dart';

class MyAboutPagState extends StatefulWidget {
  const MyAboutPagState({super.key});

  @override
  State<MyAboutPagState> createState() => _MyAboutPage();
}


class _MyAboutPage extends State<MyAboutPagState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'About Us',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'This is an example of an About page built using Flutter. '
              'Here you can describe your app, its features, and the team behind it.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}