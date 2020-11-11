import 'package:dine_inn/Home.dart';
import 'package:dine_inn/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldkey,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                          height: 290,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/dine-inn.png')
                              ))
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20.0, 210.0, 0.0, 0.0),
                        child: Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 60.0, fontWeight: FontWeight.bold, color: Colors.black
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      Form(
                        key: _formkey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                  labelText: 'EMAIL',
                                  labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  )
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter your e-mail';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 20.0),
                            TextFormField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                  labelText: 'PASSWORD',
                                  labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  )
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter a password';
                                }
                                return null;
                              },
                              obscureText: true,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Container(
                        alignment: Alignment(1.0, 0.0),
                        padding: EdgeInsets.only(top: 10.0),
                        child: InkWell(
                          child: Text(
                            'forgot password',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFF2A22C),
                                decoration: TextDecoration.underline
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        height: 40.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Color(0xFF437F97),
                          color: Color(0xFFF2A22C),
                          elevation: 7.0,
                          child: InkWell(
                            onTap: () async{
                              if (_formkey.currentState.validate()) {
                                _signinWithEmailPassword();
                              }
                            },
                            child: Center(
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      Container(
                        height: 40.0,
                        color: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFFF2A22C),
                              style: BorderStyle.solid,
                              width: 1.0,
                            ),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Center(
                                child: ImageIcon(AssetImage('assets/images/facebook.png')),
                              ),
                              SizedBox(width: 10.0,),
                              Center(
                                child: Text(
                                  'Log in with Facebook',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFF2A22C),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Container(
                        height: 40.0,
                        color: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFFF2A22C),
                              style: BorderStyle.solid,
                              width: 1.0,
                            ),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Center(
                                child: ImageIcon(AssetImage('assets/images/google.png')),
                              ),
                              SizedBox(width: 10.0,),
                              Center(
                                child: Text(
                                  'Log in with Google',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFF2A22C),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('New to Dine-inn?'),
                    SizedBox(width: 5.0,),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignupPage()),
                        );
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Color(0xFFF2A22C),
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }
  void _signinWithEmailPassword () async{
    try{
      final User user = (await auth.signInWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text)
    ).user;
    if(!user.emailVerified) {
      await user.sendEmailVerification();
    }
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
        return HomePage(
          user: user,
        );
      }));
    } catch(e) {
      _scaffoldkey.currentState.showSnackBar(SnackBar(
        content: Text("Failed to sign in with email and password"),
      ));
    print(e);
    }
  }
}