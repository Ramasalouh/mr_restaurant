import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../app/settings/Themes.dart';
import '../../models/Resturant.dart';
import 'Maps.dart';
//Zain Alabden Khalil
class ResturantDeatiels extends StatelessWidget {
  ResturantDeatiels({super.key});
  static const routeName = '/resturantDeatiels';
  Map<String, dynamic> args = Get.arguments;
  late Resturant rest = args['rest'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.indigo,
          onPressed: () {
            Get.toNamed(Maps.routeName, arguments: {
              'lat': rest.geo!.latitude,
              'long': rest.geo!.longitude,
              'rest': rest
            });
          },
          child: const Icon(
            Icons.map_sharp,
            color: Colors.white,
          )),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        centerTitle: true,
        // title: Text(
        //   'Resturants',
        //   style: texty(size: 25),
        // ),
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
      body: SafeArea(
          top: false,
          child: Column(
            children: [
              Card(
                  margin: EdgeInsets.zero,
                  clipBehavior: Clip.hardEdge,
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(40))),
                  child: SizedBox(
                    height: media(context).height * 0.3,
                    width: double.infinity,
                    child: Image.network(
                        fit: BoxFit.fill,
                        cacheHeight: 300,
                        rest.mainPhotoSrc!,
                        errorBuilder: (context, error, stackTrace) =>
                            const Center(
                                child: Icon(
                              Icons.error_outline_outlined,
                              color: Colors.red,
                            )),
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return Container(
                              color: Colors.white,
                              height: media(context).height * 0.3,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: Colors.indigo,
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              ),
                            );
                          }
                        }),
                  )),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: media(context).width * 0.92,
                            child: RichText(
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: '${rest.name}',
                                    style: texty1(
                                        size: 35.1,
                                        weight: FontWeight.w700,
                                        color: Colors.indigo),
                                  ),
                                ])),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Card(
                              color: Colors.indigo.shade200,
                              child: SizedBox(
                                width: media(context).width * 0.33,
                                height: 50,
                                child: Center(
                                  child: RichText(
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      text: TextSpan(children: [
                                        TextSpan(
                                          text: rest.currenciesAccepted!,
                                          style: texty1(
                                              size: 18.1,
                                              weight: FontWeight.w700,
                                              color: Colors.black54),
                                        ),
                                      ])),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Card(
                              color: Colors.indigo.shade100,
                              child: SizedBox(
                                width: media(context).width * 0.33,
                                height: 50,
                                child: Center(
                                  child: RichText(
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      text: TextSpan(children: [
                                        TextSpan(
                                          text:
                                              'price Rang\n${rest.priceRange} ',
                                          style: texty1(
                                              size: 18.1,
                                              weight: FontWeight.w700,
                                              color: Colors.black54),
                                        ),
                                      ])),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: media(context).width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                                flex: 3,
                                child: Card(
                                  color: Colors.indigo.shade200,
                                  child: SizedBox(
                                    height: 200,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Textinterval(
                                              intro: "Address :\n",
                                              value: rest.address!.country!,
                                            ),
                                            SizedBox(
                                              height: 50,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Textinterval(
                                                    intro: "local :\n",
                                                    value:
                                                        rest.address!.locality!,
                                                  ),
                                                  Textinterval(
                                                    intro: "Postal :\n",
                                                    value: rest
                                                        .address!.postalCode!,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Textinterval(
                                              intro: "street :\n",
                                              value: rest.address!.street!,
                                            ),
                                          ]),
                                    ),
                                  ),
                                )),
                            Expanded(
                                flex: 2,
                                child: Column(
                                  children: [
                                    Card(
                                      color: Colors.indigo.shade100,
                                      child: SizedBox(
                                        width: media(context).width * 0.33,
                                        height: 100,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Textinterval(
                                                intro: "Review :\n",
                                                value:
                                                    '${rest.aggregateRatings!.thefork!.reviewCount!}',
                                              ),
                                              const Icon(
                                                Icons.rate_review_outlined,
                                                size: 50,
                                                color: Colors.black45,
                                              )
                                            ]),
                                      ),
                                    ),
                                    Card(
                                      color: Colors.indigo.shade100,
                                      child: SizedBox(
                                        width: media(context).width * 0.33,
                                        height: 100,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Textinterval(
                                                intro: "Rate :\n",
                                                value:
                                                    '${rest.aggregateRatings!.thefork!.ratingValue!}',
                                              ),
                                              const Icon(
                                                Icons.star_border_outlined,
                                                size: 50,
                                                color: Colors.black45,
                                              )
                                            ]),
                                      ),
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Card(
                              color: rest.hasLoyaltyProgram!
                                  ? Colors.green.shade300
                                  : Colors.red.shade200,
                              child: SizedBox(
                                width: media(context).width * 0.33,
                                height: 75,
                                child: Center(
                                  child: RichText(
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      text: TextSpan(children: [
                                        TextSpan(
                                          text: 'Loyalty\nProgram ',
                                          style: texty1(
                                              size: 18.1,
                                              weight: FontWeight.w700,
                                              color: Colors.black54),
                                        ),
                                      ])),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Card(
                              color: rest.isBookable!
                                  ? Colors.green.shade300
                                  : Colors.red.shade200,
                              child: SizedBox(
                                width: media(context).width * 0.33,
                                height: 75,
                                child: Center(
                                  child: RichText(
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      text: TextSpan(children: [
                                        TextSpan(
                                          text: 'Bookable ',
                                          style: texty1(
                                              size: 18.1,
                                              weight: FontWeight.w700,
                                              color: Colors.black54),
                                        ),
                                      ])),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Card(
                              color: rest.isInsider!
                                  ? Colors.green.shade300
                                  : Colors.red.shade200,
                              child: SizedBox(
                                width: media(context).width * 0.33,
                                height: 75,
                                child: Center(
                                  child: RichText(
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      text: TextSpan(children: [
                                        TextSpan(
                                          text: 'Insider ',
                                          style: texty1(
                                              size: 18.1,
                                              weight: FontWeight.w700,
                                              color: Colors.black54),
                                        ),
                                      ])),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      endIndent: 30,
                      indent: 30,
                      color: Colors.indigo,
                    ),
                    SizedBox(
                        width: media(context).width * 0.93,
                        height: media(context).height * 0.15,
                        child: Card(
                          color: Colors.indigo.shade100,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    text: TextSpan(children: [
                                      TextSpan(
                                        text: 'Best Offer :',
                                        style: texty1(
                                            size: 20.1,
                                            weight: FontWeight.w700,
                                            color: Colors.black87),
                                      ),
                                    ])),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: media(context).width * 0.4,
                                      child: FittedBox(
                                        child: Text(
                                          maxLines: 2,
                                          rest.bestOffer!.name!.split('%')[1],
                                          style: texty1(
                                              size: 20.1,
                                              weight: FontWeight.w700,
                                              color: Colors.black54),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: media(context).width * 0.35,
                                      child: FittedBox(
                                        child: RichText(
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            text: TextSpan(children: [
                                              TextSpan(
                                                text: 'Discount :',
                                                style: texty1(
                                                    size: 16.1,
                                                    weight: FontWeight.w700,
                                                    color: Colors.black54),
                                              ),
                                              TextSpan(
                                                text:
                                                    '${rest.bestOffer!.label}',
                                                style: texty1(
                                                    size: 61.1,
                                                    weight: FontWeight.w500,
                                                    color:
                                                        OwnColors.secondColor),
                                              )
                                            ])),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )),
                    const SizedBox(
                      height: 80,
                    )
                  ]),
                ),
              )
            ],
          )),
    );
  }
}

class Textinterval extends StatelessWidget {
  const Textinterval(
      {super.key, required this.intro, required this.value, this.e});

  final String intro;
  final String value;
  final e;
  @override
  Widget build(BuildContext context) {
    return RichText(
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(children: [
          TextSpan(
            text: '${intro}',
            style: texty1(
                size: 16.1, weight: FontWeight.w700, color: Colors.black54),
          ),
          TextSpan(
            text: '${value}',
            style: texty1(
                size: 20.1,
                weight: FontWeight.w500,
                color: e == null ? Colors.white : Colors.indigo),
          )
        ]));
  }
}
