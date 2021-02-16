import 'package:flutter/material.dart';
import '../../../Constants.dart';
import '../../../Models/DataClasses/PetModel.dart';

class OwnerProfile extends StatefulWidget {
  OwnerProfile({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _OwnerProfileState createState() => _OwnerProfileState();
}

class _OwnerProfileState extends State<OwnerProfile> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final String imgPath = 'images/profile.jpeg';

    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text(
              'Raneem Ali',
              style: TextStyle(
                color: noopBlack,
              ),
            ),
            backgroundColor: bgWhite,
          ),
          backgroundColor: bgWhite,
          body: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 20, top: 10, left: 20),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: CircleAvatar(
                          radius: width * .1,
                          backgroundImage: AssetImage(imgPath),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: <Widget>[
                                numbersTap(10, 'PETS'),
                                numbersTap(100, 'FOLLOWERS'),
                                numbersTap(100, 'FOLLOWING'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 10),
                  child: Column(
                    children: [
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     Text(
                      //       'Raneem Ali',
                      //       style: TextStyle(
                      //           fontWeight: FontWeight.normal,
                      //           fontSize: width * .06,
                      //           color: noopBlack),
                      //       textAlign: TextAlign.right,
                      //     ),
                      //   ],
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: SizedBox(
                              width: width * .7,
                              child: Text(
                                'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: width * .03,
                                    color: noopBlack),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                OutlineButton(
                  color: cTeaGreen,
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.settings,
                        color: cOlivine,
                      ),
                      Text('Edit your profile')
                    ],
                  ),
                ),
                Container(
                  width: width,
                  height: height * .6,
                  child: GridView.count(
                    primary: false,
                    padding: EdgeInsets.only(
                        left: width * .02,
                        right: width * .02,
                        bottom: height * .05),
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 3,
                    crossAxisCount: 3,
                    children: [
                      Container(
                        height: height * .5,
                        width: width,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(dog.imagePath),
                                fit: BoxFit.cover)),
                      ),
                      Container(
                        height: height * .5,
                        width: width,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(dog.imagePath),
                                fit: BoxFit.cover)),
                      ),
                      Container(
                        height: height * .5,
                        width: width,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(dog.imagePath),
                                fit: BoxFit.cover)),
                      ),
                      Container(
                        height: height * .5,
                        width: width,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(dog.imagePath),
                                fit: BoxFit.cover)),
                      ),
                      Container(
                        height: height * .5,
                        width: width,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(dog.imagePath),
                                fit: BoxFit.cover)),
                      ),
                      Container(
                        height: height * .5,
                        width: width,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(dog.imagePath),
                                fit: BoxFit.cover)),
                      ),
                      Container(
                        height: height * .5,
                        width: width,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(dog.imagePath),
                                fit: BoxFit.cover)),
                      ),
                      Container(
                        height: height * .5,
                        width: width,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(dog.imagePath),
                                fit: BoxFit.cover)),
                      ),
                      Container(
                        height: height * .5,
                        width: width,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(dog.imagePath),
                                fit: BoxFit.cover)),
                      ),
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
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget numbersTap(int count, String type) => Expanded(
          child: Column(
        children: <Widget>[
          Text(
            '$count',
            style: TextStyle(color: noopBlack, fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,
          ),
          Text(
            type,
            style: TextStyle(color: noopBlack, fontWeight: FontWeight.normal),
            textAlign: TextAlign.start,
          ),
        ],
      ));
}
