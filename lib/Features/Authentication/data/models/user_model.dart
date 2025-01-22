class UserModel {
  String name;
  String email;

  UserModel({
    required this.name,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'Name': name,
      'Email': email,
    };
  }

  UserModel.fromJson(Map<String, dynamic> json)
      : name = json['Name'],
        email = json['Email'];
}
