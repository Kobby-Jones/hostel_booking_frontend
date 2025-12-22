class Owner {
  final String id;
  final String firstName;
  final String lastName;

  Owner({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
      id: json["id"] as String,
      firstName: json["firstName"] as String,
      lastName: json["lastName"] as String,
    );
  }
}
