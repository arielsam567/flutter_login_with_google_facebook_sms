import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../authentication_service.dart';

class CreateAccountWithEmailPage extends StatefulWidget {
  @override
  _CreateAccountWithEmailPageState createState() => _CreateAccountWithEmailPageState();
}

class _CreateAccountWithEmailPageState extends State<CreateAccountWithEmailPage> {
  final TextEditingController emailControllerCreate = TextEditingController();
  final TextEditingController passwordControllerCreate = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.amber,
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Text("Criar uma conta",
                  ),
                  TextField(
                    controller: emailControllerCreate,
                    decoration: InputDecoration(
                      labelText: "Email",
                    ),
                  ),
                  TextField(
                    controller: passwordControllerCreate,
                    decoration: InputDecoration(
                      labelText: "Password",
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      createAccount();
                    },
                    child: Text("Create acconut"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> createAccount() async {
    try {
      // ignore: deprecated_member_use
      FirebaseUser user = (await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailControllerCreate.text,
        password: passwordControllerCreate.text,)).user;
      if(user != null){
        print('sucesso');
        context.read<AuthenticationService>().signIn(
          email: emailControllerCreate.text.trim(),
          password: emailControllerCreate.text.trim(),
        );
      }

    } catch (e) {
      print(e);
      print('\n\n\nerroooo');
      emailControllerCreate.text = "";
      passwordControllerCreate.text = "";
      // TODO: alertdialog with error
    }
  }

}
