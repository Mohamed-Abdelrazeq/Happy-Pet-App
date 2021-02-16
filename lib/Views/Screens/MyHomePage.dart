import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//Providers
import '../../Controllers/PageProvider.dart';
//Screens
import 'HomePage.dart';
import 'Breeds.dart';
//Widgets
import '../../Views/Widgets/MyBottomNavigationBar.dart';
import '../../Views/Widgets/MyFloatingActionButton.dart';
//Constants
import '../../Constants.dart';


class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: bgWhite,
      body: Stack(
        children: [
          //BottomNavigationBar
          MyBottomNavigationBar(height: height, width: width),
          //TheApp
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              height: height * .92,
              width: width,
              child: PageView(
                controller: Provider.of<PageProvider>(context).pageController,
                onPageChanged: (newPage) {
                  Provider.of<PageProvider>(context, listen: false)
                      .changePage(newPage);
                },
                children: [
                  HomePage(),
                  Breeds(),
                ],
              ),
            ),
          ),
          //FloatingActionButton
          Positioned(
            top: height * .87,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/PetAdder');
              },
              child: MyFloatingActionButton(height: height, width: width),
            ),
          ),
        ],
      ),
    );
  }
}