import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.yellow, Colors.black],
              ),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage("images/baye.jpg"),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  "Baye Dieye BA",
                  style: GoogleFonts.acme(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          ListTile(
            title: const Text("Ajouter Enfant"),
            leading: const Icon(Icons.add),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/ajouterEnfant");
            },
          ),
          const SizedBox(
            height: 10.0,
          ),
          ListTile(
            title: const Text("Paramettre"),
            leading: const Icon(Icons.settings),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/ajouterEnfant");
            },
          ),
        ],
      ),
    );
  }
}
