import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/settings/Themes.dart';
import 'ResturantsPage.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const routeName = '/home';
  @override
  State<HomePage> createState() => _HomePageState();
}
//Aya alaji
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: media(context).width * 0.75,
                      child: Text(
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        'Discover \nThe Resturant',
                        style: texty(
                            size: 30.1,
                            weight: FontWeight.w700,
                            color: Colors.black87),
                      ),
                    ),
                    Image.asset(
                      "assets/globe.png",
                      width: 40,
                    )
                  ],
                ),
              ),
              CityCard(
                  co: 4,
                  fun: () {
                    Get.toNamed(ResturantsPage.routeName,
                        arguments: {'id': '528294', 'img': "sweden_flag.png"});
                  },
                  name: 'Stockholm',
                  flag: "sweden_flag.png"),
              CityCard(
                co: 1,
                fun: () {
                  Get.toNamed(ResturantsPage.routeName,
                      arguments: {'id': '461789', 'img': "italy_flag.png"});
                },
                name: 'Rome',
                flag: "italy_flag.png",
              ),
              CityCard(
                  co: 2,
                  fun: () {
                    Get.toNamed(ResturantsPage.routeName,
                        arguments: {'id': '19088', 'img': "netherlands.png"});
                  },
                  name: 'Amesterdam',
                  flag: "netherlands.png"),
              CityCard(
                  co: 3,
                  fun: () {
                    Get.toNamed(ResturantsPage.routeName,
                        arguments: {'id': '52003', 'img': "germany.png"});
                  },
                  name: 'Berlin',
                  flag: "germany.png"),
              SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
//Aya Ahmad
class CityCard extends StatelessWidget {
  const CityCard({
    super.key,
    required this.name,
    required this.fun,
    required this.co,
    required this.flag,
  });
  final String name;
  final Function() fun;
  final int co;
  final String flag;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: fun,
      child: Card(
        color: co == 1
            ? OwnColors.secondColor.withOpacity(0.9)
            : co == 2
                ? Colors.deepOrange.withOpacity(0.9)
                : co == 3
                    ? Colors.amber.withOpacity(0.9)
                    : co == 4
                        ? Colors.indigo.withOpacity(0.9)
                        : Colors.indigo.withOpacity(0.9),
        child: SizedBox(
            height: media(context).height * 0.15,
            width: media(context).width,
            child: Stack(
              clipBehavior: Clip.hardEdge,
              children: [
                // Container(
                //   width: 120,
                //   height: 140,
                //   decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.circular(50)),
                // ),
                const Positioned(
                  right: -20,
                  top: 3,
                  child: CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.white38,
                  ),
                ),
                const Positioned(
                  right: 60,
                  top: 40,
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.white54,
                  ),
                ),
                const Positioned(
                  right: 140,
                  top: 70,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white60,
                  ),
                ),
                Positioned(
                  right: 90,
                  top: 30,
                  child: Image.asset(
                    "assets/$flag",
                    width: 60,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SizedBox(
                    width: media(context).width * 0.3,
                    child: FittedBox(
                      child: Text(
                        maxLines: 1,
                        '$name',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
