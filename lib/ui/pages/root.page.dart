import 'package:flutter/material.dart';
import 'package:sick_child/ui/pages/home.page.dart';
import 'package:sick_child/ui/pages/liaisonAuth.page.dart';
import 'package:sick_child/ui/pages/listeConsultation.page.dart';

class RootView extends StatefulWidget {
  const RootView({Key? key}) : super(key: key);

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.yellow),
      routes: {
        "/": (context) => const LiaisonPageAuth(),
        "/home": (context) => const HomePage(),
        "/consultation": (context) => const ListeConsultation()
      },
      initialRoute: '/',
    );
  }
}