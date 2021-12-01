import 'package:flutter/material.dart';
import '../model/puntos.dart';
import '../ui/constantes/colores.dart';

class LocalesInfo extends StatelessWidget {
  final local = Puntos.generarCategorias();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 40),
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      local.name,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(local.desc)),
                        /*SizedBox(width: 10),
                        Text(local.puntos,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.withOpacity(0.4),
                            )),*/
                        /*SizedBox(width: 10),
                        Text(local.distance,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.withOpacity(0.4),
                            )),*/
                      ],
                    )
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(local.logourl, width: 80),
                )
              ],
            ),
            SizedBox(height: 5),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                '"${local.label}"',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.star_outline, color: kPrimaryColor),
                  Text(
                    '${local.score}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 15,
                  )
                ],
              )
            ])
          ],
        ));
  }
}
