import 'package:flutter/material.dart';
import '../../Constants.dart';

class PetCard extends StatelessWidget {
  const PetCard({
    Key key,
    @required this.width,
    @required this.height,
    @required this.imgPath,
    @required this.name,
    @required this.owner,

  });

  final double width;
  final double height;
  final String imgPath;
  final String name;
  final String owner;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: height * .02),
      padding: EdgeInsets.symmetric(
          horizontal: width * .03, vertical: height * .015),
      height: height * .28,
      width: width * .88,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(height * .02)),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(height * .012),
            height: height,
            width: width * .3,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imgPath),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(height * .02)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: height * .04,
                      width: width * .08,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(height)),
                      child: Center(
                          child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding:
                EdgeInsets.fromLTRB(width * .06, height * .01, width * 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: height * .035,
                    fontWeight: FontWeight.w600,
                    color: cOldBurgundy,
                  ),
                ),
                SizedBox(),
                Text(
                  owner,
                  style: TextStyle(
                      fontSize: height * .02,
                      fontWeight: FontWeight.w300,
                      color: Colors.black45),
                ),
                SizedBox(
                  height: height * .01,
                ),
                Container(
                  width: width * .4,
                  child: Text(
                    "she is a nice cat with cute eyes and white color",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: height * .02,
                        fontWeight: FontWeight.w300,
                        color: Colors.black87),
                  ),
                ),
                SizedBox(
                  height: height * .01,
                ),
                Container(
                  // width: width * .4,
                  child: Row(
                    children: [
                      Text(
                        'I\'m Kitty',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: height * .02),
                      ),
                      SizedBox(
                        width: width * .03,
                      ),
                      RaisedButton(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        color: cSmithApple,
                        child: Text(
                          "Adopt me",
                          style: TextStyle(
                              color: cOldBurgundy, fontSize: height * .02),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
