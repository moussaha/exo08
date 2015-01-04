part of model_contact.dart;

class Personne { 
  // Les propriétés de la personne: 
  String _name, _email, _phone, _number, _adress; 
 
  String get name => _name;
  set name(value) { 
    if (value != null && !value.isEmpty) _name = value; 
  } 
 
  String get email => _email; 
  set email(value) { 
    if (value != null && !value.isEmpty) _email = value; 
  } 
  
  String get phone => _phone; 
    set phone(value) { 
      if (value != null && !value.isEmpty) _phone = value; 
    } 

   String get adress => _adress; 
     set adress(value) { 
      if (value != null && !value.isEmpty) _adress = value; 
        } 

   String get number => _number; 
     set number(value) { 
      if (value != null && !value.isEmpty) _number = value; 
           } 
     
  Personne.fromJson(Map json) { 
      this.name = json["name"]; 
      this.phone = json["phone"]; 
      this.email = json["email"]; 
      this.adress = json["adress"];
      this.number = json["number"]; 
} 

  Map<String, Object> toJson() {
    var per = new Map<String, Object>(); 
    per["name"] = name;
    per["phone"] = phone;
    per["email"] = email;
    per["adress"] = adress;
    per["number"] = number;
 
    return per;
  }
  
  // constructeur: 
  Personne(name, email, phone, date_birth) { 
    this.name = name; 
    this.email = email; 
    this.phone = phone; 
    this.adress = adress;
    this.number = number;


  } 
  String toString() => 'Personne: $name, $email'; 
} 
