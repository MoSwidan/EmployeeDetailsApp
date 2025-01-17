class Employee {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String imageUrl;

  Employee({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.imageUrl,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'] ?? 'N/A',
      name: json['name'] ?? 'Unknown',
      email: json['email'] ?? 'N/A',
      phone: json['phone'] ?? 'N/A',
      imageUrl: json['imageUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'imageUrl': imageUrl,
    };
  }
}
