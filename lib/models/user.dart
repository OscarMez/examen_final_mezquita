class User {
  String id;
  String name;
  String email;
  String address;
  String phone;
  String photo;

  User({required this.id, required this.name, required this.email, required this.address, required this.phone, required this.photo});

  // Convierte un mapa (json) en un objeto User
  factory User.fromMap(Map<String, dynamic> map, String id) {
    return User(
      id: id,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      address: map['address'] ?? '',
      phone: map['phone'] ?? '',
      photo: map['photo'] ?? '',
    );
  }

  // Convierte un objeto User a mapa (para almacenarlo en Firebase)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'address': address,
      'phone': phone,
      'photo': photo,
    };
  }
}
