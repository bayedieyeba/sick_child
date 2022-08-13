// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:sick_child/utils/app_color.dart';

class ConnexionPage extends StatefulWidget {
  final Function basculation;
  const ConnexionPage({Key? key, required this.basculation}) : super(key: key);

  @override
  State<ConnexionPage> createState() => _ConnexionPageState();
}

class _ConnexionPageState extends State<ConnexionPage> {
  String email = '';
  String motDePasse = '';

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
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: (val) => val!.isEmpty ? 'Entrez un email' : null,
                    onChanged: (val) => email = val,
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
                    onChanged: (val) => motDePasse = val,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  FlatButton(
                    onPressed: () {
                      if (_keyForm.currentState!.validate()) {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, "/home");
                      }
                    },
                    color: AppColor.primaryColor,
                    child: const Text("Connexion"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  OutlineButton(
                    onPressed: () {
                      widget.basculation();
                    },
                    borderSide:
                        const BorderSide(width: 1.0, color: Colors.black),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    child: const Text("Besoin d'un compte?"),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
