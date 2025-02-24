import 'package:firebase_database/firebase_database.dart';

class FirebaseService {
  static final DatabaseReference _db = FirebaseDatabase.instance.ref();

  static Future<List<Map<String, dynamic>>> fetchUsers() async {
    var snapshot = await _db.child('users').get();
    if (snapshot.exists) {
      List<Map<String, dynamic>> users = [];
      Map<dynamic, dynamic> usersMap = snapshot.value as Map<dynamic, dynamic>; // Aseguramos que es un Map

      usersMap.forEach((key, value) {
        users.add(value as Map<String, dynamic>); // Aseguramos que el valor también es un Map
      });

      return users;
    } else {
      throw Exception('No users found');
    }
  }

  static Future<void> addUser(Map<String, dynamic> user) async {
    await _db.child('users').push().set(user);
  }

  static Future<void> deleteUser(String userId) async {
    await _db.child('users').child(userId).remove();
  }
}
