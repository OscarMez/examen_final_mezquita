import 'package:examen_final_mezquita/models/user.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final User user;
  final Function onTap;

  UserCard({required this.user, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(user.photo),
        ),
        title: Text(user.name),
        subtitle: Text(user.email),
        onTap: () => onTap(),
      ),
    );
  }
}
