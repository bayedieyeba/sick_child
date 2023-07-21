// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
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
              child: imageProfile(context)
              // Row(
              //   children: [
              //     const CircleAvatar(
              //       radius: 40.0,
              //       backgroundImage: AssetImage("images/baye.jpg"),
              //     ),
              //     const SizedBox(
              //       width: 10.0,
              //     ),
              //     Text(
              //       "Baye Dieye BA",
              //       style: GoogleFonts.acme(
              //           fontSize: 20, fontWeight: FontWeight.bold),
              //     ),
              //     const SizedBox(
              //       width: 10.0,
              //     ),

              //   ],
              // ),
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

  Widget bottomSheet(BuildContext context) {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          const Text(
            "Choisir photo profile",
            style: TextStyle(fontSize: 20.0),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                onPressed: () {
                  // prendrePhoto(ImageSource.camera);
                },
                icon: const Icon(Icons.camera),
                label: const Text("Camera"),
              ),
              TextButton.icon(
                onPressed: () {
                  //prendrePhoto(ImageSource.gallery);
                },
                icon: const Icon(Icons.image),
                label: const Text("image"),
              )
            ],
          )
        ],
      ),
    );
  }

//  void prendrePhoto(ImageSource source) async {
//     final pickedFile = await _picker.getImage(source: source);
//     setState(() {
//       _imageFile = pickedFile!;
//     });
//   }

  Widget imageProfile(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
              radius: 70.0,
              backgroundImage: AssetImage(
                  "images/baye.jpg") //_imageFile == null ? AssetImage("images/baye.jpg"):FileImage(File(_imageFile.path)),
              ),
          Positioned(
              bottom: 10.0,
              right: 20.0,
              child: InkWell(
                onTap: () {
                  // showModalBottomSheet(
                  //     context: context,
                  //     builder: ((builder) => bottomSheet(context)));
                },
                child: const Icon(
                  Icons.camera_alt,
                  color: Colors.teal,
                  size: 28.0,
                ),
              ))
        ],
      ),
    );
  }
}
