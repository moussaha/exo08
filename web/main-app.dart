import 'package:polymer/polymer.dart';
import 'model_contact.dart' show Contact;
import 'dart:html';
import 'dart:convert';


InputElement _name, _email, _phone, _number, _adress; 
ButtonElement btn_creer, btn_supprimer, btn_modifier; 

@CustomTag('contact')
class Contact_poly extends PolymerElement {
  @published Contact contact;
  
  Contact_poly.created(): super.created() {}
  
  List listContacts;
  String select, donnee; 
  SelectElement sel; 
  TableElement table; 
  GererContact _contact; 

  void main() {
    
     _name = querySelector('#_name'); 
    _email = querySelector('#_email'); 
    _number = querySelector('#_number');
    _phone = querySelector('#_phone'); 
    _adress = querySelector('#_adress');

    
    btn_creer = querySelector('#btn_creer');
    btn_supprimer = querySelector('#btn_supprimer');
    btn_modifier = querySelector('#btn_modifier');

      // Attacher les évènements : 
      // Vérifier si mes attributs sont vides ou non sur l'évènement onBlur: 
      _name.onBlur.listen(notEmpty); 
      _email.onBlur.listen(notEmpty); 
      _phone.onBlur.listen(notEmpty); 
      _number.onBlur.listen(notEmpty);
      _adress.onBlur.listen(notEmpty);
      
      // Créer, supprimer et modifier le contact: 
      btn_creer.onClick.listen(enregistrerDonnee); 
      btn_supprimer.onClick.listen(supprimerDonnee);
      btn_modifier.onClick.listen(ModifierContact);
      
      
  lireBDLocal();
  constructPage();
  sel.onChange.listen(voirContacts);
      
  }

  notEmpty(Event e) { 
        InputElement inel = e.currentTarget as InputElement; 
        var input = inel.value; 
        if (input == null || input.isEmpty) { 
         // window.alert("Tous les champs doivent être remplis ${inel.id}!"); 
          inel.focus(); 
        }
      } 
  

  enregistrerDonnee(Event e) { 
// Enregitrer données dans la BD local: 
  try { 
   window.localStorage["GererContact:${per.phone}"] = JSON.encode(contact.toJson()); 
   window.alert("Les données du contact sont stockées dans le navigateur."); 
  } on Exception catch (ex) { 
   window.alert("Donnée non stokée: La BD locale a été désactivée!"); 
    } 
  } 

  supprimerDonnee(Event e) => supprimer(); 

  supprimer() { 
    window.localStorage.remove("GererContact:${per.phone}");
    _name.value = ""; 
      _email.value = "";
       _phone.value = ""; 
       _adress.value = "";
       _number.value = "";
    _name.focus(); 
  }

  ModifierContact(Event e) { 
    try {
    window.localStorage["GererContact:${per.phone}"] = JSON.encode(contact.toJson()); 
    } on Exception catch (ex) { 
      window.alert("Donnée non modifiée dans La BD locale!"); 
   } 
    // disable refresh screen: 
    e.preventDefault(); 
    e.stopPropagation(); 
  } 

  lireBDLocal() { 
    listContacts = []; 
    if (window.localStorage.isNotEmpty){
    for (var cle in window.localStorage.keys) { 
        listContacts.add(cle.substring(13)); 
    } 
   } 
  } 

  constructPage() { 
// make dropdown list and fill with data: 
    var el = new Element.html(constructSelect()); 
    document.body.children.add(el); 

// preparer la table html pour l'information du contact: 
    var el1 = new Element.html(constructTable()); 
    document.body.children.add(el1); 

    sel = querySelector('#contacts'); 
    table = querySelector('#accdonnee'); 
    table.classes.remove('border'); 
  } 


  String constructSelect() { 
    var sb = new StringBuffer(); 
    sb.write('<select id="contacts">'); 
    sb.write('<option selected>Selectionner un contact:</option>'); 
    listContacts.forEach( (acc) => sb.write('<option>$acc</option>')  ); 
    sb.write('</select>'); 
    
    return sb.toString(); 
  } 

   
  String constructTable() { 
    var sb = new StringBuffer(); 
    sb.write('<table id="accdonnee" class="border">'); 
    sb.write('</table>'); 

    return sb.toString(); 
  } 


  voirContacts(Event e) { 
    table.children.clear(); 
    table.classes.remove('border'); 

    // Retourner numero selectionne: 
    sel = e.currentTarget; 
    if (sel.selectedIndex >= 1) { // un contact a été choisi 
     
      var listContact = listContacts[sel.selectedIndex - 1]; 

      var cle = 'GererContact:$listContact'; 
      String acc_json = window.localStorage[cle]; 
      _contact = new GererContact.fromJsonString(acc_json); 
      
      // Voir donnees: 
      table.classes.add('border'); 
      _name.value = _contact.proprietaire.name; 
      _email.value = _contact.proprietaire.email;
       _phone.value = _contact.proprietaire.phone; 
       _adress.value = _contact.proprietaire.adress;
       _number.value = _contact.number;
      
    } 
  } 
  
}


