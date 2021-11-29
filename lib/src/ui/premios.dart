import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/navegation/routes.dart';
import 'package:flutter_application_1/src/ui/premios/MyLogic.dart';
import 'package:flutter_application_1/src/ui/premios/local.dart';

class premios extends StatefulWidget { 
  static Widget create(BuildContext context) => premios();
  @override
  _premiosState createState() => _premiosState();
}

class _premiosState extends State<premios> {
  final myLogic=MyLogic();
  @override
  void initState(){
    myLogic.getlocals();
    super.initState();
  }
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
      body:ValueListenableBuilder<List<local>>(
        valueListenable: myLogic.locales,
        builder:(context,locales,_) {
           return locales!=[]? ListView.builder(
              itemCount:locales.length,
              itemBuilder:(_,index){
            return GestureDetector(
              onTap: () {
                showDialogFunc(context, locales[index].imagen, locales[index].nombre, locales[index].descripcion);
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
                            Container(
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
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width * 10.0,
            height: 400,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.network(
                        images,
                        width: 150,
                        height: 150,
                        ),
                     ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(nom,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    desc,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
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
