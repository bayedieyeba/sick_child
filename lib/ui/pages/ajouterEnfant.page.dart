// ignore_for_file: prefer_const_literals_to_create_immutables, avoid_print
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const List<String> list = <String>['CONSULTATION', 'HOSPITALISATION'];

class AjouterEnfant extends StatefulWidget {
  @override
  State<AjouterEnfant> createState() => _AjouterEnfantState();
}

class _AjouterEnfantState extends State<AjouterEnfant> {
  String dropdownValue = list.first;
  String prenom = "";
  String nom = "";
  int age = 0;
  String adresse = "";
  String typeCancer = "";
  String telephoneParent = "";
  String codeEnfant = "";
  String status = "";
  final _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Informations de l'enfant",
            style: GoogleFonts.acme(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(10),
              child: Form(
                key: _keyForm,
                child: Column(children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Prenom de l'enfant",
                      hintText: "Prenom de l'enfant",
                    ),
                    validator: (val) =>
                        val!.isEmpty ? 'Entrez un prenom' : null,
                    onChanged: (val) => prenom = val,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Nom de l' enfant",
                      hintText: "Nom de l'enfant",
                    ),
                    validator: (val) => val!.isEmpty ? 'Entrez un nom' : null,
                    onChanged: (val) => nom = val,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Age de l'enfant",
                      hintText: "Age de l'enfant",
                    ),
                    validator: (val) =>
                        val!.isEmpty ? 'Entrez age enfant' : null,
                    onChanged: (val) => age = int.parse(val),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Adesse de l'enfant",
                      hintText: "Adresse de l'enfant",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Numero de téléphone du parent",
                      hintText: "Numéro de téléphone du parent",
                    ),
                    validator: (val) =>
                        val!.isEmpty ? 'Entrez le numero de téléphone' : null,
                    onChanged: (val) => telephoneParent = val,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Type cancer",
                      hintText: "Type de cancer",
                    ),
                    validator: (val) =>
                        val!.isEmpty ? 'Entrez le type de cancer' : null,
                    onChanged: (val) => typeCancer = val,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Code enfant ",
                      hintText: "Entrer le code de l'enfant",
                    ),
                    validator: (val) =>
                        val!.isEmpty ? 'Entrer le code de enfant' : null,
                    onChanged: (val) => codeEnfant = val,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DropdownButton<String>(
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        dropdownValue = value!;
                        status = value;
                      });
                    },
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  TextButton(
                    onPressed: () {
                      if (_keyForm.currentState!.validate()) {
                        codeEnfant = telephoneParent + prenom;
                        _addChild(prenom, nom, age, adresse, telephoneParent,
                            typeCancer, codeEnfant, status);

                        // Navigator.pop(context);
                        // Navigator.pushNamed(context, "/home");
                      }
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.blue,
                      onSurface: Colors.red,
                    ),
                    child: const Text("Enragistrer"),
                    // shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(20.0)),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                ]),
              )),
        ));
  }

  _addChild(
      String prenom,
      String nom,
      int age,
      String adresse,
      String telephoneParent,
      String typeCancer,
      String codeEnfant,
      String status) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    dynamic user = pref.get("user");
    print(pref.get("user"));
    try {
      var response = await http.post(
        Uri.parse('http://10.0.2.2:5000/api/enfant'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ' + user,
        },
        body: jsonEncode(<String, dynamic>{
          'firstName': nom,
          'lastName': prenom,
          'age': age,
          'address': adresse,
          'parentPhone': telephoneParent,
          'typeCancer': typeCancer,
          'codeEnfant': codeEnfant,
          'status': status,
        }),
      );
      print(response.body);
    } catch (e) {
      print(e);
    }
  }
}
