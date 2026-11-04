class User{
  final int? id;
  final String? name;
  final String? email;
  final String? avatar;
  final String? phone;
  final String? address;

  User({
    this.id,
    this.name,
    this.email,
    this.avatar,
    this.phone,
    this.address
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      avatar: json['avatar'],
      phone: json['phone'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'avatar': avatar,
      'phone': phone,
      'address': address,
    };
  }
}
