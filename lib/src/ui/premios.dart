import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/navegation/routes.dart';

class premios extends StatefulWidget {
  static Widget create(BuildContext context) => premios();
  @override
  _premiosState createState() => _premiosState();
}

class _premiosState extends State<premios> {
  var images = [
    "images/descarga.jfif",
    "images/golosinas.jpg",
    "images/bueñuelos.jpeg",
    "images/bebidas.jfif",
    "images/comida.jpg",
  ];

  var nom = [
    "¡Helados!\n",
    "¡Golosinas!\n",
    "¡Buñuelos, bollos y otros!\n",
    "¡Gaseosas!\n",
    "¡Restaurantes!\n",
  ];

  var desc = [
    "Por 100 puntos obtenes 20% de descuento en heladeria Grido de la Region Quebrada!\n",
    "Por 100 puntos obtenes 15% de descuento en Golosinas del Local XX Region Quebrada!\n",
    "Por 100 puntos obtenes 30% de descuento en Meriendas del Local XX de la Region Quebrada!\n",
    "Por 100 puntos obtenes 20% de descuento en bebidas del Local XX de la Region Quebrada!\n",
    "Por 100 puntos obtenes 20% de descuento en almuerzo/cena del restarante XX de la Region Quebrada!\n",
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.5;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '¡Reclama tu premio!',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Architects Daughter',
            fontSize: 25.0,
          ),
        ),
        backgroundColor: Colors.yellow.shade500,
      ),
      backgroundColor: Colors.yellow.shade200,
      body: ListView.builder(
          itemCount: images.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                showDialogFunc(context, images[index], nom[index], desc[index]);
              },
              child: Card(
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(40.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 80.0,
                        height: 80.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.asset(images[index]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              nom[index],
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              width: width,
                              child: Text(
                                desc[index],
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
          }),
    );
  }
}

showDialogFunc(context, images, nom, desc) {
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
            width: MediaQuery.of(context).size.width * 10.0,
            height: 400,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(
                      images,
                      width: 150,
                      height: 150,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(nom,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    desc,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.entregaP);
                    },
                    icon: const Icon(
                      Icons.access_alarm,
                    ),
                    label: const Text('Reclamar premio'),
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(200, 30),
                        primary: Colors.lightBlue.shade800,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        )),
                  )
                ]),
          ),
        ));
      });
}
