import 'package:flutter/material.dart';
import 'package:happy_pet_app/Models/DataClasses/UserModel.dart';

class CurrentUserProvider with ChangeNotifier{

  UserModel currentUser;

  void currentUserSetter({
    @required username,
    @required email,
    @required phone,
  }){
    currentUser.username = username;
    currentUser.email = email;
    currentUser.phone = phone;
  }

}