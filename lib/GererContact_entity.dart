part of model_contact.dart;

class GererContact { 
  String _numero; 
  Personne proprietaire; 
  int _pin_code; 
  final DateTime date_created; 
  

  String get numero => _number; 
  set numero(value) { 

    if (value == null || value.isEmpty) 
        throw new ArgumentError("Pas de valeur de No retournée"); 
    
    // Tester le formatage
    var exp = new RegExp(r"[0-9]{3}-[0-9]{7}-[0-9]{2}"); 
    if (exp.hasMatch(value)) _number = value; 
  } 

   
  GererContact.fromJson(Map json):  date_created = DateTime.parse(json["creation_date"]) { 
      this.numero = json["numero"]; 
      this.proprietaire = new Personne.fromJson(json["proprietaire"]); 
      this.date_modified = DateTime.parse(json["modified_date"]); 
    } 
  GererContact.fromJsonString(String jsonString): this.fromJson(JSON.decode(jsonString)); 

 
  Map<String, Object> toJson() {
    var acc = new Map<String, Object>();
    acc["numero"] = numero;
    acc["proprietaire"] = proprietaire.toJson();
    acc["creation_date"] = date_created.toString();
    return acc;
  }
  
  // constructeurs: 
  GererContact(this.proprietaire, numero): date_created = new DateTime.now() { 
    this.numero = numero; 
    date_modified = date_created;
  } 

  String toString() => 'Gestion Contact par $proprietaire avec numero $numero'; 
} 