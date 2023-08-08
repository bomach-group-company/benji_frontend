class Vendor {
  final int id;
  final String email;
  final String username;

  const Vendor({
    required this.id,
    required this.email,
    required this.username,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) {
    return Vendor(
      id: json['id'],
      email: json['email'],
      username: json['username'],
    );
  }
}
