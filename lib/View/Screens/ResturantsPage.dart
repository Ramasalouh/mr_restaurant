import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../app/settings/Themes.dart';
import '../../Controller/ResturantListController.dart';
import '../Widget/ResturatCard.dart';
import 'ResturantDeatiels.dart';
// May Ibrahim
class ResturantsPage extends StatelessWidget {
  ResturantsPage({super.key});
  static const routeName = '/restList';
  ResturantListController _listController = Get.find();
  Map<String, String> args = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.indigo,
            )),
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(
          'Resturants',
          style:
              texty1(size: 25, color: Colors.indigo, weight: FontWeight.bold),
        ),
        actions: [
          Image.asset(
            "assets/${args['img']}",
            width: 40,
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: SizedBox(
        height: media(context).height * 0.975,
        child: FutureBuilder(
            future: _listController.getResturant(args['id']!),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? ListView.builder(
                      itemCount: 3,
                      padding: const EdgeInsets.only(top: 80, bottom: 10),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Get.toNamed(ResturantDeatiels.routeName,
                                arguments: {
                                  'rest': snapshot.data![index],
                                  'img': args['img']
                                });
                          },
                          child:
                              ResturantCard(resturant: snapshot.data![index]),
                        );
                      },
                    )
                  : const SpinKitDoubleBounce(
                      color: Colors.indigo,
                      size: 70,
                    );
            }),
      ),
    );
  }
}
