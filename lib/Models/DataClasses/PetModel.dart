import 'package:flutter/material.dart';

class PetModel {
  final String petName;
  final String breed;
  final String age;
  final String gender;
  final String city;
  final String country;
  final String imagePath;
  final String about;

  final String ownerName;

  PetModel({
    @required this.ownerName,
    @required this.petName,
    @required this.breed,
    @required this.age,
    @required this.gender,
    @required this.city,
    @required this.country,
    @required this.imagePath,
    @required this.about,
  });
}

PetModel dog = PetModel(
  ownerName: "MACHiel",
  petName: "Bruno",
  imagePath: "images/dog.jpg",
  breed: "Bull Dog ",
  gender: "male",
  age: '0',
  city: 'Alexandria',
  country: 'Egypt',
  about:
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
);
