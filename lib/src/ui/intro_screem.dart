import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/bloc/auth_cubit.dart';
import 'package:flutter_application_1/src/navegation/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:page_indicator/page_indicator.dart';

class IntroScreem extends StatelessWidget {
  static Widget create(BuildContext context) => IntroScreem();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: Text('Bienvenido'),
        backgroundColor: Colors.green.shade700,
      ),
      body: _LoginPage(),
    );
  }
}

class _IntroPager extends HookWidget {
  final String exampleText =
      'Lorem ipsum dolor sit amet. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum';

  @override
  Widget build(BuildContext context) {
    final isSigningIn = context.watch<AuthCubit>().state is AuthSigningIn;
    // TODO: implement build
    return AbsorbPointer(
      absorbing: isSigningIn,
      child: PageIndicatorContainer(
        child: PageView(
          children: [
            _DescriptionPage(
                text: exampleText, imagePath: 'assets/Imagen1.jpg'),
            _DescriptionPage(
                text: exampleText, imagePath: 'assets/Imagen2.jpg'),
            _DescriptionPage(
                text: exampleText, imagePath: 'assets/Imagen3.jpg'),
            _LoginPage(),
          ],
        ),
        length: 4,
        //align: IndicatorAlign.bottom,
        //indicatorSpace: 12,
        //indicatorColor: Colors.green,
      ),
    );
  }
}

class _DescriptionPage extends StatelessWidget {
  final String text;
  final String imagePath;

  const _DescriptionPage({
    Key? key,
    required this.text,
    required this.imagePath,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(24.0),
      child: Column(
        children: [
          Image.asset(
            imagePath,
            width: 300,
            height: 300,
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          )
        ],
      ),
    );
  }
}

class _LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final isSigningIn = context.watch<AuthCubit>().state is AuthSigningIn;
    return Container(
      padding: EdgeInsets.all(24.0),
      child: Column(
        children: [
          Image.asset(
            'assets/crearlogo.png',
            width: 150,
            height: 150,
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text('AVJujuy',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    //fontFamily: 'Architects Daughter',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
          if (isSigningIn) CircularProgressIndicator(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              children: [
                _LoginButton(
                  text: 'Ingresar de forma anonima',
                  imagePath: 'assets/anonimo.png',
                  color: Colors.grey.shade700,
                  colorText: Colors.white,
                  onTap: () => context.read<AuthCubit>().signInAnonymously(),
                ),
                SizedBox(
                  height: 15,
                ),
                _LoginButton(
                  text: 'Ingresar con Google',
                  imagePath: 'assets/gmail.png',
                  color: Colors.white,
                  colorText: Colors.black,
                  onTap: () => context.read<AuthCubit>().signInWithGoogle(),
                ),
                SizedBox(
                  height: 15,
                ),
                _LoginButton(
                    text: 'Ingresar  con Facebook',
                    imagePath: 'assets/facebook.png',
                    color: Colors.lightBlue.shade900,
                    colorText: Colors.white,
                    onTap: () =>
                        context.read<AuthCubit>().signInWithFacebook()),
                SizedBox(
                  height: 15,
                ),
                _LoginButton(
                  text: 'Ingresar con Email',
                  imagePath: 'assets/email.png',
                  color: Colors.white,
                  colorText: Colors.black,
                  onTap: () {
                    context.read<AuthCubit>().reset();
                    Navigator.pushNamed(context, Routes.signInEmail);
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                OutlinedButton(
                  onPressed: () {
                    context.read<AuthCubit>().reset();
                    Navigator.pushNamed(context, Routes.createAccount);
                  },
                  child: Text('Crear cuenta'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  final String text;
  final String imagePath;
  final Color color;
  final Color colorText;
  final VoidCallback? onTap;

  const _LoginButton({
    Key? key,
    required this.text,
    required this.imagePath,
    this.onTap,
    this.color = Colors.blue,
    this.colorText = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      elevation: 3,
      borderRadius: BorderRadius.all(Radius.circular(5)),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              Image.asset(
                imagePath,
                width: 25,
                height: 25,
              ),
              SizedBox(
                width: 20,
              ),
              Text(text,
                  style:
                      TextStyle(color: colorText, fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ),
    );
  }
}
