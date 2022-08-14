import 'package:flutter/material.dart';

class EnfantWidegt extends StatelessWidget {
  final String nom;
  final int age;
  final Function onAction;
  const EnfantWidegt({
    Key? key,
    required this.nom,
    required this.age,
    required this.onAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onAction(),
      child: Container(
        padding: const EdgeInsets.only(left: 8.0),
        height: 100.0,
        color: const Color.fromARGB(255, 135, 123, 7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CircleAvatar(
              radius: 40.0,
              backgroundImage: AssetImage("images/iconEnfant.png"),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(nom),
            const SizedBox(
              width: 10.0,
            ),
            Text("$age ans"),
            const SizedBox(
              width: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
