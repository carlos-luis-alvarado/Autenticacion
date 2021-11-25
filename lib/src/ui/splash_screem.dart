import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreem extends StatelessWidget {
  static Widget create(BuildContext context) => SplashScreem();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade300,
      body: const Center(
            child: Text('¡Bienvenidos!',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Architects Daughter',
                  fontSize: 35.0
                ),
              ),

        ),
    );
  }
}
