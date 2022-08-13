import 'package:flutter/material.dart';
import 'package:sick_child/ui/pages/connexion.page.dart';
import 'package:sick_child/ui/pages/inscription.page.dart';

class LiaisonPageAuth extends StatefulWidget {
  const LiaisonPageAuth({Key? key}) : super(key: key);

  @override
  State<LiaisonPageAuth> createState() => _LiaisonPageAuthState();
}

class _LiaisonPageAuthState extends State<LiaisonPageAuth> {
  bool affichagePageConnexion = true;
  void basculation() {
    setState(() => affichagePageConnexion = !affichagePageConnexion);
  }

  @override
  Widget build(BuildContext context) {
    if (affichagePageConnexion) {
      return ConnexionPage(basculation: basculation);
    } else {
      return InscriptionPage(basculation: basculation);
    }
  }
}
