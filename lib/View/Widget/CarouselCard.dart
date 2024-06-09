import 'package:flutter/material.dart';

import '../../app/settings/Themes.dart';

//May Ibrahim

class CarouselCard extends StatelessWidget {
  final String? img;

  const CarouselCard({
    super.key,
    this.img,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Image.network(
                  fit: BoxFit.fill,
                  errorBuilder: (context, error, stackTrace) => Center(
                          child: const Icon(
                        Icons.error_outline_sharp,
                        color: Colors.red,
                      )),
                  img!,
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
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        ),
                      );
                    }
                  }),
            ],
          )),
    ));
  }
}
