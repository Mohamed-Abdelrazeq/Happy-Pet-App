import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import '../../../Constants.dart';
import '../../../Models/DataClasses/PetModel.dart';
import 'package:fluttericon/elusive_icons.dart';

Color w = Colors.white;
Color b = Colors.black87;
Color o = Colors.orange;

class PetProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
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
                        left: width * .1, right: width * .1, top: height * .05),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(height * .05),
                            topRight: Radius.circular(height * .05))),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Elusive.male, //TODO
                              color: cSmithApple,
                              size: height * .045,
                            ),
                            SizedBox(
                              width: width * .03,
                            ),
                            Text(
                              dog.petName,
                              style: TextStyle(
                                  color: noopBlack,
                                  fontSize: height * .05,
                                  fontWeight: FontWeight.w600),
                            ),
                            Spacer(),
                            Icon(
                              Icons.favorite,
                              color: cSmithApple,
                              size: height * .05,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * .01,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.location_on,
                              color: cSmithApple,
                              size: height * .04,
                            ),
                            SizedBox(
                              width: width * .01,
                            ),
                            Text(
                              '${dog.city},${dog.country} ',
                              style: TextStyle(
                                  color: noopBlack,
                                  fontSize: height * .03,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * .02,
                        ),
                        Container(
                          width: width,
                          child: ReadMoreText(
                            dog.about,
                            trimLines: 2,
                            style: TextStyle(
                                color: noopBlack,
                                fontSize: height * .023,
                                fontWeight: FontWeight.w400),
                            trimMode: TrimMode.Line,
                            trimCollapsedText: '...Read more',
                            trimExpandedText: ' Less',
                          ),
                        ),
                        SizedBox(
                          height: height * .02,
                        ),
                      ],
                    ),
                  ),
                  //Images
                  // add new style TODO
                  Container(
                    height: height * 0.18,
                    padding: EdgeInsets.symmetric(horizontal: width * .1),
                    color: Colors.white,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          height: height * .18,
                          width: width * 0.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(15)),
                            image: DecorationImage(
                                image: AssetImage(dog.imagePath),
                                fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(
                          width: width * .02,
                        ),
                        Container(
                          height: height * .18,
                          width: width * 0.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(15)),
                            image: DecorationImage(
                                image: AssetImage(dog.imagePath),
                                fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(
                          width: width * .02,
                        ),
                        Container(
                          height: height * .18,
                          width: width * 0.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(15)),
                            image: DecorationImage(
                                image: AssetImage(dog.imagePath),
                                fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(
                          width: width * .02,
                        ),
                        Container(
                          height: height * .18,
                          width: width * 0.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(15)),
                            image: DecorationImage(
                                image: AssetImage(dog.imagePath),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  //Contact
                  Container(
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 20,
                    ),
                    width: width,
                    height: height * .08,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    //alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Container(
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage:
                                  AssetImage('images/profile.jpg'),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'Raneem Ali',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: height * .023),
                                    ),
                                    Text(
                                      'jan 1, 2020',
                                      style: TextStyle(
                                        color: noopBlack,
                                        fontSize: height * .02,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: height * .07,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: cSmithApple,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Adopt me',
                              style: TextStyle(
                                fontSize: height * .025,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * .01,
                  )
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
                  //follow something TODO
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: noopWhite, boxShadow: [shadow]),
                    child: Icon(
                      Icons.add,
                      color: cSmithApple,
                      size: height * .04,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
