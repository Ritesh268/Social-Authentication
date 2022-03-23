import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:social_authentication/provider/google_sign_in.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Flutter Social Authentication"),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            // const Spacer(),
            const FlutterLogo(
              size: 120,
            ),
            Container(
              margin: const EdgeInsets.only(top: 35),
              child: const Text(
                'Hey There,\nWelcone Back \nLogin to your account to continue',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 35),
              child: ElevatedButton.icon(
                  onPressed: () {
                    final provider = Provider.of<GoogleSignInProvider>(context,
                        listen: false);
                    provider.googleLogin();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    // minimumSize: const Size(double.infinity, 50),
                  ),
                  icon:
                      const FaIcon(FontAwesomeIcons.google, color: Colors.red),
                  label: const Text("Sign Up with Google")),
            ),
            const SizedBox(
              height: 45,
            ),
            const Text("Alredy have an account?Login",
                style: TextStyle(color: Colors.white))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
