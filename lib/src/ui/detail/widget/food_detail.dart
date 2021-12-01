import 'package:flutter/material.dart';

import '../../../model/food.dart';
import '../../constantes/colores.dart';

class FoodDetail extends StatelessWidget {
  final Food food;
  FoodDetail(this.food);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      color: Colors.white,
      child: Column(
        children: [
          Text(
            food.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          SizedBox(height: 15),
          Text(
            food.desc,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.blueGrey.withOpacity(0.9),
            ),
          ),
          SizedBox(height: 15),
          Text(
            food.region,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.blueGrey.withOpacity(0.9),
            ),
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Text("Productos",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ))
            ],
          ),
          SizedBox(height: 10),
          Container(
            height: 150,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Column(children: [
                        Image.asset(
                          food.direccion[index].values.first,
                          width: 52,
                          height: 52,
                        ),
                        Text(food.direccion[index].keys.first),
                      ]),
                    ),
                separatorBuilder: (_, index) => SizedBox(width: 15),
                itemCount: food.direccion.length),
          )
        ],
      ),
    );
  }
}
