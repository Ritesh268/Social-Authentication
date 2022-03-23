import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_authentication/widget/logged_in_widget.dart';
import 'package:social_authentication/widget/sign_up_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text(widget.title),
      // ),
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return const LoggedInWidget();
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("Somthing Went Wrong!"),
              );
            } else {
              return const SignUpWidget();
            }
          }), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
