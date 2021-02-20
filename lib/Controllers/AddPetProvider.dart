import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';


class PetToAddProvider with ChangeNotifier{

  String petName  ;
  String ownerName;
  String about    ;

  String gender = 'male';
  bool genderBool = false;
  String location = 'Alexandria';

  File imageOne;
  File imageTwo;
  File imageThree;

  final picker = ImagePicker();

  Future getImage(double imageId) async {
    if(imageId == 1){
      var pickedFile = await picker.getImage(source: ImageSource.gallery);
      imageOne = File(pickedFile.path);
    }
    else if(imageId == 2){
      var pickedFile = await picker.getImage(source: ImageSource.gallery);
      imageTwo = File(pickedFile.path);
    }
    else {
      var pickedFile = await picker.getImage(source: ImageSource.gallery);
      imageThree = File(pickedFile.path);
    }
    notifyListeners();
  }

  void test(){
    print(imageOne);
    print(imageTwo);
    print(imageThree);
    print(location);
    print(petName);
    print(ownerName);
    print(about);
    print(gender);
  }

  void locationSetter(petLocation){
    location = petLocation;
    notifyListeners();
  }

  void genderSetter(){

    if (genderBool == false){
      genderBool = true;
    }else{
      genderBool = false;
    }

    print(genderBool);

    if (genderBool == true){
      gender = 'female';
    }else{
      gender = 'male';
    }

    notifyListeners();
  }

  void petNameSetter(newPetName){
    petName = newPetName;
    notifyListeners();
  }

  void ownerNameSetter(newOwnerName){
    ownerName = newOwnerName;
    notifyListeners();
  }

  void aboutSetter(newAbout){
    about = newAbout;
    notifyListeners();
  }

  File imageIdToImageFile(double id){
    if (id == 1){
      return imageOne;
    }
    if (id == 2){
      return imageTwo;
    }
    return imageThree;
  }
  
}