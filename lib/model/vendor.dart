class Vendor {
  final String first_name;
  final String last_name;
  final String gender;
  final String address;

  const Vendor({
    required this.first_name,
    required this.last_name,
    required this.gender,
    required this.address,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) {
    return Vendor(
      first_name: json['first_name'],
      last_name: json['last_name'],
      gender: json['gender'],
      address: json['address'],
    );
  }
}
