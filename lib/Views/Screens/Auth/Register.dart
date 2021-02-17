import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:happy_pet_app/Controllers/CurrentUserProvider.dart';
import 'package:provider/provider.dart';
import '../../../Views/Widgets/MyButton.dart';
import '../../../Views/Widgets/MyTextField.dart';

import '../../../Constants.dart';

//Commentt

class Register extends StatelessWidget {
  //Vars
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _username = TextEditingController();
  //Methods
  Flushbar mySnackBar(BuildContext context,String myText){
    return Flushbar(
      message: myText,
      backgroundColor: cSmithApple,
      margin: EdgeInsets.all(8),
      borderRadius: 8,
      icon: Icon(
        Icons.info_outline,
        size: 28.0,
        color: Colors.white,
      ),
      duration: Duration(seconds: 3),
    )..show(context);
  }

  bool fieldsValidator(BuildContext context){
    if(_username.text == ''){
      mySnackBar(context, 'Please enter your username');
      return false;
    }else if (_email.text == ''){
      mySnackBar(context, 'Please enter your email');
      return false;
    }else if (_password.text == ''){
      mySnackBar(context, 'Please enter your password');
      return false;
    }else if (_phone.text == '') {
      mySnackBar(context, 'Please enter your phone number');
      return false;
    } else{
      return true;
    }
  }
  Future<bool> registerValidator(BuildContext context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email.text,
          password: _password.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        mySnackBar(context, 'Weak password');
        return false;
      } else if (e.code == 'email-already-in-use') {
        mySnackBar(context, 'Email already used');
        return false;
      } else {
        mySnackBar(context, 'Invalid Registration');
        return false;
      }
    }
    return true;
  }
  Future<void> addUser() async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return users
        .add({
      'username': _username.text,
      'email':    _email.text,
      'phone':    _phone.text,
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return  Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * .1),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            //Logo
            SizedBox(height: height*.1,),
            Hero(
              tag: 'Logo',
              child: Container(
                height: height*.2,
                width: width*.4,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/Logo.png')
                    )
                ),
              ),
            ),
            //UserName
            SizedBox(height: height * .04),
            MyTextField(
              myController: _username,
                height: height,
                width: width,
                obscureBool: false,
                noSpace: false,
                myWidth: .8,
                myHeight: .1,
                hint: 'Username',
                myIcon: Icons.account_circle,),
            //Email
            SizedBox(height: height * .02),
            MyTextField(
                myController: _email,
                height: height,
                width: width,
                obscureBool: false,
                noSpace: true,
                myWidth: .8,
                myHeight: .1,
                hint: 'E-Mail',
                myIcon: Icons.email),
            //Password
            SizedBox(height: height * .02),
            MyTextField(
                myController: _password,
                height: height,
                width: width,
                obscureBool: false,
                noSpace: true,
                myWidth: .8,
                myHeight: .1,
                hint: 'Password',
                myIcon: Icons.lock),
            //Phone Number
            SizedBox(height: height * .02),
            MyTextField(
              myController: _phone,
                height: height,
                obscureBool: false,
                noSpace: true,
                width: width,
                myWidth: .8,
                myHeight: .1,
                hint: 'Phone',
                myIcon: Icons.phone),
            //Button
            SizedBox(height: height * .04),
            MyButton(
              width: width,
              height: height,
              myText: 'Register',
              horizontalPadding: width*.2,
              verticalPadding: height*.02,
              myTextColor: Colors.white,
              myFunc: () async {
                mySnackBar(context, 'Please Wait');
                if(fieldsValidator(context)){
                  if(await registerValidator(context)){
                    await addUser();
                    Provider.of<CurrentUserProvider>(context).currentUserSetter(username: _username.text, email: _email.text, phone: _phone.text);
                    Navigator.pushNamed(context, '/MyHomePage');
                  }
                }
              },
            ),
            //Login
            SizedBox(height: height * .02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    'Already a User ?'
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Text(
                    ' Login',
                    style: TextStyle(
                        color: cSmithApple
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: height * .1),
          ],
        ),
      ),
    );
  }
}
