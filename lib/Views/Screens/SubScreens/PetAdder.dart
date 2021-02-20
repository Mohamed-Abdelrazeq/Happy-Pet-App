import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:happy_pet_app/Controllers/AddPetProvider.dart';
import 'package:happy_pet_app/Controllers/CurrentUserProvider.dart';
import 'package:provider/provider.dart';
import '../../../Views/Widgets/AddImageCard.dart';
import '../../../Views/Widgets/MyButton.dart';
import '../../../Views/Widgets/MyTextField.dart';
import '../../../Constants.dart';
import '../../../Models/DataClasses/PetModel.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:dropdown_search/dropdown_search.dart';

class PetAdder extends StatelessWidget {

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

  bool fieldsValidator(
      BuildContext context,
      String petName,
      String ownerName,
      String about,
      File   imageOne,
      File   imageTwo,
      File   imageThree,
      ){
    if(petName == null){
      mySnackBar(context, 'Please enter your pet name');
      return false;
    }
    if(ownerName == null){
      mySnackBar(context, 'Please enter your name');
      return false;
    }
    if(about == null){
      mySnackBar(context, 'Please enter your about section');
      return false;
    }
    if(imageOne == null){
      mySnackBar(context, 'Please enter your pet first image');
      return false;
    }
    if(imageTwo == null){
      mySnackBar(context, 'Please enter your pet second image');
      return false;
    }
    if(imageThree == null){
      mySnackBar(context, 'Please enter your pet third image');
      return false;
    }
    print('true');
    return true;

  }


  //todo i need to add the images to the firestore then add the links to this func to finish this screen
  Future<void> addPet(
      BuildContext context,
      String petName,
      String ownerName,
      String about,
      String imageOne,
      String imageTwo,
      String imageThree,
      ) async {
    CollectionReference pets = FirebaseFirestore.instance.collection('pets');

    var userEmail = Provider.of<CurrentUserProvider>(context,listen: false).currentUser.email;

    return pets
        .doc(userEmail)
        .set({
      'petName' : petName,
      'ownerName' : ownerName,
      'about' : about,
      'imageOne' : imageOne,
      'imageTwo' : imageTwo,
      'imageThree' : imageThree,
    })
        .then((value) => print("Pet Added"))
        .catchError((error) => print("Failed to add pet: $error"));
  }



  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    var myProvider = Provider.of<PetToAddProvider>(context,listen: false);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Stack(
        children: [
          //pet profile pic
          Positioned(
            top: 0,
            child: Container(
              width: width,
              height: height * .5,
              color: cSmithApple,
              child: PageView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    height: height * .5,
                    width: width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(dog.imagePath),
                            fit: BoxFit.cover)),
                  ),
                ],
              ),
            ),
          ),
          //Info & Images & Contact
          Positioned(
            top: 0,
            child: Container(
              height: height,
              width: width,
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  //Empty
                  Container(
                    height: height * .4,
                  ),
                  //INFO
                  Container(
                    width: width,
                    padding: EdgeInsets.only(
                      left: width * .1,
                      right: width * .1,
                      top: height * .05,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(height * .05),
                            topRight: Radius.circular(height * .05))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Name
                        MyTextField(
                            height: height,
                            width: width,
                            myWidth: .8,
                            myHeight: .08,
                            obscureBool: false,
                            noSpace: false,
                            hint: 'Pet Name',
                            myIcon: Icons.pets,
                          onChangeFunction: (v){
                              myProvider.petNameSetter(v);
                          },
                        ),
                        SizedBox(
                          height: height * .02,
                        ),

                        //Contact
                        MyTextField(
                            height: height,
                            width: width,
                            myWidth: .8,
                            myHeight: .08,
                            obscureBool: false,
                            noSpace: false,
                            hint: 'Your Name',
                            myIcon: Icons.account_circle,
                          onChangeFunction: (v){
                            myProvider.ownerNameSetter(v);
                          },

                        ),
                        SizedBox(
                          height: height * .02,
                        ),

                        //Gender
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Elusive.male,
                                  color: cOlivine,
                                  size: height * .03,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Male',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: height * .03),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Switch(
                              activeColor: cSmithApple,
                              value: Provider.of<PetToAddProvider>(context).genderBool,
                              onChanged: (value) {
                                myProvider.genderSetter();
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Elusive.female,
                                  color: cOlivine,
                                  size: height * .03,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Female',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: height * .03),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * .02,
                        ),

                        //Location
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.location_on_rounded,
                              color: cOlivine,
                              size: height * .036,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Where\'re You From',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: height * .03,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * .02,
                        ),
                        DropdownSearch<String>(
                            mode: Mode.BOTTOM_SHEET,
                            showSelectedItem: true,
                            items: [
                              "Alexandria",
                              "Cairo",
                              "New Valley",
                              'Giza',
                              'Matruh',
                              'Red Sea',
                              'South Sinai',
                              'North Sinai',
                              'Suez',
                              'Beheira',
                              'Helwan',
                              'Sharqia',
                              'Dakahlia',
                              'Kafr el-Sheikh',
                              'Monufia',
                              'Minya',
                              'Gharbia',
                              'Faiyum',
                              'Qena',
                              'Asyut',
                              'Sohag',
                              'Ismailia',
                              'Beni Suef',
                              'Qalyubia',
                              'Aswan',
                              'Damietta',
                              'Port Said',
                              'Luxor',
                              '6th of October',
                            ],
                            onChanged: (value) {
                              myProvider.locationSetter(value);
                            },
                            selectedItem: "Alexandria"),
                        SizedBox(
                          height: height * .02,
                        ),

                        //Images
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.image,
                              color: cOlivine,
                              size: height * .036,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Images',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: height * .03,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * .02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            AddImageCard(
                              height: height,
                              imageId: 1,
                              selectImage: ()async{
                                await myProvider.getImage(1);
                                },
                            ),

                            AddImageCard(
                              height: height,
                              imageId: 2,
                              selectImage: ()async {
                                await myProvider.getImage(2);
                              },
                            ),

                            AddImageCard(
                              height: height,
                              imageId: 3,
                              selectImage: ()async{
                                await myProvider.getImage(3);
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * .02,
                        ),

                        //About
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.pets_sharp,
                              color: cOlivine,
                              size: height * .036,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Tell Us Your Story',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: height * .03,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * .02,
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * .05),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(height * .02)),
                          child: Center(
                            child: TextField(
                              keyboardType: TextInputType.multiline,
                              maxLines: 7,
                              cursorColor: Colors.black87,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: 'About Your Pet',
                                contentPadding: EdgeInsets.only(
                                    left: 15, bottom: 30, top: 30, right: 15),
                              ),
                              onChanged: (v){
                                myProvider.aboutSetter(v);
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * .02,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * .02,
                  ),


                  //Button
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * .2),
                    child: MyButton(
                      width: width,
                      height: height,
                      horizontalPadding: width*.02,
                      verticalPadding: height*.02,
                      myTextColor: Colors.white,
                      myText: 'Done',
                      myFunc: () {
                        myProvider.test();
                        fieldsValidator(context, myProvider.petName, myProvider.ownerName, myProvider.about, myProvider.imageOne, myProvider.imageTwo, myProvider.imageThree);
                      },
                    ),
                  ),
                  SizedBox(
                    height: height * .03,
                  ),
                ],
              ),
            ),
          ),
          // icons on top of profile pic
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: 40,
                horizontal: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Back
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: noopWhite,
                          boxShadow: [shadow]),
                      child: Icon(
                        Icons.chevron_left,
                        color: cSmithApple,
                        size: height * .04,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
