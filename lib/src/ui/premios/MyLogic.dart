import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/ui/premios/local.dart';

class MyLogic {
  ValueNotifier<List<local>> locales = ValueNotifier([]);
  void getlocals() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('locales').get();
    //forEach((result) {
    //  print(result.data());
    //});});
    locales.value = snapshot.docs.map((e) => local.fromMap(e)).toList();
    print('LOCALES....${locales.value.length}');
  }
}
