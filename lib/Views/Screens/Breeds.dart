import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Views/Widgets/Header.dart';
import '../../Views/Widgets/SearchBar.dart';
import '../../Constants.dart';

class Breeds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        //Header
        Header(
          height: height,
          width: width,
          headTitle: Text(
            'Breeds',
            style: TextStyle(
              fontSize: width * .08,
              color: cOldBurgundy,
              fontWeight: FontWeight.bold,
            ),
          ),
    ),
        SizedBox(
          height: height * .02,
        ),
        //Search
        SearchBar(width: width, height: height),
        SizedBox(
          height: height * .02,
        ),
        //BODY
        Container(
            height: height * .68,
            width: width,
            child: GridView.count(
              primary: false,
              padding: EdgeInsets.only(
                  left: width * .08, right: width * .08, bottom: height * .05),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: [
                BreedCard(
                  height: height,
                  imagePath: 'images/AnimalsIcons/020-dog.png',
                  petName: 'Dog',
                  petNumbers: 15,
                ),
                BreedCard(
                  height: height,
                  imagePath: 'images/AnimalsIcons/045-cat.png',
                  petName: 'Cat',
                  petNumbers: 23,
                ),
                BreedCard(
                  height: height,
                  imagePath: 'images/AnimalsIcons/022-rabbit.png',
                  petName: 'Rabbit',
                  petNumbers: 7,
                ),
                BreedCard(
                  height: height,
                  imagePath: 'images/AnimalsIcons/002-snake.png',
                  petName: 'Snake',
                  petNumbers: 5,
                ),
                BreedCard(
                  height: height,
                  imagePath: 'images/AnimalsIcons/004-turtle.png',
                  petName: 'Turtle',
                  petNumbers: 14,
                ),
                BreedCard(
                  height: height,
                  imagePath: 'images/AnimalsIcons/044-pig.png',
                  petName: 'Pig',
                  petNumbers: 3,
                ),
                BreedCard(
                  height: height,
                  imagePath: 'images/AnimalsIcons/020-dog.png',
                  petName: 'Dog',
                  petNumbers: 15,
                ),
                BreedCard(
                  height: height,
                  imagePath: 'images/AnimalsIcons/045-cat.png',
                  petName: 'Cat',
                  petNumbers: 15,
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class BreedCard extends StatelessWidget {
  const BreedCard({
    Key key,
    @required this.height,
    @required this.imagePath,
    @required this.petName,
    @required this.petNumbers,
  }) : super(key: key);

  final double height;
  final String imagePath;
  final String petName;
  final int petNumbers;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/OneBreed');
      },
      child: Container(
        decoration: BoxDecoration(
          color: noopWhite,
          borderRadius: BorderRadius.circular(height * .01),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(height * .02),
              height: height * .1,
              width: height * .1,
              decoration: BoxDecoration(
                  color: cSmithApple.withOpacity(.5), shape: BoxShape.circle),
              child: Container(
                height: height * .05,
                width: height * .05,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(imagePath), fit: BoxFit.contain),
                ),
              ),
            ),
            SizedBox(
              height: height * .015,
            ),
            Text(
              '$petName',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: height * .02,
                  color: Colors.black),
            ),
            SizedBox(
              height: height * .005,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$petNumbers',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: height * .015,
                      color: Colors.black.withOpacity(.5)),
                ),
                Text(
                  ' Pets',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: height * .015,
                      color: Colors.black.withOpacity(.5)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
