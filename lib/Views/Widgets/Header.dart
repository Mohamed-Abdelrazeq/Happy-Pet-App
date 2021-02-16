import 'package:flutter/material.dart';
import '../../Constants.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
    @required this.height,
    @required this.width,
    @required this.headTitle,
  });

  final double height;
  final double width;
  final Widget headTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: .05 * height, left: width * .08, right: width * .08),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/OwnerProfile');
            },
            child: Container(
              height: height * 0.07,
              width: height * 0.07,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(height),
                  image: DecorationImage(
                      image: AssetImage('images/profile.jpeg'),
                      fit: BoxFit.cover)),
            ),
          ),
          headTitle,
          Container(
            height: height * 0.07,
            width: height * 0.07,
            decoration: BoxDecoration(
              color: cSmithApple,
              borderRadius: BorderRadius.circular(height),
            ),
            child: Icon(
              Icons.notifications,
              color: cOldBurgundy.withOpacity(.5),
              size: height * .04,
            ),
          ),
        ],
      ),
    );
  }
}
