import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Controller/MapController.dart';
import '../../app/settings/Themes.dart';
import '../../models/Resturant.dart';

//Lilian Hosen 
class Maps extends StatelessWidget {
  Maps({super.key});
  static const routeName = '/Maps';
  MapController _controller = Get.find();
  Map<String, dynamic> args = Get.arguments;
  late Resturant rest = args['rest'];
  static const CameraPosition _kGooglePlex = CameraPosition(
    bearing: 30,
    tilt: 0,
    target: LatLng(25.276987, 55.296249),
    zoom: 14.4746,
  );
  Widget pinInfo() {
    return AnimatedPositioned(
        left: 0,
        right: 0,
        bottom: -100,
        duration: const Duration(milliseconds: 100),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Container(
            height: 70,
            color: Colors.amber,
            margin: const EdgeInsets.only(left: 20),
            child: const Row(children: [Text("data")]),
          ),
        ));
  }

  late GoogleMapController _mapController;
  //Sara Assaad
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: Colors.grey,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.grey,
            )),
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        centerTitle: true,
        // title: Text(
        //   'Resturants',
        //   style: texty(size: 25),
        // ),
      ),
      body: GetBuilder<MapController>(builder: (s) {
        return Stack(
          children: [
            Center(
              child: GoogleMap(
                onMapCreated: (controller) {
                  _mapController = controller;
                  _mapController.setMapStyle(_controller.mapStyle);
                },
                // myLocationEnabled: true,
                compassEnabled: true,
                tiltGesturesEnabled: false,
                markers: {
                  Marker(
                      icon: _controller.pinIcon,
                      markerId: const MarkerId('1'),
                      position: LatLng(double.parse(args['lat']),
                          double.parse(args['long'])))
                },
                onTap: (LatLng location) {
                  _controller.pinbills();
                },
                onCameraMove: (position) {
                  _controller.pin();
                },
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                      double.parse(args['lat']), double.parse(args['long'])),
                  zoom: 14.4746,
                ),
              ),
            ),
//Sara Assaad
            GetBuilder<MapController>(builder: (c) {
              return AnimatedPositioned(
                  left: 0,
                  right: 0,
                  bottom: _controller.pinbill,
                  duration: const Duration(milliseconds: 500),
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 90,
                      width: media(context).width * 0.9,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25)),
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      padding: const EdgeInsets.all(5),
                      child: Row(children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                            rest.mainPhotoSrc!,
                          ),
                          onBackgroundImageError: (exception, stackTrace) =>
                              const Center(
                                  child: Icon(
                            Icons.error_outline_outlined,
                            color: Colors.red,
                          )),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: media(context).width * 0.45,
                              child: RichText(
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text: '${rest.name!}',
                                      style: texty1(
                                          size: 15.1,
                                          weight: FontWeight.w700,
                                          color: Colors.indigo),
                                    ),
                                  ])),
                            ),
                            SizedBox(
                              width: media(context).width * 0.45,
                              child: FittedBox(
                                child: RichText(
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    text: TextSpan(children: [
                                      TextSpan(
                                        text: 'latitude :',
                                        style: texty1(
                                            size: 16.1,
                                            weight: FontWeight.w700,
                                            color: Colors.black54),
                                      ),
                                      TextSpan(
                                        text: '${rest.geo!.latitude}',
                                        style: texty1(
                                            size: 16.1,
                                            weight: FontWeight.w700,
                                            color: Colors.black54),
                                      ),
                                    ])),
                              ),
                            ),
                            SizedBox(
                              width: media(context).width * 0.45,
                              child: FittedBox(
                                child: RichText(
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    text: TextSpan(children: [
                                      TextSpan(
                                        text: 'longitude :',
                                        style: texty1(
                                            size: 16.1,
                                            weight: FontWeight.w700,
                                            color: Colors.black54),
                                      ),
                                      TextSpan(
                                        text: '${rest.geo!.longitude}',
                                        style: texty1(
                                            size: 16.1,
                                            weight: FontWeight.w700,
                                            color: Colors.black54),
                                      ),
                                    ])),
                              ),
                            ),
                          ],
                        ),
                        Image.asset(
                          'assets/1486164730-114_79711.png',
                          width: 60,
                          height: 70,
                        )
                      ]),
                    ),
                  ));
            })
          ],
        );
      }),
    );
  }
}
