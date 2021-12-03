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
                        ElevatedButton(
                            onPressed: () {
                              showDialogFun(context, food.name);
                            },
                            child: const Text('Canjear'),
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(140, 40),
                                primary: Colors.green.shade500,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50))))
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

showDialogFun(context, name) {
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
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width * 7.0,
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(name,
                      style: TextStyle(
                          color: Colors.blueGrey.shade600,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                      "El siguiente codigo sera enviado a su email como comprobante...",
                      style: TextStyle(
                          color: Colors.blueGrey.shade600,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Codigo: 0011BLM0900",
                    style: TextStyle(
                      color: Colors.blueAccent.withOpacity(0.5),
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Valido hasta: 20/02/2022",
                      style: TextStyle(
                          color: Colors.blueAccent.withOpacity(0.3),
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        );
      });
}
