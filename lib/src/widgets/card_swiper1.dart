import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_1/src/widgets/ListLugares.dart';
import 'package:flutter_application_1/src/widgets/lugar.dart';

class CardSwiper extends StatefulWidget {
  static Widget create(BuildContext context) => CardSwiper();
 // final List<String> lugares1;
  //const CardSwiper({Key? key, required this.lugares1, }): super(key: key); 
  @override
  State<CardSwiper> createState() => _CardSwiperState();
}

class _CardSwiperState extends State<CardSwiper> {

  final Lista=ListLugares();

  @override
  void initState(){
    Lista.getlugares();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(top:10.0),
      child: ValueListenableBuilder<List<lugar>>(
        valueListenable: Lista.lugares,
        builder:(context,lugares,_) {
           return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CarouselSlider(
              items: lugares.map((item) => GestureDetector(
                         onTap: () 
                          {showDialogFunc(context,item.imagen,item.descripcion,item.direccion,item.nombre);},///LLAMAMOS
                        child: Center(
                          child: Image.network(
                            item.imagen,
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
           ); 
           
        }
    )
  ) ;  }
}
  
showDialogFunc(context,imagen,descripcion,direccion,nombre) {
  return showDialog(
      context: context,
      builder: (context) {
        return Center(
            child: Material(
               type: MaterialType.transparency,
                child: Container(
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white,
                   ),
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 10.0,
                  height: 400,
                 child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                       ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.network(
                            imagen,//lugares[item].imagen,
                            width: 150,
                            height: 150,
                        ),
                     ),
                      const SizedBox(
                       height: 10,
                       ),
                       Text(nombre,
                        style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      )),
                       const SizedBox(
                        height: 10,
                      ),
                       Text(direccion,
                        style: const TextStyle(
                        fontSize: 15,
                         color: Colors.black,
                       )),
                        const SizedBox(
                        height: 10,
                      ),
                       Text(descripcion,
                        style: const TextStyle(
                        fontSize: 15,
                         color: Colors.black,
                       )),
                ]),
          ),
        ));
   });
}

