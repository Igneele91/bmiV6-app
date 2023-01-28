import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Benutzer Verwaltung'),
        backgroundColor: Colors.brown,
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.blueGrey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton(
                items: const [
                  DropdownMenuItem(
                    child: Text('Thomas'),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text('Nadine'),
                    value: 2,
                  ),
                  DropdownMenuItem(
                    child: Text('Lara'),
                    value: 3,
                  ),
                ],
                onChanged: (value) {},
                value: 1,
                dropdownColor: Colors.greenAccent,
                icon: const Icon(Icons.arrow_drop_down),
                iconEnabledColor: Colors.white,
                iconSize: 36,
                elevation: 16,
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: const Text('User hinzufügen'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: const Text('User löschen'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: const Text('User bearbeiten'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
