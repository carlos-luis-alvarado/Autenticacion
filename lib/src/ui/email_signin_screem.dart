import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/bloc/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailSignIn extends StatefulWidget {
  static Widget create(BuildContext context) => EmailSignIn();

  @override
  State<StatefulWidget> createState() => _EmailSignIn();
}

class _EmailSignIn extends State<EmailSignIn> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? validator(String? value) {
    return (value == null || value.isEmpty) ? 'This is a required field' : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ingresar'),
      ),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (_, state) {
          return Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  if (state is AuthSigningIn)
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                  if (state is AuthError)
                    Text(state.message,
                        style: TextStyle(color: Colors.red, fontSize: 24)),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                    validator: validator,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(labelText: 'Password'),
                    validator: validator,
                  ),
                  Center(
                    child: ElevatedButton(
                      child: Text('Sign In'),
                      onPressed: () {
                        if (_formKey.currentState?.validate() == true) {
                          context
                              .read<AuthCubit>()
                              .signInUserWithEmailAndPassword(
                                  _emailController.text,
                                  _passwordController.text);
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
