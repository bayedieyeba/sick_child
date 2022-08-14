import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AjouterEnfant extends StatelessWidget {
  const AjouterEnfant({Key? key}) : super(key: key);

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
      body: const SingleChildScrollView(),
    );
  }
}
