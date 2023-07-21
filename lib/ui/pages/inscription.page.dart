// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class InscriptionPage extends StatefulWidget {
  final Function basculation;
  const InscriptionPage({Key? key, required this.basculation})
      : super(key: key);

  @override
  State<InscriptionPage> createState() => _InscriptionPageState();
}

class _InscriptionPageState extends State<InscriptionPage> {
  String nom = "";
  String prenom = "";
  String email = "";
  String tel = "";
  String motDePass = "";
  String confirmMotDePass = "";

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
          child: Form(
              key: _formKey,
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
                      "Créer un compte pour la suivi des enfants",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: "Nom", border: OutlineInputBorder()),
                    validator: (val) => val!.isEmpty ? 'Entrez un nom' : null,
                    onChanged: (val) => nom = val,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: "Prénom", border: OutlineInputBorder()),
                    validator: (val) =>
                        val!.isEmpty ? 'Entrez un prenom' : null,
                    onChanged: (val) => prenom = val,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: "Email", border: OutlineInputBorder()),
                    validator: (val) => val!.isEmpty ? 'Entrez un email' : null,
                    onChanged: (val) => email = val,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: "Télephone", border: OutlineInputBorder()),
                    validator: (val) =>
                        val!.isEmpty ? 'Entrez un numero telephone' : null,
                    onChanged: (val) => tel = val,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Mot de passe",
                      border: OutlineInputBorder(),
                    ),
                    validator: (val) => val!.length < 6
                        ? 'Entrez un mot de passe supérieur à 6'
                        : null,
                    onChanged: (val) => motDePass = val,
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Confirmez le mot de passe",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (val) => confirmMotDePass = val,
                    validator: (val) => confirmMotDePass != motDePass
                        ? 'Mot de passe ne correspond pas '
                        : null,
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // appliquer la logique
                        Navigator.pop(context);
                        Navigator.pushNamed(context, "/");
                      }
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.blue,
                      onSurface: Colors.red,
                    ),
                    child: const Text("S'inscrire"),
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
                    child: const Text("Déja un compte?"),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
