import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../authentication_service.dart';


class CreateAccountWithGoogle extends StatefulWidget {
  @override
  _CreateAccountWithGoogleState createState() => _CreateAccountWithGoogleState();
}

class _CreateAccountWithGoogleState extends State<CreateAccountWithGoogle> {

  //GoogleSignIn _googleSignIn = GoogleSignIn();
  FirebaseAuth _auth;

  bool isUserSignedIn = false;

  @override
  void initState() {
    super.initState();
    initApp();
  }

  void initApp() async {
    FirebaseApp defaultApp = await Firebase.initializeApp();
    _auth = FirebaseAuth.instanceFor(app: defaultApp);
    checkIfUserIsSignedIn();
  }

  void checkIfUserIsSignedIn() async {
    // print('start');
    // _googleSignIn.signOut();
    // var userSignedIn = await _googleSignIn.isSignedIn();
    //
    // setState(() {
    //  isUserSignedIn = userSignedIn;
    // });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(50),
            child: Align(
                alignment: Alignment.center,
                child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: () {
                      onGoogleSignIn(context);
                    },
                    color: isUserSignedIn ? Colors.green : Colors.blueAccent,
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.account_circle, color: Colors.white),
                            SizedBox(width: 10),
                            Text(
                                isUserSignedIn ? 'You\'re logged in with GOOGLE' : 'Login with GOOGLE',
                                style: TextStyle(color: Colors.white))
                          ],
                        )
                    )
                )
            )
        )
    );
  }

  void onGoogleSignIn(BuildContext context) async {
    // print('click');
    // final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    // final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    // final GoogleAuthCredential credential = GoogleAuthProvider.credential(
    //   accessToken: googleAuth.accessToken,
    //   idToken: googleAuth.idToken,
    // );
    //
    // bool signin = await context.read<AuthenticationService>().signInWithCredential(
    //     credential
    // );
    // if(signin){
    //   Navigator.pop(context);
    // }
  }
}

