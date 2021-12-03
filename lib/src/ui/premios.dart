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
          ]),
    );
  }
}
