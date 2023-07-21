import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailEnfant extends StatelessWidget {
  String? nom;
  String? prenom;
  String? addresse;
  String? telephoneParent;
  String? code;
  double? monatnt;
  String? typeCancer;
  DetailEnfant(
      {Key? key,
      this.code,
      this.addresse,
      this.nom,
      this.prenom,
      this.telephoneParent,
      this.monatnt,
      this.typeCancer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("$prenom $nom "),
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("$code"),
                Text("$addresse"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("$telephoneParent"),
                Text("$monatnt"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("$typeCancer"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
