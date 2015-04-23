part of contacts_library;

class Contact extends ConceptEntity<Contact> {

  // String _email;
  String _email;
  String name;
  String phone;

  String get email => _email;

  set email(String email) {
    _email = email;
    if (code == null) {
      code = email;
    }
  }

  Contact newEntity() => new Contact();

  //search by name
  bool onName(searchName) {
    return name.contains(searchName) ? true : false;
  }
  //search by email
  bool onEmail(searchEmail) {
    return email.contains(searchEmail) ? true : false;
  }

  fromJson(Map<String, Object> entityMap) {
    super.fromJson(entityMap);
    name = entityMap['name'];

    phone = entityMap['phone'];
    email = entityMap['email'];
  }
  Map<String, Object> toJson() {
    Map<String, Object> entityMap = super.toJson();
    entityMap['name'] = name;
    entityMap['email'] = email;
    entityMap['phone'] = phone;
    return entityMap;
  }
}
class Contacts extends ConceptEntities<Contact> {
  Contacts newEntities() => new Contacts();
  Contact newEntity() => new Contact();
}
