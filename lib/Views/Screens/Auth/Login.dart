import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:happy_pet_app/Controllers/CurrentUserProvider.dart';
import 'package:happy_pet_app/Models/DataClasses/UserModel.dart';
import 'package:provider/provider.dart';
import '../../../Constants.dart';
import '../../../Views/Widgets/MyButton.dart';
import '../../../Views/Widgets/MyTextField.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatelessWidget {
  //Vars
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
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
    if(_email.text == ''){
      mySnackBar(context, 'Please enter your email');
      return false;
    }else if (_password.text == ''){
      mySnackBar(context, 'Please enter your password');
      return false;
    }else{
      return true;
    }
  }
  Future<bool> loginValidator(BuildContext context)async{
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email.text,
        password: _password.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        mySnackBar(context, 'Wrong email');
        return false;
      } else if (e.code == 'wrong-password') {
        mySnackBar(context, 'Wrong password');
        return false;
      } else {
        mySnackBar(context, 'Not Valid');
        return false;
      }
    }
    return true;
  }
  Future<void> storeUserData(username,context)async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(_email.text)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        Map data = documentSnapshot.data();
        Provider.of<CurrentUserProvider>(context,listen: false).currentUserSetter(currentUserData: UserModel(username: data['username'], email: data['email'] , phone: data['phone']));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * .1),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            SizedBox(height: height*.18,),

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
            SizedBox(height: height * .04),

            MyTextField(
                myController: _email,
                height: height,
                width: width,
                myWidth: .8,
                myHeight: .1,
                hint: 'E-Mail',
                myIcon: Icons.email,
              noSpace: true,
              obscureBool: false,
            ),
            SizedBox(height: height * .02),

            MyTextField(
                myController: _password,
                height: height,
                width: width,
                myWidth: .8,
                myHeight: .1,
                hint: 'Password',
                myIcon: Icons.lock,
              noSpace: true,
              obscureBool: true,
            ),
            SizedBox(height: height * .04),

            MyButton(
              width: width,
              height: height,
              myText: 'Login',
              horizontalPadding: width*.2,
              verticalPadding: height*.02,
              myTextColor: Colors.white,
              myFunc: () async {
                mySnackBar(context, 'Please Wait');
                if(fieldsValidator(context)){
                  if(await loginValidator(context)){
                    storeUserData(_email,context);
                    Navigator.pushNamed(context, '/MyHomePage');
                  }
                }
              },
            ),
            SizedBox(height: height * .02),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    'Not a User ?'
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, '/Register');
                  },
                  child: Text(
                    ' Join Now',
                    style: TextStyle(
                        color: cSmithApple
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
