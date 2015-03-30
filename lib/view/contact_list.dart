import 'dart:convert';
import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:ContactProjetctWithPolymer/contacts_library.dart';

@CustomTag('contact-list')
class ContactList extends PolymerElement {
  @published Contacts contacts;
  InputElement name;
  InputElement email;
  InputElement phone;
  InputElement keyword;


  ContactList.created() : super.created();

  add(Event e, var detail, Node target) {
    name = shadowRoot.querySelector("#name");
    email = shadowRoot.querySelector("#email");
    phone = shadowRoot.querySelector("#phone");
    LabelElement message = shadowRoot.querySelector("#message");
    var error = false;
    message.text = '';
    if (name.value.trim() == '') {
      message.text = 'name is mandatory; ${message.text}';
      error = true;
    }
    if (email.value.trim() == '') {
      message.text = 'email is mandatory; ${message.text}';
      error = true;
    }
    if (phone.value.trim() == '') {
      message.text = 'adress is mandatory; ${message.text}';
      error = true;
    }
    if (!error) {
      var contact = new Contact();
      contact.email = email.value;
      contact.name = name.value;
      contact.phone = phone.value;

      if (contacts.add(contact)) {
        // contacts.sort();
        save();
      } else {
        message.text = 'This email already exists';
      }
    }
  }
  update(Event e, var detail, Node target) {
      name = shadowRoot.querySelector("#name");
      email = shadowRoot.querySelector("#email");
      phone = shadowRoot.querySelector("#phone");
      LabelElement message = shadowRoot.querySelector("#message");
      var error = false;
      message.text = '';
      if (name.value.trim() == '') {
        message.text = 'name is mandatory; ${message.text}';
        error = true;
      }
      if (email.value.trim() == '') {
        message.text = 'email is mandatory; ${message.text}';
        error = true;
      }
      if (phone.value.trim() == '') {
        message.text = 'adress is mandatory; ${message.text}';
        error = true;
      }
      if (!error) {
        var contact = new Contact();
        contact.email = email.value;
        contact.name = name.value;
        contact.phone = phone.value;
        Contact c=new Contact();
        c=contacts.find(contact.email);
       try{ if (c.email!=null) {
          contacts.remove(c);
          contacts.add(contact);
          save();
        }} catch(exception, stackTrace) {
          message.text = 'email not found! Please select a row';
        }
      }
    }

  search(Event e, var detail, Node target) {
    LabelElement message = shadowRoot.querySelector("#message-search");
    keyword= shadowRoot.querySelector("#keyword");  
    if (keyword.value.trim() == '') {
      
      contacts =new Contacts();
      contacts.fromJson(JSON.decode(window.localStorage['contacts']));
      message.text = 'email not provided!';
    }else{
      contacts = contacts.select((f) => f.onName(keyword.value));
               keyword.value='';
    }
   
   // Contacts lst = new Contacts();
         
    
  }
  
  delete(Event e, var detail, Node target) {
    String email_table = target.attributes['contact-email'];
    LabelElement message = shadowRoot.querySelector("#message");
    message.text = '';
    Contact contact = contacts.find( email_table);
    
      
      if (contacts.remove(contact)) {
        save();
      }
    
  }
//remettre les données dans le formulaire pour le update
  load_update(Event e, var detail, Node target) {
    String email_table = target.attributes['contact-email'];
    Contact contact = contacts.find(email_table);
    name = shadowRoot.querySelector("#name");
    email = shadowRoot.querySelector("#email");
    phone = shadowRoot.querySelector("#phone");
    name.value = contact.name;
    email.value = contact.email;
    phone.value = contact.phone;
  }
  List<Map<String, Object>> toJson() {
    return contacts.toJson();
  }

  save() {
    window.localStorage['contacts'] = JSON.encode(toJson());
  }
  Contact find(String email) {
    for (Contact contact in contacts) {
      if (contact.email == email) return contact;
    }
    return null;
  }
}
