import 'package:get/get.dart';

import '../../../View/screens/Maps.dart';
import '../../View/Screens/HomePage.dart';
import '../../View/Screens/ResturantDeatiels.dart';
import '../../View/Screens/ResturantsPage.dart';
import '../../View/Screens/SplashScreen.dart';
import '../Bindings/mapBindings.dart';
import '../Bindings/restListBindings.dart';
import '../Bindings/splashBindings.dart';
//anas abdullah

appRoutes() => [ 
      GetPage(
        name: SplashScreen.routeName,
        page: () => SplashScreen(),
        binding: SplashBinding(),
        transition: Transition.circularReveal,
        transitionDuration: Duration(milliseconds: 500),
      ),
      GetPage(  
        name: HomePage.routeName,
        page: () => HomePage(),
        transition: Transition.circularReveal,
        transitionDuration: Duration(milliseconds: 500),
      ),
      GetPage(
        name: ResturantsPage.routeName,
        page: () => ResturantsPage(),
        binding: HomeBinding(),
        transition: Transition.circularReveal,
        transitionDuration: Duration(milliseconds: 500),
      ),
      GetPage(
        name: ResturantDeatiels.routeName,
        page: () => ResturantDeatiels(),
        transition: Transition.circularReveal,
        transitionDuration: Duration(milliseconds: 500),
      ),
      GetPage(
        name: Maps.routeName,
        page: () => Maps(),
        binding: MapBindings(),
        transition: Transition.circularReveal,
        transitionDuration: Duration(milliseconds: 500),
      ),
    ];
