import 'package:flutter/material.dart';

import '../../models/Resturant.dart';

import '../../app/settings/Themes.dart';

//Rama Salouh
class ResturantCard extends StatelessWidget {
  const ResturantCard({
    super.key,
    required this.resturant,
  });
  final Resturant resturant;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
          height: media(context).height * 0.4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Image.network(
                        fit: BoxFit.fill,
                        errorBuilder: (context, error, stackTrace) =>
                            Icon(Icons.error_outline),
                        '${resturant.mainPhotoSrc}',
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          if (loadingProgress.expectedTotalBytes != null) {
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
                          return Container(
                            color: Colors.white,
                            height: media(context).height * 0.3,
                          );
                        })),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: SizedBox(
                            width: media(context).width * 0.6,
                            height: media(context).height * 0.05,
                            child: FittedBox(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                '${resturant.name}',
                                style: texty1(
                                    size: 20.1,
                                    weight: FontWeight.w700,
                                    color: OwnColors.thirdColor),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: SizedBox(
                            width: media(context).width * 0.2,
                            child: FittedBox(
                              child: Text(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                'Price R :${resturant.priceRange}',
                                style: texty1(
                                    size: 14.1,
                                    weight: FontWeight.w700,
                                    color: Colors.black54),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // const SizedBox(
                    //   height: 5,
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: media(context).width * 0.3,
                            child: FittedBox(
                              child: Text(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                'currencie : ${resturant.currenciesAccepted}',
                                style: texty1(
                                    size: 18.1,
                                    weight: FontWeight.w700,
                                    color: Colors.black54),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: media(context).width * 0.5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    resturant.aggregateRatings!.tripadvisor!
                                                .ratingValue ==
                                            null
                                        ? '0.0'
                                        : resturant.aggregateRatings!
                                                .tripadvisor!.ratingValue is int
                                            ? '${resturant.aggregateRatings!.tripadvisor!.ratingValue}.0'
                                            : '${resturant.aggregateRatings!.tripadvisor!.ratingValue}',
                                    style: texty1(
                                        size: 18.1,
                                        weight: FontWeight.w700,
                                        color: Colors.black54)),
                                const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
