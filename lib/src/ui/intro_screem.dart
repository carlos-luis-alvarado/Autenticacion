import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/bloc/auth_cubit.dart';
import 'package:flutter_application_1/src/navegation/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: use_key_in_widget_constructors
class IntroScreem extends StatelessWidget {
  static Widget create(BuildContext context) => IntroScreem();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Bienvenido'),
        backgroundColor: Colors.green.shade500,
        centerTitle: true,
      ),
      body: _LoginPage(),
    );
  }
}

class _LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? validator(String? value) {
    return (value == null || value.isEmpty) ? 'This is a required field' : null;
  }
  @override
  Widget build(BuildContext context){
    return Container(
       decoration: const BoxDecoration(
        image:DecorationImage(//  PONER UNA IMÁGEN DE FONDO
                    image: AssetImage('images/color2.jpg',),
                    fit: BoxFit.cover
                  ),
      ),
      child: SafeArea(
        child: Scaffold(
              backgroundColor: Colors.transparent, //COLOR DE FONDO
              body: Center(
              child:GestureDetector(
                onTap: ()=>FocusScope.of(context).unfocus(),
        child: ListView(
          padding: const EdgeInsets.all(24.0),
          children: [
            Image.asset(
              'images/logo (2).png',
              width: 150,
              height: 180,
            ),
            const SizedBox(
              height: 10.0,
              width: double.infinity,
            ),
                        
            const SizedBox(
              height: 5.0,
            ),
            BlocBuilder<AuthCubit, AuthState>(
              builder: (_, state) {
                return Form(
                    key: _formKey,
                    child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                    children: [
                      if (state is AuthSigningIn)
                        const Center(
                          child: CircularProgressIndicator(),
                        ),
                      if (state is AuthError)
                        Text(state.message,
                            style: const TextStyle(color: Colors.red, fontSize: 15)),
                      
                      TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            icon:Icon(Icons.email),
                            labelText: 'Email',
                            hintText:'ejemplo@correo.com',
                            ),
                          validator: validator,
                        ),

                      TextFormField(
                          controller: _passwordController,
                          obscureText:true,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            hintText:'Password',
                            icon: Icon(Icons.lock_outline),
                          ),
                          validator: validator,
                        ),
                        
                      const SizedBox(
                        height: 5.0,
                        ),
                      Center(
                        child: ElevatedButton.icon(
                          icon:const Icon(Icons.input_outlined,),
                          label:const Text('Ingresar'),
                          onPressed: () {
                            if (_formKey.currentState?.validate() == true) {
                              context
                                  .read<AuthCubit>()
                                  .signInUserWithEmailAndPassword(
                                      _emailController.text,
                                      _passwordController.text);
                            }},
                          style: ElevatedButton.styleFrom(
                          fixedSize: const Size(150, 30),
                          primary: Colors.green.shade500,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)))),
                      ),
                      const Text('ingresar con'),
                    ]
                      )
                    )
                  );
              }
            ),
                  
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Column(
                children: [
                  SizedBox(
                    width: 250,
                    height: 60,
                      child: _redesSociales(),
                    ),
                  
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton.icon(
                          icon:const Icon(Icons.input_outlined,),
                          label:const Text('Crear cuenta'),
                          onPressed: () {
                             context.read<AuthCubit>().reset();
                      Navigator.pushNamed(context, Routes.createAccount);},
                          style: ElevatedButton.styleFrom(
                          fixedSize: const Size(150, 30),
                          primary: Colors.green.shade500,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40))))
                ],
              ),
            )
          ],
        ),)))
      ),
    );
  }
  _redesSociales() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {   
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _LoginButton(
                  //text: 'Ingresar de forma anonima',
                  imagePath: 'images/anonimo.png',
                  color: Colors.grey.shade700,
                  colorText: Colors.white,
                  onTap: () => context.read<AuthCubit>().signInAnonymously(),
                ),
               
                _LoginButton(
                  //text: 'Ingresar con Google',
                  imagePath: 'images/gmail.png',
                  color: Colors.white,
                  colorText: Colors.black,
                  onTap: () => context.read<AuthCubit>().signInWithGoogle(),
                ),
               
                _LoginButton(
                    //text: 'Ingresar  con Facebook',
                    imagePath: 'images/facebook.png',
                    color: Colors.lightBlue.shade900,
                    colorText: Colors.white,
                    onTap: () =>
                        context.read<AuthCubit>().signInWithFacebook()),
        ],
      );
    });
  }
}

class _LoginButton extends StatelessWidget {
  //final String text;
  final String imagePath;
  final Color color;
  final Color colorText;
  final VoidCallback? onTap;

  const _LoginButton({
    Key? key,
   // required this.text,
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
      borderRadius: const BorderRadius.all(Radius.circular(100)),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Image.asset(
                imagePath,
                width: 35,
                height: 35,
              ),
              const SizedBox(
                width: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }  
}
