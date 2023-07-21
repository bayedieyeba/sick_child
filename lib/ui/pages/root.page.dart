import 'package:flutter/material.dart';
import 'package:sick_child/ui/pages/ajouterEnfant.page.dart';
import 'package:sick_child/ui/pages/detailEnfant.page.dart';
import 'package:sick_child/ui/pages/home.page.dart';
import 'package:sick_child/ui/pages/liaisonAuth.page.dart';
import 'package:sick_child/ui/pages/listeConsultation.page.dart';
import 'package:sick_child/ui/pages/listeHospitalisation.page.dart';
import 'package:sick_child/ui/pages/recherche.page.dart';
import 'package:sizer/sizer.dart';

class RootView extends StatefulWidget {
  const RootView({Key? key}) : super(key: key);

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.yellow),
        routes: {
          "/": (context) => const LiaisonPageAuth(),
          "/home": (context) => const HomePage(),
          "/consultation": (context) => ListeConsultation(),
          "/hospitalisation": (context) => ListeHospitalisation(),
          "/ajouterEnfant": (context) => AjouterEnfant(),
          "/detailEnfant": (context) => DetailEnfant(),
          "/recherche": (context) => const RecherchePage(),
        },
        initialRoute: '/',
      );
    });
  }
}
