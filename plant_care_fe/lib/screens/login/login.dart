import 'package:flutter/material.dart';

import '../../constants.dart';
import '../login/components/custombutton.dart';
import '../login/components/loginapi.dart';
import '../home/home_screen.dart';
import '../signup/signup.dart';
import '../signup/components/success.dart';

class Login extends StatefulWidget {
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  var email;
  var pass;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            child: Image.asset('assets/images/plant.png'),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      kDefaultPadding,
                      kDefaultPadding * 0.5,
                      kDefaultPadding,
                      kDefaultPadding * 0.5),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(fontSize: 20),
                          ),
                          controller: emailController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Email can not be empty';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: kDefaultPadding),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(fontSize: 20),
                            labelText: 'Password',
                          ),
                          controller: passController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Password can not be empty';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: kDefaultPadding),
                        CustomButton(press: () async {
                          if (formKey.currentState.validate()) {
                            email = emailController.text;
                            pass = passController.text;
                          }
                          var res = await login(email, pass);
                          if (res == 200) {
                            showDialog(
                                context: context,
                                builder: (context) => CustomDialog(
                                  title: 'Congratulations',
                                    msg: 'Login success!',
                                    press: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomeScreen()));
                                    }));
                          }
                          else {
                            showDialog(
                              context: context,
                              builder: (context) => CustomDialog(
                                title: 'Login fail',
                                msg: 'Please try again',
                                press: () {
                                  Navigator.pop(context);
                                }
                              ),
                            );
                          }
                        }),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('New user?'),
                            FlatButton(
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 18,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUp()));
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
