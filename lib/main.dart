import 'package:contacts_crud/new_contact.dart';
import 'package:flutter/material.dart';

import 'contact_list.dart';
import 'splash_screen.dart';

void main() {

  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => WelcomeScreen(),
      '/contact_list': (context) => ContactsList(),
      '/new_contact': (context) => NewContact(),
    },
  ));
}
