import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_authentication/provider/google_sign_in.dart';

class LoggedInWidget extends StatefulWidget {
  const LoggedInWidget({Key? key}) : super(key: key);

  @override
  State<LoggedInWidget> createState() => _LoggedInWidgetState();
}

class _LoggedInWidgetState extends State<LoggedInWidget> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Logged In"),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.googleLogout();
            },
            child: const Text("Logout"),
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.blueAccent[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Profile",
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(
              height: 32,
            ),
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(user.photoURL!),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Name: " + user.displayName!,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Email: " + user.email!,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
