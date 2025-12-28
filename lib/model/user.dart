class User{
  final String? name;
  final String? email;
  final String? phone;
  final String? address;

  User({
    this.name,
    this.email,
    this.phone,
    this.address
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
    };
  }
}