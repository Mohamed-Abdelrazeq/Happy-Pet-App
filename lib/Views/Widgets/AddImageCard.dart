import 'package:flutter/material.dart';

import '../../Constants.dart';


class AddImageCard extends StatelessWidget {
  const AddImageCard({
    Key key,
    @required this.height,

  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        // TODO
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.all(height * .02),
        decoration: BoxDecoration(
          color: noopWhite,
          borderRadius: BorderRadius.circular(height*.01),
        ),
        child: Container(
            height: height * .06,
            width: height * .06,
            decoration: BoxDecoration(
                color: cSmithApple.withOpacity(.5),
                shape: BoxShape.circle
            ),
            child: Icon(Icons.add,color: Colors.white,size: height*.05,)
        ),
      ),
    );
  }
}

