import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDrawerHeader extends StatelessWidget {
  const MyDrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
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
              style:
                  GoogleFonts.acme(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 10.0,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit),
            )
          ],
        ));
  }
}
