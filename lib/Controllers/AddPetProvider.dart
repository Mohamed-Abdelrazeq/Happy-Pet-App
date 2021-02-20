import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';


class PetToAddProvider with ChangeNotifier{

  TextEditingController petName   = TextEditingController();
  TextEditingController ownerName = TextEditingController();
  TextEditingController about     = TextEditingController();

  String gender;
  String location;

  File imageOne;
  File imageTwo;
  File imageThree;

  bool done = false;

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
    // print(imageThree);
    // print(petName.text);
    print(ownerName.text);
    print(about.text);
  }

  void locationSetter(petLocation){
    location = petLocation;
    notifyListeners();
  }

  void genderSetter(petGender){
    gender = petGender;
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