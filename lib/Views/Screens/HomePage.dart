import 'package:flutter/material.dart';
//Widgets
import '../../Views/Widgets/Header.dart';
import '../../Views/Widgets/MyFilterChip.dart';
import '../../Views/Widgets/PetCard.dart';
import '../../Views/Widgets/SearchBar.dart';

import '../../Constants.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        //Header
        Header(height: height, width: width,headTitle: Row(
          children: [
            Text(
              'Hello',
              style: TextStyle(
                fontSize: width * .08,
                color: cOldBurgundy,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: width * .02,
            ),
            Text(
              'Eleven',
              style: TextStyle(
                fontSize: width * .08,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),),
        SizedBox(
          height: height * .02,
        ),
        //Search
        SearchBar(width: width, height: height),
        SizedBox(
          height: height * .02,
        ),
        //Chips
        Container(
          height: height * .05,
          width: width,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(
                width: width * .08,
              ),
              MyFilterChip(
                genre: 'Cats',
              ),
              MyFilterChip(
                genre: 'Dogs',
              ),
              MyFilterChip(
                genre: 'Dragons',
              ),
              MyFilterChip(
                genre: 'Pandas',
              ),
              MyFilterChip(
                genre: 'Snakes',
              ),
              SizedBox(
                width: width * .08,
              ),
            ],
          ),
        ),
        //Cards
        Container(
          width: width,
          height: height * .62,
          padding: EdgeInsets.symmetric(horizontal: width * .08),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              PetCard(width: width, height: height,imgPath: 'images/Cat 1.jpg',name: 'Rose',owner: 'Raneem',),
              PetCard(width: width, height: height,imgPath: 'images/Cat 3.jpg',name: 'Bella',owner: 'Lobna',),
              PetCard(width: width, height: height,imgPath: 'images/Cat 2.jpg',name: 'Rose',owner: 'Raneem',),
              PetCard(width: width, height: height,imgPath: 'images/Cat 1.jpg',name: 'Rose',owner: 'Raneem',),
              PetCard(width: width, height: height,imgPath: 'images/Cat 1.jpg',name: 'Rose',owner: 'Raneem',),
            ],
          ),
        ),
      ],
    );
  }
}







