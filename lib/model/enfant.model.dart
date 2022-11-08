class Enfant {
  String? nom;
  String? prenom;
  int? age;
  String? adresse;
  String? codeEnfant;
  String? telephoneParent;
  String? typeCancer;
  String? typeConsultation;
  double? montant;
  
  Enfant({this.nom,this.prenom,this.age,this.adresse,this.codeEnfant,this.telephoneParent,this.typeCancer,this.typeConsultation,this.montant});

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data["nom"] = nom;
    data["prenom"] = prenom;
    data['age'] = age;
    data['adresse'] = adresse;
    data['code'] = codeEnfant;
    data['telephoneParent'] = telephoneParent;
    data['typeCancer'] = typeCancer;
    data['typeConsultation'] = typeConsultation;
    data['montant'] = montant;
    return data;
  }

}