import 'package:flutter/material.dart';

import '../../../model/food.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../constantes/colores.dart';
import 'food_detail.dart';
import 'food_img.dart';

class DetailPage extends StatelessWidget {
  final Food food;
  DetailPage(this.food);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackground,
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(
                Icons.arrow_back_ios_outlined,
                Icons.favorite_outlined,
                leftCallback: () => Navigator.of(context).pop(),
              ),
              FoodImg(food),
              FoodDetail(
                food,
              ),
            ],
          ),
        ));
  }
}
