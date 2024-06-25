class SignupDetails {
  SignupDetails({
    required this.name,
    required this.email,
    required this.password,
  });

  final String name;
  final String email;
  String password;

  factory SignupDetails.fromJson(Map<String, dynamic> json) => SignupDetails(
        name: json["name"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
      };
}
