import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreem extends StatelessWidget {
  static Widget create(BuildContext context) => SplashScreem();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade300,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //CircularProgressIndicator(),
            SizedBox(
              height: 24,
            ),
            Image.asset(
              'assets/crearlogo.png',
              width: 200,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
