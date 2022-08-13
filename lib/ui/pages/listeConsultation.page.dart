import 'package:flutter/material.dart';

class ListeConsultation extends StatelessWidget {
  const ListeConsultation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Enfant en Consultation",
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
