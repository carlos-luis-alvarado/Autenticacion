import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/ui/premios/local.dart';
import 'package:flutter_application_1/src/widgets/lugar.dart';

class ListLugares{

  ValueNotifier<List<lugar>>lugares=ValueNotifier([]);

  void getlugares()async{
    final snapshot= await FirebaseFirestore.instance.collection('JujuyLugares').get();
    lugares.value= snapshot.docs.map((e) => lugar.fromMap(e)).toList();
    print('LOCALES....${lugares.value.length}');
    }

}