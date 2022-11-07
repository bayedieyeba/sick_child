import 'package:flutter/material.dart';

class DetailEnfant extends StatelessWidget {
  String? nom;
  String? prenom;
  String? addresse;
  String? telephoneParent;
  String? code;
  DetailEnfant({Key? key, this.code,this.addresse,this.nom,this.prenom,this.telephoneParent}) : super(key: key) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text("$prenom $nom $code"),
      ),
      body: Container(),
    );
  }
}
