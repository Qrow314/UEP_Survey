import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uep_survey/services/auth.dart';
import 'package:uep_survey/views/home.dart';
import 'package:uep_survey/views/signup.dart';
import 'package:validators/validators.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  AuthService authService = new AuthService();
  bool _isLoading = false;

  signIn() async {
    setState(() {
      _isLoading = true;
    });
    await authService.signInEmailAndPass(email, password).then((value) {
      if (value != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home()));
      }
    });
    setState(() {
      _isLoading = false;
    });
    //if(_formKey.currentState!.validate());
  }

  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('UEP SURVEY APP'),
        centerTitle: true,
      ),
      body: _isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    Spacer(),
                    Container(
                      child: Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(hintText: "Email"),
                            //validator: (val){ val.isEmpty ? "Enter Email ID" : null;},
                            onChanged: (val) {
                              email = val;
                            },
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          TextField(
                            decoration: InputDecoration(hintText: "Password"),
                            //validator: (val){return val.isEmpty ? "Enter Email ID" : null;},
                            onChanged: (val) {
                              password = val;
                            },
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          GestureDetector(
                            onTap: () {
                              signIn();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 20),
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Don\'t have an account? ',
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 17)),
                              GestureDetector(
                                onTap: () {
                                  //widget.toogleView();
                                },
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Signup()));
                                  },
                                  child: Container(
                                    child: Text('Sign Up',
                                        style: TextStyle(
                                            color: Colors.black87,
                                            decoration:
                                                TextDecoration.underline,
                                            fontSize: 17)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 80,
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
