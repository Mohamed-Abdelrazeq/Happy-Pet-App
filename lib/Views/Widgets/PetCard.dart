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
      margin: EdgeInsets.only(bottom: width * .04),
      padding: EdgeInsets.symmetric(
          horizontal: width * .03, vertical: width * .015),
      width: width * .28,
      height: width * .5,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(width * .02)),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(width * .012),
            width: width*.32,
            height: width * .44,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imgPath),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(width * .05)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: width * .08,
                      height: width * .08,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(width)),
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
                EdgeInsets.fromLTRB(width * .06, width * .01, width * 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: width * .07,
                    fontWeight: FontWeight.w600,
                    color: cOldBurgundy,
                  ),
                ),
                SizedBox(),
                Text(
                  owner,
                  style: TextStyle(
                      fontSize: width * .04,
                      fontWeight: FontWeight.w300,
                      color: Colors.black45),
                ),
                SizedBox(
                  height: width * .01,
                ),
                Container(
                  width: width * .37,
                  child: Text(
                    "she is a nice cat with cute eyes and white color",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: width * .04,
                        fontWeight: FontWeight.w300,
                        color: Colors.black87),
                  ),
                ),
                SizedBox(
                  width: width * .01,
                ),
                Container(
                  // width: width * .4,
                  child: Row(
                    children: [
                      Text(
                        'I\'m Kitty',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: width * .04),
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
                              color: cOldBurgundy, fontSize: width * .03),
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
