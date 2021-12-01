import 'package:flutter/material.dart';

import '../model/puntos.dart';
import '../ui/constantes/colores.dart';

class FoodList extends StatelessWidget {
  final int selected;
  final Function callback;
  final Puntos local;
  FoodList(this.selected, this.callback, this.local);

  @override
  Widget build(BuildContext context) {
    final category = local.locales.keys.toList();
    return Container(
        height: 100,
        padding: EdgeInsets.symmetric(vertical: 30),
        child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 25),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => GestureDetector(
                  onTap: () => callback(index),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: selected == index ? Colors.green : Colors.white,
                    ),
                    child: Text(
                      category[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            separatorBuilder: (_, index) => SizedBox(width: 20),
            itemCount: category.length));
  }
}
