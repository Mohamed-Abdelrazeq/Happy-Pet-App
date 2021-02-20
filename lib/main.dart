//Packages
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//Screens
import 'Controllers/AddPetProvider.dart';
import 'Controllers/CurrentUserProvider.dart';
import 'Views/FutureReturn/Loading.dart';
import 'Views/FutureReturn/SomethingWentWrong.dart';
import 'Views/Screens/EnterScreen.dart';
import 'Views/Screens/MyHomePage.dart';
import 'Views/Screens/SubScreens/PetProfile.dart';
import 'Views/Screens/SubScreens/OneBreed.dart';
import 'Views/Screens/SubScreens/PetAdder.dart';
import 'Views/Screens/SubScreens/OwnerProfile.dart';
import 'Views/Screens/Auth/Login.dart';
import 'Views/Screens/Auth/Register.dart';
//Controllers
import 'Controllers/PageProvider.dart';
//Firebase

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<PageProvider>(create: (_) => PageProvider()),
        ChangeNotifierProvider<CurrentUserProvider>(create: (_) => CurrentUserProvider()),
        ChangeNotifierProvider<PetToAddProvider>(create: (_) => PetToAddProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return SomethingWentWrong();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            routes: {
              '/EnterScreen': (context) => EnterScreen(),
              '/MyHomePage': (context) => MyHomePage(),
              '/PetProfile': (context) => PetProfile(),
              '/OneBreed': (context) => OneBreed(),
              '/PetAdder': (context) => PetAdder(),
              '/Login': (context) => Login(),
              '/Register': (context) => Register(),
              '/OwnerProfile': (context) => OwnerProfile(),
            },
            home: EnterScreen(),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Loading();
      },
    );

  }
}



