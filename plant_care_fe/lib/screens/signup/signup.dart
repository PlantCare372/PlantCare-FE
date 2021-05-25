import 'package:flutter/material.dart';

import 'package:plant_app/constants.dart';
import '../login/components/custombutton.dart';
import '../signup/components/signupapi.dart';
import '../signup/components/success.dart';
import '../login/login.dart';

class SignUp extends StatefulWidget {
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  var email;
  var res;
  var pass;
  var fullname;
  final nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Theme.of(context).primaryColor,
          ),
          title: Text('REGISTER',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                letterSpacing: 1.2,
                color: kPrimaryColor,
              ))),
      body: Container(
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
                    TextFormField(
                      decoration: InputDecoration(
                        labelStyle: TextStyle(fontSize: 20),
                        labelText: 'Full name',
                      ),
                      controller: nameController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Name can not be empty';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    CustomButton(press: () async {
                      if (formKey.currentState.validate()) {
                        email = emailController.text;
                        pass = passController.text;
                        fullname = nameController.text;
                      }
                      res = await signup(email, pass, fullname);
                      if (res == 200) {
                        showDialog(
                            context: context,
                            builder: (context) => CustomDialog(
                              msg: 'Register success!',
                              press: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Login()));
                                }));
                      }
                    }),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
