import 'package:dine_inn/displayPicture.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dine_inn/Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationService{
  final FirebaseAuth _firebaseAuth;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  AuthenticationService(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.idTokenChanges();

  Future<void> logout() async{
    await auth.signOut();
  }

  Future<String> googleSignIn() async{
    final GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken
    );
    final UserCredential userCredential = await auth.signInWithCredential(authCredential);
    final User user = userCredential.user;
    assert(user.displayName != null);
    assert(user.email != null);
    final User currentUser = auth.currentUser;
    assert(currentUser.uid == user.uid);
    return 'Error Occured while signing in with google';
  }

  void loginFunction ({String email, String password,GlobalKey<ScaffoldState> scaffoldKey, BuildContext context}) async{
    try{
      final User user = (await auth.signInWithEmailAndPassword(
          email: email,
          password: password)
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
      scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: Text("Failed to sign in with email and password"),
      ));
      print(e);
    }
  }

  void registerAccount({String email, String password, String displayName, String phone, String dpName, BuildContext context}) async {
    final User user = (await auth.createUserWithEmailAndPassword(
        email: email,
        password: password)
    ).user;

    if(user != null) {
      if(!user.emailVerified) {
        await user.sendEmailVerification();
      }
      await user.updateProfile(displayName: displayName);
      final user1 = auth.currentUser;
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){return DisplayPicture(user: user1,);}));
      //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){return HomePage(user: user1,);}));
    }
  }
}