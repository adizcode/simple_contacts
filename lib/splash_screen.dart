import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'contact.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  void initContacts() async {

    await Hive.initFlutter();
    Hive.registerAdapter(ContactAdapter());

    var contacts = await Hive.openBox<Contact>('contacts');

    // Display the splash screen for a minimum of 2 seconds
    await Future.delayed(const Duration(milliseconds: 2500));

    Navigator.pushReplacementNamed(context, '/contact_list');
  }

  @override
  void initState() {
    super.initState();
    initContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.white,
        ),
      ),
    );
  }
}
