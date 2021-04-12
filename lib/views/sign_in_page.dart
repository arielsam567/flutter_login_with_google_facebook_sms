
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_login/authentication_service.dart';
import 'package:test_login/views/create_account_with_email.dart';
import 'package:test_login/views/create_account_with_facebook.dart';
import 'package:test_login/views/create_account_with_google.dart';


import 'login_with_phone_number.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(color:Colors.pink,
              child: Column(children: [
                SizedBox(height: 20,),
                Text("Acessar conta",
                  textAlign: TextAlign.center,),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                  ),
                ),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: "Password",
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    //login(context);
                    context.read<AuthenticationService>().signIn(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                    );
                  },
                  child: Text("Sign in"),
                ),
              ],),),

            SizedBox(height: 20),
            Container(
              color: Colors.blue,
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Text("Criar uma conta com Email",
                  ),
                  RaisedButton(
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CreateAccountWithEmailPage()),
                      );
                    },
                    child: Text("Criar conta com email"),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
            Container(
              color: Colors.red,
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Text("Criar uma conta com o celular",
                  ),
                  RaisedButton(
                    onPressed: () async {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginWithPhone()),
                      );
                    },
                    child: Text("Criar conta com numero "),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
            Container(
              color: Colors.red,
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Text("Criar uma conta com o google",
                  ),
                  RaisedButton(
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CreateAccountWithGoogle()),
                      );
                    },
                    child: Text("Criar conta com google "),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
            Container(
              color: Colors.lightBlueAccent,
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Text("Criar uma conta com o facebook",
                  ),
                  RaisedButton(
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CreateAccountWithFacebook()),
                      );
                    },
                    child: Text("Criar conta com facebook "),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

