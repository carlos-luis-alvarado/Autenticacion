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
    double width = MediaQuery.of(context).size.width * 0.5;
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
              Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      width: 200,
                      child: ElevatedButton.icon(
                          onPressed: () {
                            showDialogFun(context, food.name);
                          },
                          icon: const Icon(
                            Icons.input_outlined,
                          ),
                          label: const Text('Canjear'),
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(140, 40),
                              primary: Colors.green.shade500,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))))))
            ],
          ),
        ));
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
