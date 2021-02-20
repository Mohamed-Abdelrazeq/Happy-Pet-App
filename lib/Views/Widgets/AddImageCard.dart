import 'dart:io';

import 'package:flutter/material.dart';
import 'package:happy_pet_app/Controllers/AddPetProvider.dart';
import 'package:provider/provider.dart';

import '../../Constants.dart';

class AddImageCard extends StatelessWidget {
  const AddImageCard({
    Key key,
    @required this.height,
    @required this.selectImage,
    @required this.imageId,
  }) : super(key: key);

  final double height;
  final Function selectImage;
  final double imageId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
            onTap: selectImage,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              padding: EdgeInsets.all(height * .02),
              decoration: BoxDecoration(
                color: noopWhite,
                borderRadius: BorderRadius.circular(height * .01),
              ),
              child: Container(
                  height: height * .06,
                  width: height * .06,
                  decoration: BoxDecoration(
                      color: cSmithApple.withOpacity(.5),
                      shape: BoxShape.circle),
                  child: Icon(
                    Provider.of<PetToAddProvider>(context).imageIdToImageFile(imageId) == null ? Icons.add : Icons.done,
                    color: Colors.white,
                    size: height * .05,
                  )),
            ),
          );
  }
}
