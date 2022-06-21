class User {
  String? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? imageUrl;
  String? fcmToken;

  User({
    this.userId,
    this.firstName,
    this.lastName,
    this.email,
    this.imageUrl,
    this.fcmToken,
  });

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    imageUrl = json['imageUrl'];
    fcmToken = json['fcmToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['imageUrl'] = imageUrl;
    data['fcmToken'] = fcmToken;
    return data;
  }
}
