import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'View/Screens/SplashScreen.dart';
import 'app/Bindings/splashBindings.dart';
import 'app/settings/Themes.dart';
import 'app/settings/routs.dart';

//Aya Ahmad
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // {"amsterdam":'ChIJVXealLU_xkcRja_At0z9AGY','Rome':'ChIJu46S-ZZhLxMROG5lkwZ3D7k',"moscow":'ChIJybDUc_xKtUYRTM9XV8zWRD0',"berlin":'ChIJAVkDPzdOqEcRcDteW0YgIQQ'}
  @override
  Widget build(BuildContext context) { // Rama_Salouh
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      title: 'Resturanto',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: OwnColors.secondColor),
        useMaterial3: true,
      ),
      initialBinding: SplashBinding(),
      getPages: appRoutes(),
    );
  }
}
