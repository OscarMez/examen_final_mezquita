import 'package:flutter/material.dart';
import 'package:examen_final_mezquita/services/firebase_service.dart';
import 'user_list_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserListScreen()),
            );
          },
          child: Text("View Users"),
        ),
      ),
    );
  }
}
