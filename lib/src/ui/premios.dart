import 'package:flutter/material.dart';
import '../model/puntos.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/food_list.dart';
import '../widgets/food_list_view.dart';
import '../widgets/locales.dart';
import 'constantes/colores.dart';

class premios extends StatefulWidget {
  static Widget create(BuildContext context) => premios();
  @override
  _premiosState createState() => _premiosState();
}

class _premiosState extends State<premios> {
  var selected = 0;
  final pageController = PageController();
  final local = Puntos.generarCategorias();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.5;
    return Scaffold(
      backgroundColor: kBackground,
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomAppBar(
              Icons.arrow_back_ios_outlined,
              Icons.search_outlined,
            ),
            LocalesInfo(),
            FoodList(
              selected,
              (int index) {
                setState(() {
                  selected = index;
                });
                pageController.jumpToPage(index);
              },
              local,
            ),
            Expanded(
                child: FoodListView(
              selected,
              (int index) {
                setState(() {
                  selected = index;
                });
              },
              pageController,
              local,
            ))
<<<<<<< HEAD
          ]),
    );
=======
          ]));
/*
              child: Card(
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(40.0),
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 80.0,
                        height: 80.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.network(locales[index].imagen),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              locales[index].nombre,
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              width: width,
                              child: Text(
                                locales[index].descripcion,
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          ):const Center(child: CircularProgressIndicator(),);
        },)
>>>>>>> 42d23411be660c11c2b455825d418a2bad2ede4f
    );*/
>>>>>>> 36ecca1a45f73a92dd01769d6207bebe9422954c
  }
}