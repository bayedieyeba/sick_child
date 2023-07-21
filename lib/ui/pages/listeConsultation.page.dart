import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:sick_child/ui/pages/detailEnfant.page.dart';

class ListeConsultation extends StatefulWidget {
  ListeConsultation({Key? key}) : super(key: key);

  @override
  State<ListeConsultation> createState() => _ListeConsultationState();
}

class _ListeConsultationState extends State<ListeConsultation> {
  TextEditingController queryTextEditingController =
      new TextEditingController();

  dynamic data;
  @override
  void initState() {
    super.initState();
    String url =
        "http://10.0.2.2:8083/api/enfants/consultation?typeConsulatation=CONSULTATION";
    http.get(Uri.parse(url)).then((response) {
      setState(() {
        data = json.decode(response.body);
      });
    }).catchError((err) {
      print(err);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("En Consultation",
              style: GoogleFonts.acme(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w800)),
        ),
        body: Center(
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/recherche");
                },
                child: Container(
                  color: Colors.yellow,
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: const Text(
                    'Rechercher enfant',
                    style: TextStyle(color: Colors.black, fontSize: 15.0),
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                          height: 2,
                          color: Colors.yellow,
                        ),
                    itemCount: (data == null) ? 0 : data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailEnfant(
                                      prenom: data[index]['prenom'],
                                      nom: data[index]['nom'],
                                      code: data[index]['code'],
                                      addresse: data[index]['adresse'],
                                      telephoneParent: data[index]
                                          ['telephoneParent'],
                                      monatnt: data['montant'],
                                      typeCancer: data['typeCancer'])));
                        },
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const CircleAvatar(
                                  radius: 40.0,
                                  backgroundImage:
                                      AssetImage("images/iconEnfant.png"),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                    "${data[index]['prenom']} ${data[index]['nom']}"),
                              ],
                            ),
                            CircleAvatar(
                              child: Text("${data[index]["age"]}"),
                            )
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ));
  }
}
