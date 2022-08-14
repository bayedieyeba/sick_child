import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sick_child/ui/widgets/enfant.widget.dart';

class ListeConsultation extends StatelessWidget {
  const ListeConsultation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> enfants = [
      {
        "nom": "Bara fall",
        "age": 5,
      },
      {
        "nom": "Anta Seye",
        "age": 8,
      },
      {
        "nom": "Daba fall",
        "age": 4,
      },
      {
        "nom": "Matar Ba",
        "age": 3,
      },
      {
        "nom": "Louise Camara",
        "age": 9,
      },
      {
        "nom": "Cheikh Ndiaye",
        "age": 10,
      },
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Enfant en Consultation",
            style: GoogleFonts.acme(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.w800)),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return EnfantWidegt(
                    nom: enfants[index]["nom"],
                    age: enfants[index]["age"],
                    onAction: () {
                      Navigator.pushNamed(context, "/detailEnfant");
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    height: 5,
                  );
                },
                itemCount: enfants.length),
          )
        ],
      ),
    );
  }
}
