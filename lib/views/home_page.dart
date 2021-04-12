
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_login/authentication_service.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("HOMEs"),
            firebaseUser == null ?
            Container() :
            Container(
                color: Colors.red,
                child: Text(
                    '${firebaseUser.email}\n'
                        '${firebaseUser.phoneNumber}\n'
                        '${firebaseUser.photoURL}\n'
                        '${firebaseUser.phoneNumber}\n'
                        '${firebaseUser.phoneNumber}\n')
            ),
            RaisedButton(
              onPressed: () {
                context.read<AuthenticationService>().signOut();
              },
              child: Text("Sign out"),
            ),
          ],
        ),
      ),
    );
  }
}