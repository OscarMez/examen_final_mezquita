import 'package:flutter/material.dart';

class UserDetailScreen extends StatelessWidget {
  final Map<String, dynamic> user;

  UserDetailScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user['name'])),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(user['photo']),
            Text("Name: ${user['name']}"),
            Text("Email: ${user['email']}"),
            Text("Phone: ${user['phone']}"),
            Text("Address: ${user['address']}"),
          ],
        ),
      ),
    );
  }
}
