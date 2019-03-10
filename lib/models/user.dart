class User {
  final String email;
  final String username;
  final String password;
  final String bio;
  final String image;

  User({this.email, this.username, this.password, this.bio, this.image});

  User.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        username = json['username'],
        password = json['password'],
        bio = json['bio'],
        image = json['image'];

  Map<String, dynamic> toJson() => {
        'email': email,
        'username': username,
        'password': password,
        'bio': bio,
        'image': image,
      };
}
