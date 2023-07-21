import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sick_child/ui/pages/detailEnfant.page.dart';
class RecherchePage extends StatefulWidget {
  const RecherchePage({Key? key}) : super(key: key);

  @override
  State<RecherchePage> createState() => _RecherchePage();
}

class _RecherchePage extends State<RecherchePage> {
  String? query ;
  bool affiche =false;
  TextEditingController queryTextEditingController = new TextEditingController();
  dynamic data;
  void _search(String? query) {
    String url = "http://10.0.2.2:8083/api/enfants/$query";
    http.get(Uri.parse(url))
    .then((response) {
     setState(() {
        data = json.decode(response.body);
        print(data);
        if(data !=null){
          affiche = true;
        }
     });
    })
    .catchError((err){
      print(err);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding:const  EdgeInsets.all(10),
                    child: TextFormField(
                      onChanged: (value){
                        setState(() {
                          query = value;
                        });
                      },
                      controller: queryTextEditingController,
                    decoration:  InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(width: 1, color: Colors.yellow)
                  )
                              ),
                            ),),
                ),
                IconButton(
                  onPressed: (){
                    setState(() {
                      query = queryTextEditingController.text;
                      _search(query);

                    });
                    
                  },
                   icon:const  Icon(Icons.search, color: Colors.yellow, size: 35,),
                   )
                
              ],
            ),
          
           affiche ? GestureDetector(
              onTap: () => 
              Navigator.push(context,MaterialPageRoute(builder: (context)=>
              DetailEnfant(prenom: data['prenom'],nom: data['nom'],code: data['code'],addresse: data['adresse'],telephoneParent: data['telephoneParent'],monatnt: data['montant'],typeCancer: data['typeCancer'],))),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Row(
                      children: [
                        const CircleAvatar(
                        radius: 40.0,
                        backgroundImage: AssetImage("images/iconEnfant.png"),
                      ),
                      const SizedBox(width: 20,),
                        Text("${data['prenom']} ${data['nom']}"), 
                          
                      ],
                    ),
                    CircleAvatar(
                      child: Text("${data["age"]}"),
                    ) 
               ],
             ),
           ): Container()
          ],
        ),
      ),
    );
  }
}