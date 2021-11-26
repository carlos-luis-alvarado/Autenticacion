import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CardSwiper extends StatelessWidget {
  final List<String> lugares;
  const CardSwiper({Key? key, required this.lugares})
      : super(key: key); //recibir lista

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.only(top:10.0),
      child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CarouselSlider(
              items: lugares
                  .map((item) => Container(
                        child: Center(
                          child: Image.network(
                            item,
                            fit: BoxFit.cover,
                            width: 20000,
                          ),
                        ),
                      ))
                  .toList(),
              options: CarouselOptions(
                autoPlay: true,
                height: 300,
                reverse: false,
                autoPlayInterval: Duration(seconds: 2),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        ),
    /*Container(
      padding: const EdgeInsets.only(top: 10.0),
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemWidth: _screenSize.width * 0.7,
        itemHeight: _screenSize.height * 0.5,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(
                lugares[index],
                fit: BoxFit.cover,
              ));
        },
        itemCount: lugares.length,
      ),*/
    );
  }
}
