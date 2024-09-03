import 'package:bloc_class01/bloc/bloc_bloc_prac.dart';
import 'package:bloc_class01/bloc/bloc_event_prac.dart';
import 'package:bloc_class01/bloc/bloc_state_prac.dart';

import 'package:bloc_class01/bloc/login_state.dart';
import 'package:bloc_class01/models/login_req_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      // Perform login action here
      print('Email: ${_userNameController.text}');
      print('Password: ${_passwordController.text}');
      var loginReqModel = LoginReqModel(
          username: _userNameController.text,
          password: _passwordController.text);
      BlocProvider.of<LoginBlocPractice>(context)
          .add(LoginRequestPracticeEvent(loginReqModel: loginReqModel));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: BlocBuilder<LoginBlocPractice, LoginStatePractice>(
            builder: (context, state) {
          if (state is InitialState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _userNameController,
                      decoration: const InputDecoration(
                        labelText: 'User Name',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Name';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _login,
                        child: const Text('Login'),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is LoadingStae) {
            return const Center(
              child: Text(
                "Loading",
                style: TextStyle(color: Colors.red),
              ),
            );
          } else if (state is LoadedStateq) {
            return Center(
              child: Text(state.loginResModel.email ?? ""),
            );
          } else if (state is ErrorStateq) {
            return Center(
              child: Text(state.errorMsg ?? ""),
            );
          } else {
            return Container();
          }
        }));
  }
}
