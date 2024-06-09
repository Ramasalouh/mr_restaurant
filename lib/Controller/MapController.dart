import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//Aya Alaji
class MapController extends GetxController {
  double? pinbill = 50;
  void pin() {
    pinbill = -100;

    update();
  }

  void pinbills() {
    pinbill = 50;

    update();
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
//Zain Alabden Khalil
  BitmapDescriptor pinIcon = BitmapDescriptor.defaultMarkerWithHue(0.5);
  void setPinicon() {
    BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(10, 10)),
            'assets/1486164730-114_79711.png')
        .then((value) => pinIcon = value);
  }

  String? mapStyle;
  void setStyle() {
    rootBundle.loadString('assets/json/map_style.txt').then((string) {
      mapStyle = string;
    });
  }

  @override
  void onInit() async {
    setPinicon();
    _determinePosition();
    setStyle();

    super.onInit();
  }

  @override
  void onReady() {
    setPinicon();
    update();
    super.onReady();
  }
}
