// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ConnexionPage extends StatefulWidget {
  final Function basculation;
  const ConnexionPage({Key? key, required this.basculation}) : super(key: key);

  @override
  State<ConnexionPage> createState() => _ConnexionPageState();
}

class _ConnexionPageState extends State<ConnexionPage> {
  String login = '';
  String password = '';
  bool _isLoading = false;

  final _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
          child: Form(
              key: _keyForm,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    "images/logo.jpg",
                    height: 100.0,
                    width: 100.0,
                  ),
                  Center(
                    child: Text(
                      "Page de Connexion",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  _isLoading
                      ? const CircularProgressIndicator()
                      : const SizedBox(
                          height: 10.0,
                        ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: (val) => val!.isEmpty ? 'Entrez un email' : null,
                    onChanged: (val) => login = val,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Mot de passe',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                    validator: (val) =>
                        val!.isEmpty ? 'Entrez un mot de passe' : null,
                    onChanged: (val) => password = val,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextButton(
                    onPressed: () {
                      if (_keyForm.currentState!.validate()) {
                        _login(login, password);
                      }
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.blue,
                      onSurface: Colors.red,
                    ),
                    //color: AppColor.primaryColor,
                    child: const Text("Connexion"),
                    // shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(20.0)),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      side: BorderSide(
                        width: 2,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    onPressed: () {
                      widget.basculation();
                    },
                    child: const Text("Besoin d'un compte?"),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  _login(
    String login,
    String password,
  ) async {
    try {
      setState(() {
        _isLoading = true;
      });
      var response = await http.post(
        Uri.parse('http://10.0.2.2:5000/api/user/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'login': login,
          'password': password,
        }),
      );
      if (response.statusCode == 200) {
        setState(() {
          _isLoading = false;
        });

        SharedPreferences pref = await SharedPreferences.getInstance();
        await pref.setString("user", response.body);

        Navigator.pop(context);
        Navigator.pushNamed(context, "/home");
      } else {
        Fluttertoast.showToast(
          msg: 'Identifiants invalides',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
      }
    } catch (e) {
      print(e);
    }
  }
}
