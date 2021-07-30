import 'package:flutter/material.dart';

class NewContact extends StatelessWidget {
  const NewContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController ageController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('New Contact'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 40),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 35.0),
                    labelText: 'Contact Name',
                    labelStyle: TextStyle(
                      color: Colors.blue[900],
                    ),
                    fillColor: Colors.lightBlueAccent,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(90.0),
                        borderSide: BorderSide.none),
                  ),
                  controller: nameController,
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 35.0),
                    labelText: 'Contact Age',
                    labelStyle: TextStyle(
                      color: Colors.blue[900],
                    ),
                    fillColor: Colors.lightBlueAccent,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(90.0),
                        borderSide: BorderSide.none),
                  ),
                  controller: ageController,
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, {
                      'name': nameController.text,
                      'age': ageController.text,
                    });
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
