import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'contact.dart';
import 'package:hive/hive.dart';

class ContactsList extends StatefulWidget {
  const ContactsList({Key? key}) : super(key: key);

  @override
  _ContactsListState createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  var contactsBox = Hive.box<Contact>('contacts');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: contactsBox.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(contactsBox.getAt(index)!.name, style: const TextStyle(letterSpacing: 2.0, fontWeight: FontWeight.bold, fontSize: 18.0),),
              subtitle: Text('${contactsBox.getAt(index)!.age} years old', style: const TextStyle(fontSize: 15.0),),
              trailing: TextButton(
                onPressed: () {
                  setState(() {
                    // Delete the contact from hivedb and rebuild widget
                    Contact current = contactsBox.getAt(index)!;
                    current.delete();
                  });
                },
                child: const Text('Delete'),
                style: TextButton.styleFrom(
                    backgroundColor: Colors.pink, primary: Colors.white),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          dynamic response = await Navigator.pushNamed(context, '/new_contact');

          Map contact = response != null ? response as Map : {};

          // Only create a new contact if the returned map isn't empty

          if (contact.isNotEmpty) {
            setState(() {
              Contact newContact = Contact(
                name: contact['name'],
                age: int.parse(contact['age']),
              );

              contactsBox.add(newContact);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
