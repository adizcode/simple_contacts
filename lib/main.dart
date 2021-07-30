import 'package:contacts_crud/new_contact.dart';
import 'package:flutter/material.dart';

import 'contact_list.dart';
import 'splash_screen.dart';

void main() {

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => const WelcomeScreen(),
      '/contact_list': (context) => const ContactsList(),
      '/new_contact': (context) => const NewContact(),
    },
  ));
}
