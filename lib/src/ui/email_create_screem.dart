import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/bloc/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailCreate extends StatefulWidget {
  static Widget create(BuildContext context) => EmailCreate();

  @override
  State<StatefulWidget> createState() => _EmailCreateState();
}

class _EmailCreateState extends State<EmailCreate> {
  int _paginaActual=0;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();
  String? emailValidator(String? value) {
    return (value == null || value.isEmpty) ? 'This is a required field' : null;
  }

  String? passwordValidator(String? value) {
    
    if (value == null || value.isEmpty) return 'This is a requerid';
    if (value.length < 6) return 'Password should be at last 6 letters';
    if (_passwordController.text != _repeatPasswordController.text)
      return 'Password do not match';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
      decoration: const BoxDecoration(
        image:DecorationImage(//  PONER UNA IMÁGEN DE FONDO
                    image: AssetImage('images/color2.jpg',),
                    fit: BoxFit.cover
                  ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Crear cuenta'),
          backgroundColor: Colors.green.shade500,
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          onTap: (index)=>setState(()=> _paginaActual=index),
           currentIndex: _paginaActual,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.person),label: 'login'),
            BottomNavigationBarItem(icon: Icon(Icons.supervised_user_circle),label: 'login')
          ],
          backgroundColor: Colors.green.shade500,
          ),
        body: BlocBuilder<AuthCubit, AuthState>(
          builder: (_, state) {
            return SafeArea(
                child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Center(
                  child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                onTap: ()=>FocusScope.of(context).unfocus(),
                child:ListView(
                  children: [
                    const Flexible(   //se define el logo
                child: Image(
                  image: AssetImage(
                    'images/logo (2).png',
                  ),
                  width: 150.0,
                  height: 150.0,
                ),
              ),
              const SizedBox(height: 10.0,width: double.infinity,),//se define nombre de la app
             
              const SizedBox(
                height: 10.0,
              ),
                    if (state is AuthSigningIn)
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                    if (state is AuthError)
                      Text(state.message,
                          style: const TextStyle(color: Colors.red, fontSize: 24)),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        icon:Icon(Icons.email),
                            labelText: 'Email',
                            hintText:'ejemplo@correo.com',
                        ),
                      validator: emailValidator,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: _passwordController,
                       obscureText:true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                            hintText:'Password',
                            icon: Icon(Icons.lock_outline),
                        ),
                      validator: passwordValidator,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: _repeatPasswordController,
                       obscureText:true,
                      decoration: const InputDecoration(
                        labelText: 'Repeat Password',
                            hintText:'Repeat Password',
                            icon: Icon(Icons.lock_outline),
                        ),
                      validator: passwordValidator,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child:_buttonRegister()
                      ),
                    
                  ],
                ),
              ),)
            ))));
          },
        ),
      ),
    );
    
  }
  Widget _buttonRegister() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return ElevatedButton.icon(
          onPressed: (){
            if (_formKey.currentState?.validate() == true) {
              context
                  .read<AuthCubit>()
                  .createUserWithEmailAndPassword(
                      _emailController.text,
                      _passwordController.text);
            }
          },
          icon: const Icon(
            Icons.app_registration,
          ),
          label: const Text('Registrarse'),
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(150, 40),
            primary: Colors.green.shade500,
            shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50))
          )); 
    });
  }
  void ontabTapped(int index){
  }
}
