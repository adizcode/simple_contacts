import 'package:flutter/material.dart';

class NewContact extends StatelessWidget {
  const NewContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController ageController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('New Contact'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
        child: Form(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const Expanded(child: Text('Contact Name')),
                Expanded(child: TextFormField(
                  controller: nameController,
                )),
              ],
            ),
            Row(
              children: [
                const Expanded(child: Text('Age')),
                Expanded(child: TextFormField(controller: ageController,)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: () {
                Navigator.pop(context, {
                  'name': nameController.text,
                  'age': ageController.text,
                });
              }, child: const Text('Submit')),
            ),
          ],
        )),
      ),
    );
  }
}
