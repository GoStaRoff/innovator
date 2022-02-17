class User {
  User({
    this.clientId,
    this.photoUrl,
    this.email,
    this.fullName,
  });

  int? clientId;
  String? photoUrl;
  String? email;
  String? fullName;

  factory User.fromJson(Map<String, dynamic> json) => User(
        clientId: json["clientId"],
        photoUrl: json["photoUrl"],
        email: json["email"],
        fullName: json["fullName"],
      );

  Map<String, dynamic> toJson() => {
        "clientId": clientId,
        "photoUrl": photoUrl,
        "email": email,
        "fullName": fullName,
      };
}
