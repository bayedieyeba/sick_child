// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sick_child/utils/app_color.dart';
const List<String> list = <String>['CONSULTATION', 'HOSPITALISATION'];
class AjouterEnfant extends StatefulWidget {
  
  @override
  State<AjouterEnfant> createState() => _AjouterEnfantState();
}

class _AjouterEnfantState extends State<AjouterEnfant> {
  String dropdownValue = list.first;
  String prenom = "";
  String nom = "";
  String age = "" ;
  String adresse = "";
  String typeCancer = "";
  String telephoneParent = "";
  String typeConsulatation = "";
  String codeEnfant = "";
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
      body:  SingleChildScrollView(
        child: Container(
           padding:const  EdgeInsets.all(10),
            child: Form(
              key: _keyForm,
              child: Column(
                children: [
                    TextFormField(  
                      decoration: const InputDecoration(  
                        border: OutlineInputBorder(),  
                        labelText: "Prenom de l'enfant",  
                        hintText: "Prenom de l'enfant",  
                      ),  
                      validator: (val) => val!.isEmpty ? 'Entrez un prenom' : null,
                    onChanged: (val) => prenom = val,
                    ),
                   const  SizedBox(height: 10,),
                    TextFormField(  
                      decoration: const InputDecoration(  
                        border: OutlineInputBorder(),  
                        labelText: "Nom de l' enfant",  
                        hintText: "Nom de l'enfant",  
                      ),
                      validator: (val) => val!.isEmpty ? 'Entrez un nom' : null,
                    onChanged: (val) => nom = val,  
                    ),
                   const  SizedBox(height: 10,),
                    TextFormField(  
                      keyboardType: TextInputType.number, 
                      decoration: const InputDecoration(  
                        border: OutlineInputBorder(), 
                        labelText: "Age de l'enfant",  
                        hintText: "Age de l'enfant",  
                      ), 
                      validator: (val) => val!.isEmpty ? 'Entrez age enfant' : null,
                    onChanged: (val) => age = val,  
                    ),
                   const  SizedBox(height: 10,),
                   const  TextField(  
                      decoration: InputDecoration(  
                        border: OutlineInputBorder(),  
                        labelText: "Adesse de l'enfant",  
                        hintText: "Adresse de l'enfant",  
                      ),  
                    ),
                    const SizedBox(height: 10,),
                    TextFormField( 
                      keyboardType: TextInputType.number, 
                      decoration: const InputDecoration(  
                        border: OutlineInputBorder(),  
                        labelText: "Numero de téléphone du parent",  
                        hintText: "Numéro de téléphone du parent",  
                      ), 
                      validator: (val) => val!.isEmpty ? 'Entrez le numero de téléphone' : null,
                    onChanged: (val) => telephoneParent = val,  
                    ),
                    
                    const SizedBox(height: 10,),
                    TextFormField(  
                      decoration: const InputDecoration(  
                        border: OutlineInputBorder(),  
                        labelText: "Type cancer",  
                        hintText: "Type de cancer",  
                      ),
                      validator: (val) => val!.isEmpty ? 'Entrez le type de cancer' : null,
                    onChanged: (val) => typeCancer = val, 
                    ),
                   const  SizedBox(height: 10,),
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
                      typeConsulatation = value;
                    });
                  },
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                    ),
                     FlatButton(
                      onPressed: () {
                      if (_keyForm.currentState!.validate()) {
                        print(prenom);
                        print(nom);
                        print(age);
                        print(typeConsulatation);
                        codeEnfant = telephoneParent+prenom;
                       _addChild(prenom,nom,age,adresse,telephoneParent,typeCancer,typeConsulatation,codeEnfant);
                  
                // Navigator.pop(context);
                // Navigator.pushNamed(context, "/home");
                      }
                      },
              color: AppColor.primaryColor,
              child: const Text("Enragistrer"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
                      ),
                      const SizedBox(
              height: 10.0,
                      ),
                     ] ),
            )      
            ),
      )
      );
   
  }
  
  void _addChild(String prenom, String nom, String age, String adresse, String telephoneParent, String typeCancer, String typeConsulatation, String codeEnfant) {}
  
}
