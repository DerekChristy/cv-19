class User {
  String email;
  String name;
  String age;

  User.fromJson(Map json)
      : email = json['email'],
        name = json['name'],
        age = json['age'];
}
