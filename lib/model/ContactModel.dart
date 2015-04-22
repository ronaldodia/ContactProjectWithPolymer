
part of contacts_library;

class ContactModel extends ConceptModel {

  static final String contact = 'Contact';

  Map<String, ConceptEntities> newEntries() {
    var contacts = new Contacts();
    var map = new Map<String, ConceptEntities>();
    map[contact] = contacts;
    return map;
  }

  Contacts get contacts => getEntry(contact);
  
  
  
  init() {
      var contact = new Contact();
      contact.code = 'univnktt@gmail.com';
      contact.name = 'EL hassen';
      contact.phone='418-555-6548';
      contacts.add(contact);

  
    }
void set contacts(Contacts contacts){
  contacts=contacts;
 /*
  *  init() {
      var contact = new Contact();
      contact.code = 'univnktt@gmail.com';
      contact.name = 'EL hassen';
      contact.phone='418-555-6548';
      contacts.add(contact);

  
    } */
  
}

}