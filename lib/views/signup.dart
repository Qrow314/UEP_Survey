import 'package:flutter/material.dart';
import 'package:uep_survey/services/auth.dart';
import 'package:uep_survey/views/home.dart';
import 'package:uep_survey/views/signin.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  final _formKey = GlobalKey<FormState>();
  late String name;
  late String email;
  late String password;
  AuthService authService = new AuthService();
  bool _isLoading = false;

  signUp() async {

    setState(() {
      _isLoading = true;
    });
    await authService.signUpWithEmailAndPassword(email, password).then((value) {
      if(value != null){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
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
        title: Text('Sign Up'),
        centerTitle: true,
      ),
      body: _isLoading ? Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ) : Form(
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
                decoration: InputDecoration(hintText: "Name"),
                //validate: (val){val.isEmpty ? "Enter Email ID" : null;},
                onChanged: (val){
                  name = val;
                },
              ),
          SizedBox(
            height: 6,
          ),
                    TextField(
                      decoration: InputDecoration(hintText: "Email"),
                      //validate: (val){val.isEmpty ? "Enter Email ID" : null;},
                      onChanged: (val){
                        email = val;
                      },
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: "Password"),
                      //validate: (val){val.isEmpty ? "Enter Email ID" : null;},
                      onChanged: (val){
                        password = val;
                      },
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    GestureDetector(
                      onTap: () {

                      },
                      child: GestureDetector(
                        onTap: () {
                          signUp();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(30)),
                          child: GestureDetector(
                            onTap: () {

                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account? ',
                            style:
                            TextStyle(color: Colors.black87, fontSize: 17)),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context)=> Signin()));
                          },
                          child: Container(
                            child: Text('Sign In',
                                style: TextStyle(
                                    color: Colors.black87,
                                    decoration: TextDecoration.underline,
                                    fontSize: 17)),
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
